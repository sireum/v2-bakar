package org.sireum.bakar.compiler.rewriter

import org.sireum.pilar.ast.ConstDecl
import org.sireum.pilar.ast.Exp
import org.sireum.pilar.ast._
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.util.Exec
import org.sireum.util._
import org.sireum.util.ResourceUri
import org.sireum.util.Visitor
import org.sireum.util.mmapEmpty
import org.sireum.pipeline._
import org.sireum.util.Rewriter
import org.sireum.bakar.compiler.module.URIS
import org.sireum.bakar.symbol.TypeDecl
import org.sireum.bakar.symbol._

class ConstantRewriterModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends ConstantRewriterModule {
  implicit def ee(p : PilarAstNode) = p.asInstanceOf[Exp]

  val map = mmapEmpty[ResourceUri, Exp]
  val typeAlias = mlistEmpty[TypeAliasDecl]
  val procs = mlistEmpty[ProcedureDecl]
  val v = Visitor.build {
    case pd: ProcedureDecl =>
      import org.sireum.bakar.symbol.BakarSymbol._
      if(pd.pre.isDefined || pd.post.isDefined || pd.postRefined.isDefined)
        procs += pd
      false
    case i : TypeAliasDecl =>
      typeAlias += i
      false
    case ConstDecl(name, _, elements) =>
      for (e <- elements) {
        val exp = e.exp.asInstanceOf[CastExp].exp
        assert(URIS.hasTypeUri(exp))
        map(e.name.uri) = exp
      }
      false
  }
  for (m <- models) v(m)

  if (!map.isEmpty) {
    val r = Rewriter.build[PilarAstNode]({
      case ne @ NameExp(nu) =>
        if (map.contains(nu.uri)) map(nu.uri)
        else ne
    }, Rewriter.TraversalMode.TOP_DOWN, true)

    models = for (m <- models) yield r(m).asInstanceOf[Model]

    import org.sireum.bakar.symbol.BakarSymbol._
    for(pd <- procs) {
      if(pd.pre.isDefined) pd.pre = r(pd.pre.get)
      if(pd.post.isDefined) pd.post = r(pd.post.get)
      if(pd.postRefined.isDefined) pd.postRefined = r(pd.postRefined.get)
    }
    
    val rtd = Rewriter.build[Type]({
      case i : SimpleRangeConstraint =>
        SimpleRangeConstraint(r(i.lower), r(i.upper))
      case i : ModularTypeDef => r(i.modExp)
      case i : SignedIntegerTypeDef =>
        SignedIntegerTypeDef(
          if (i.lowRangeExp.isDefined) Some(r(i.lowRangeExp.get)) else None,
          if (i.highRangeExp.isDefined) Some(r(i.highRangeExp.get)) else None)
    }, Rewriter.TraversalMode.TOP_DOWN, true)

    for (ta <- typeAlias)
      URIS.addTypeDef(ta, rtd(URIS.getTypeDef(ta)).asInstanceOf[TypeDecl])
  }
}

case class ConstantRewriter(
  title : String = "Constant Rewriter Module",

  @Input @Output models : ISeq[Model])

object ConstantRewriter {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/compiler/rewriter"
    val cnames = Array(ConstantRewriter.getClass.getName.dropRight(1))

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))

    val e = new Exec()
    // current sireum dist may not have the needed sireum classes so use 
    // eclipse's classpath instead
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}