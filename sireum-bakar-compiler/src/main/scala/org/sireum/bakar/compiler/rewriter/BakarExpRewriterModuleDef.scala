package org.sireum.bakar.compiler.rewriter

import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.pipeline.Input
import org.sireum.pipeline.Output
import org.sireum.option.PipelineMode
import org.sireum.util._
import org.sireum.pilar.ast._
import org.sireum.pilar.pretty.NodePrettyPrinter
import org.sireum.bakar.compiler.module.URIS
import org.sireum.bakar.compiler.module.PilarNodeFactory

class BakarExpRewriterModuleDef(val job: PipelineJob, info: PipelineJobModuleInfo) extends BakarExpRewriterModule {
  var r = ilistEmpty[Model]
  for (m <- this.models) {
    r :+= BakarRewriter.rewriter(m)
  }
  this.models = r
}

object BakarRewriter {
  def rewriter(m: Model): Model = new BakarRewriter().rewrite(m)
}

class BakarRewriter {
  type RVistor = Any => Any
  var tcounter = 0;
  var lcounter = 0;
  val tempVarPrefix = "_t"
  val locPrefix = "rwl"

  val SCHEME = "ada"
  val TEMP_VAR_TYPE = "variable_temp"

  val eannot = ilistEmpty[Annotation]
  def newTempVar(typeName: String, typeUri: String) = {
    val name = tempVarPrefix + tcounter
    tcounter += 1
    
    val path = ilist(this.currentPackage, this.currentMethod, name)
    val (lvd, ret) = PilarNodeFactory.buildLocalTempVar(typeName, typeUri, path)

    this.newTempVars :+= lvd

    ret
  }

  def newLabel = {
    import org.sireum.pilar.symbol.Symbol
    import java.net.URI

    val s = locPrefix + lcounter
    val ret = NameDefinition(s)
    val uri = new URI(s)
    ret.uri(uri.getScheme, uri.getAuthority, uri.getPath().split("/").toList, s)
    lcounter += 1
    Some(ret)
  }

  var clhs: Option[Exp] = None
  var prelocs = ilistEmpty[LocationDecl]
  var postlocs = ilistEmpty[LocationDecl]
  var newTempVars = ilistEmpty[LocalVarDecl]

  var currentPackage: String = null
  var currentMethod: String = null

  def getTypeUri(e: Exp): String = {
    assert(e ? URIS.TYPE_URI)
    e(URIS.TYPE_URI)
  }

  def copyMap[T <: PilarAstNode](orig: T, n: T): T = {
    n.propertyMap ++= orig.propertyMap
    n
  }

  val rewriter = Rewriter.build[LocationDecl]({
    case l: LocationDecl => l
    case b @ BinaryExp(o, l, r) =>
      val btype = getTypeUri(b)
      val ltype = getTypeUri(l)
      val rtype = getTypeUri(r)

      val le = newTempVar("FIXME", ltype)
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, le, ":=", l))

      val re = newTempVar("FIXME", rtype)
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, re, ":=", r))

      val be = copyMap(b, BinaryExp(o, le, re))
      be(URIS.TYPE_URI) = btype
      be
    case e @ AccessExp(NameExp(NameUser(n)), attributeName) => e
    case e @ AccessExp(exp, attributeName) =>
      val etype = getTypeUri(e)
      val exptype = getTypeUri(exp)
      val te = newTempVar("FIXME", exptype)
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, te, ":=", exp))
      clhs match {
        case Some(cexp) if cexp eq e =>
          postlocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, exp, ":=", te))
        case _ =>
      }
      val ae = copyMap(e, AccessExp(te, attributeName))
      ae(URIS.TYPE_URI) = etype
      ae
    case e @ IndexingExp(NameExp(NameUser(n)), indices) => e
    case e @ IndexingExp(exp, indices) =>
      val etype = getTypeUri(e)
      val exptype = getTypeUri(exp)
      val te = newTempVar("FIXME", exptype)
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, te, ":=", exp))
      clhs match {
        case Some(cexp) if cexp eq e =>
          postlocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, exp, ":=", te))
        case _ =>
      }

      val ie = copyMap(e, IndexingExp(te, indices))
      ie(URIS.TYPE_URI) = etype
      ie

    // the rest of these are sanity checks
    case te: TupleExp => te // tuple exp don't need a type
    case fe: FunExp => fe
    case se: SwitchExp => se
    case e @ CallExp(NameExp(n), _) =>
      assert(n.uri.startsWith("ada://procedure") || e ? URIS.TYPE_URI)
      e
    case e @ NameExp(n) =>
      assert(n.uri.startsWith("ada://procedure") || n.uri.startsWith("ada://function") ||
        e ? URIS.TYPE_URI)
      e
    case e: Exp =>
      if (!(e ? URIS.TYPE_URI))
        print(e)
      assert(e ? URIS.TYPE_URI)
      e
  }, Rewriter.TraversalMode.BOTTOM_UP, true)

  def rewrite(m: Model): Model = {
    var packages = ilistEmpty[PackageDecl]
    Visitor.build({
      case p @ PackageDecl(packName, _, elements) =>
        var elems = ivectorEmpty[PackageElement]
        this.currentPackage = packName.get.name
        elements.foreach {
          case pd @ ProcedureDecl(methName, a, tv, params, rt, va, body: ImplementedBody) => {

            var locmap = ilinkedMapEmpty[LocationDecl, (ISeq[LocationDecl], ISeq[LocationDecl])]

            this.currentMethod = methName.name

            for (l <- body.locations) {
              clhs = None
              l match {
                case ActionLocation(_, _, AssignAction(_, lhs, _, _)) =>
                  lhs match {
                    case a: AccessExp => clhs = Some(lhs)
                    case i: IndexingExp => clhs = Some(lhs)
                    case _ =>
                  }
                case _ =>
              }
              prelocs = ilistEmpty[LocationDecl]
              postlocs = ilistEmpty[LocationDecl]

              val rl = rewriter(l)
              locmap += (rl -> (prelocs, postlocs))
            }
            
            import org.sireum.bakar.symbol.BakarSymbol._
            val x = locmap.flatMap { s => (s._2._1 :+ s._1) ++ s._2._2 }
            val _body = ImplementedBody(body.locals ++ this.newTempVars, x.toList, body.catchClauses)
            val parentUri = pd.parentUri.get
            val modpd = PilarNodeFactory.buildProcedureDecl(methName, parentUri, params, rt, _body) 
            copyMap(pd, modpd)
            elems :+= modpd

            this.newTempVars = ilistEmpty[LocalVarDecl]
          }
          case o => elems :+= o
        }
        packages :+= PackageDecl(p.name, p.annotations, elems)
        false
    })(m)
    Model(m.sourceURI, m.annotations, packages)
  }
}

case class BakarExpRewriter(

  title: String = "Bakar Exp Rewriter",

  @Input @Output models: ISeq[Model])

object BakarExpRewriter {
  def main(args: Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/compiler/rewriter"
    val cname = BakarExpRewriter.getClass.getName.dropRight(1)

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cname)

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}