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
import org.sireum.bakar.symbol.TypeDecl
import org.sireum.bakar.util.TagUtil

class BakarExpRewriterModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarExpRewriterModule {
  try {
    models = for (m <- this.models) yield BakarRewriter.rewriter(m, bakarTypeUri2TypeMap)
  } catch {
    case e : Throwable =>
      info.tags += TagUtil.genUnexpectedErrorTag(e)
  }
}

object BakarRewriter {
  def rewriter(m : Model, typeMap : IMap[ResourceUri, TypeDecl]) : Model =
    new BakarRewriter(typeMap).rewrite(m)
}

class BakarRewriter(typeMap : IMap[ResourceUri, TypeDecl]) {
  type RVistor = Any => Any
  var tcounter = 0;
  var lcounter = 0;
  val tempVarPrefix = "_t"
  val locPrefix = "rwl"

  val eannot = ilistEmpty[Annotation]
  def newTempVar(typeName : String, typeUri : String) = {
    val name = tempVarPrefix + tcounter
    tcounter += 1

    val path = URIS.getPath(currentMethodUri) :+ name
    val (lvd, ret) = PilarNodeFactory.buildLocalTempVar(typeName, typeUri, path)

    this.newTempVars :+= lvd

    ret
  }

  def newLabel = {
    val label = locPrefix + lcounter
    val path = URIS.getPath(currentMethodUri) :+ label
    lcounter += 1
    Some(PilarNodeFactory.buildLocationLabel(path))
  }

  var clhs : Option[Exp] = None
  var prelocs = ilistEmpty[LocationDecl]
  var postlocs = ilistEmpty[LocationDecl]
  var newTempVars = ilistEmpty[LocalVarDecl]

  var currentMethodUri : ResourceUri = null

  def getTypeUri(e : Exp) : String = {
    assert(URIS.hasTypeUri(e))
    URIS.getTypeUri(e)
  }

  def copyMap[T <: PilarAstNode](orig : T, n : T) : T = {
    n.propertyMap ++= orig.propertyMap
    n
  }

  val rewriter = Rewriter.build[LocationDecl]({
    case l : LocationDecl => l
    case b @ BinaryExp(o, l, r) =>
      val btype = typeMap(getTypeUri(b))
      val ltype = typeMap(getTypeUri(l))
      val rtype = typeMap(getTypeUri(r))

      val le = newTempVar(ltype.id, ltype.uri)
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, le, ":=", l))

      val re = newTempVar(rtype.id, rtype.uri)
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, re, ":=", r))

      val be = copyMap(b, BinaryExp(o, le, re))
      URIS.addTypeUri(be, btype.uri)
    case e @ AccessExp(NameExp(NameUser(n)), attributeName) => e
    case e @ AccessExp(exp, attributeName) =>
      val etype = typeMap(getTypeUri(e))
      val exptype = typeMap(getTypeUri(exp))
      val te = newTempVar(exptype.id, exptype.uri)
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, te, ":=", exp))
      clhs match {
        case Some(cexp) if cexp eq e =>
          postlocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, exp, ":=", te))
        case _ =>
      }
      val ae = copyMap(e, AccessExp(te, attributeName))
      URIS.addTypeUri(ae, etype.uri)
    case e @ IndexingExp(NameExp(NameUser(n)), indices) => e
    case e @ IndexingExp(exp, indices) =>
      val etype = typeMap(getTypeUri(e))
      val exptype = typeMap(getTypeUri(exp))
      val te = newTempVar(exptype.id, exptype.uri)
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, te, ":=", exp))
      clhs match {
        case Some(cexp) if cexp eq e =>
          postlocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, exp, ":=", te))
        case _ =>
      }

      val ie = copyMap(e, IndexingExp(te, indices))
      URIS.addTypeUri(ie, etype.uri)

    // the rest of these are sanity checks
    case te : TupleExp  => te // tuple exp don't need a type
    case fe : FunExp    => fe
    case se : SwitchExp => se
    case e @ CallExp(NameExp(n), _) =>
      assert(n.uri.startsWith("ada://procedure") || URIS.hasTypeUri(e))
      e
    case e @ NameExp(n) =>
      assert(n.uri.startsWith("ada://procedure") || n.uri.startsWith("ada://function") ||
        URIS.hasTypeUri(e))
      e
    case e : Exp =>
      if (!URIS.hasTypeUri(e))
        print(e)
      assert(URIS.hasTypeUri(e))
      e
  }, Rewriter.TraversalMode.BOTTOM_UP, true)

  def rewrite(m : Model) : Model = {
    var packages = ilistEmpty[PackageDecl]
    Visitor.build({
      case p @ PackageDecl(packName, _, elements) =>
        var elems = ivectorEmpty[PackageElement]
        elements.foreach {
          case pd @ ProcedureDecl(methName, a, tv, params, rt, va, body : ImplementedBody) => {

            var locmap = ilinkedMapEmpty[LocationDecl, (ISeq[LocationDecl], ISeq[LocationDecl])]

            currentMethodUri = methName.uri

            for (l <- body.locations) {
              clhs = None
              var rewrite = false
              l match {
                case ActionLocation(_, _, AssignAction(_, lhs, _, _)) =>
                  rewrite = true
                  lhs match {
                    case a : AccessExp   => clhs = Some(lhs)
                    case i : IndexingExp => clhs = Some(lhs)
                    case _               =>
                  }
                case ActionLocation(_, _, AssertAction(_, CallExp(NameExp(nu), _), _)) =>
                  rewrite = !URIS.isUIFUri(nu.uri)
                case ActionLocation(_, _, AssumeAction(_, CallExp(NameExp(nu), _), _)) =>
                  rewrite = !URIS.isUIFUri(nu.uri)
                case _ =>
                  rewrite = true
              }
              prelocs = ilistEmpty[LocationDecl]
              postlocs = ilistEmpty[LocationDecl]

              val rl = if (rewrite) rewriter(l) else l
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
        packages :+= PilarNodeFactory.buildPackageDecl(p.name.get, p.annotations, elems)
        false
    })(m)
    Model(m.sourceURI, m.annotations, packages)
  }
}

case class BakarExpRewriter(

  title : String = "Bakar Exp Rewriter",
  @Input bakarTypeUri2TypeMap : IMap[ResourceUri, TypeDecl],
  @Input @Output models : ISeq[Model])

object BakarExpRewriter {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/compiler/rewriter"
    val cname = BakarExpRewriter.getClass.getName.dropRight(1)

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cname)

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}