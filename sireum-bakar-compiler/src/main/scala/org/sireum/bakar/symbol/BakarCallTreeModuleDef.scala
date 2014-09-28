package org.sireum.bakar.symbol

import org.sireum.util.ResourceUri
import org.sireum.pipeline.Input
import org.sireum.util.ISeq
import org.jgrapht.graph.DirectedMultigraph
import org.sireum.pilar.ast.Model
import java.io.File
import org.sireum.util.Exec
import org.sireum.pipeline.Output
import org.sireum.pilar.ast.LocationDecl
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.pilar.ast.ProcedureDecl
import org.sireum.util.VisitorFunction
import org.sireum.pilar.ast.ActionLocation
import org.sireum.pilar.ast.JumpLocation
import org.sireum.pilar.ast.NameExp
import org.sireum.util.Visitor
import org.sireum.bakar.compiler.module.TranslatorUtil
import org.sireum.bakar.compiler.module.URIS
import org.sireum.util.mlistEmpty
import org.sireum.util.msetEmpty
import org.sireum.util.MSet
import org.sireum.util.MList
import scala.collection.JavaConversions._
import org.sireum.util.FileResourceUri
import org.jgrapht.ext.VertexNameProvider
import java.io.FileWriter
import org.jgrapht.ext.DOTExporter
import java.io.StringWriter
import org.sireum.util.CSet
import org.jgrapht.alg.StrongConnectivityInspector
import org.sireum.bakar.util.TagUtil

case class CallInfo(
  val location : LocationDecl,
  val name : NameExp,
  val target : ProcedureDecl,
  val source : ProcedureDecl)

trait CallTree {
  val graph : DirectedMultigraph[ProcedureDecl, CallInfo]
  val symbolTable : BakarSymbolTable

  def getAllInfo = graph.edgeSet

  def getCalleeInfo(m : ProcedureDecl) = graph.outgoingEdgesOf(m)

  def getCallerInfo(m : ProcedureDecl) = graph.incomingEdgesOf(m)

  def stronglyConnectedSets : Iterable[CSet[ProcedureDecl]] = {
    import scala.collection.JavaConversions._

    val sci = new StrongConnectivityInspector[ProcedureDecl, CallInfo](graph)
    sci.stronglyConnectedSets.map { s => s : CSet[ProcedureDecl] }
  }

  def outputCallTree = {
    val vnp = new VertexNameProvider[ProcedureDecl] {
      def getVertexName(m : ProcedureDecl) = "\"" + m.name.uri + "\""
    }
    val vnp2 = new VertexNameProvider[ProcedureDecl] {
      def getVertexName(m : ProcedureDecl) = {
        import org.sireum.bakar.symbol.BakarSymbol._
        val pack = symbolTable.package_(m.parentUri.get)
        pack.name.get.name + "." + m.name.name
      }
    }
    val sw = new StringWriter
    new DOTExporter[ProcedureDecl, CallInfo](vnp, vnp2, null).export(sw, this.graph)
    sw.toString
  }

  def outputCallTree(fileName : FileResourceUri) {
    val fw = new FileWriter(new File(fileName))
    fw.write(outputCallTree)
    fw.close

    //val dot = System.getenv.get("SIREUM_HOME") + "/apps/graphviz/bin/dot"
    val dot = "/usr/local/bin/dot"
    val args = List(dot, "-Tpdf", "-o", fileName + ".pdf", fileName)
    new Exec().run(10000, args, None)
  }

  private def postOrder(result : MList[ProcedureDecl], seen : MSet[ProcedureDecl],
                        m : ProcedureDecl) : Unit = {
    for (ci <- graph.outgoingEdgesOf(m)) {
      val q = ci.target
      if (!seen.contains(q)) {
        seen += q
        postOrder(result, seen, q)
      }
    }
    result += m
  }

  def postOrders : MList[ProcedureDecl] = {
    val result = mlistEmpty[ProcedureDecl]
    val seen = msetEmpty[ProcedureDecl]
    for (p <- graph.vertexSet)
      if (graph.inDegreeOf(p) == 0)
        postOrder(result, seen, p)
    result
  }
}

class BakarCallTreeModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarCallTreeModule {
  type BVisitor = Any => Boolean

  class Context {
    var currentLoc : LocationDecl = null
    var currentProc : ProcedureDecl = null
    val graph = new DirectedMultigraph[ProcedureDecl, CallInfo](classOf[CallInfo])
  }

  val ctx = new Context

  def impl(v : => BVisitor) : VisitorFunction = {
    case o : ActionLocation =>
      ctx.currentLoc = o
      v(o.action)
      ctx.currentLoc = null
      false
    case o : JumpLocation =>
      ctx.currentLoc = o
      v(o.jump)
      ctx.currentLoc = null
      false
    case o : NameExp =>
      if (ctx.currentLoc != null) {
        val uri = o.name.uri

        if (URIS.isAdaMethodUri(uri) && symbolTable.procedures.contains(uri)) {
          val target =
            if (URIS.isAdaMethodSpecUri(uri)) {
              val cand = symbolTable.procedures(uri) - uri
              if (cand.size == 1) cand.head
              else uri
            } else uri

          val _target = this.symbolTable.procedureSymbolTable(target).procedure
          ctx.graph.addVertex(_target)
          val edge = CallInfo(
            location = ctx.currentLoc,
            name = o,
            target = _target,
            source = ctx.currentProc)

          ctx.graph.addEdge(ctx.currentProc, _target, edge)
        }
      }
      false
    case o : ProcedureDecl =>
      ctx.currentProc = o
      ctx.graph.addVertex(o)
      v(o.body)
      ctx.currentProc = null
      false
  }

  def theVisitor : BVisitor = b

  val b = Visitor.build(impl(theVisitor))

  try {
    for (m <- this.models) b(m)

    this.callTree = new CallTree {
      val graph = ctx.graph
      val symbolTable = BakarCallTreeModuleDef.this.symbolTable
    }
  } catch {
    case e : Throwable =>
      info.tags += TagUtil.genUnexpectedErrorTag(e)
  }
}

case class BakarCallTree(
  title : String = "Bakar Kiasan Call Tree",
  @Input models : ISeq[Model],
  @Input symbolTable : BakarSymbolTable,
  @Output callTree : CallTree)

object BakarKiasanCallTree {
  def main(args : Array[String]) {
    val cnames = Array(BakarCallTree.getClass.getName.dropRight(1))

    val bindir = Some(new File("./bin"))
    val destdir = "../src/main/scala/org/sireum/bakar/symbol/"

    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))

    val e = new Exec()
    // current sireum dist may not have the needed sireum classes so use 
    // eclipse's classpath instead
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, bindir))
  }
}