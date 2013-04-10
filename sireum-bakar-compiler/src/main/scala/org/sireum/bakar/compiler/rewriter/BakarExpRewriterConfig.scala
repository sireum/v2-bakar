package org.sireum.bakar.compiler.rewriter

import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.pipeline.Input
import org.sireum.pipeline.Output
import org.sireum.option.PipelineMode
import org.sireum.pipeline.gen.ModuleGenerator
import org.sireum.util._
import org.sireum.pilar.ast._
import org.sireum.pilar.pretty.NodePrettyPrinter

class BakarExpRewriterModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarExpRewriterModule {
  var r = ilistEmpty[Model]
  for (m <- this.models) {
    r :+= BakarRewriter.rewriter(m)
  }
  this.models = r
}

object BakarRewriter {
  def rewriter(m : Model) : Model = new BakarRewriter().rewrite(m)
}

class BakarRewriter {
  type RVistor = Any => Any
  var tcounter = 0;
  var lcounter = 0;
  val tempVarPrefix = "_t"
  val locPrefix = "rwl"

  val eannot = ilistEmpty[Annotation]
  def newTempVar = {
    val ret = NameExp(NameUser(tempVarPrefix + tcounter))
    tcounter += 1
    ret
  }

  def newLabel = {
    val ret = NameDefinition(locPrefix + lcounter)
    lcounter += 1
    Some(ret)
  }

  var clhs : Option[Exp] = None
  //var locmap = ilinkedMapEmpty[LocationDecl, (ISeq[LocationDecl], ISeq[LocationDecl])]
  var prelocs = ilistEmpty[LocationDecl]
  var postlocs = ilistEmpty[LocationDecl]
  var vars = ilistEmpty[LocalVarDecl]

  val rewriter = Rewriter.build[LocationDecl]({
    /*
    case p @ ProcedureDecl(name, annotations, typeVars, params, returnType, varArity, body : ImplementedBody) =>
      val x = locmap.flatMap { s => (s._2._1 :+ s._1) ++ s._2._2 }

      val newBody = ImplementedBody(body.locals,
        x.toList,
        body.catchClauses)

      ProcedureDecl(name, annotations, typeVars, params, returnType, varArity, newBody)
      */
    case l : LocationDecl =>
      //locmap += (l -> (prelocs, postlocs))
      //prelocs = ilistEmpty[LocationDecl]
      //postlocs = ilistEmpty[LocationDecl]
      l
    case BinaryExp(o, l, r) =>

      val le = newTempVar
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, le, ":=", l))

      val re = newTempVar
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, re, ":=", r))

      BinaryExp(o, le, re)
    case e @ AccessExp(NameExp(NameUser(n)), attributeName) => e
    case e @ AccessExp(exp, attributeName) =>
      val te = newTempVar
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, te, ":=", exp))
      clhs match {
        case Some(cexp) if cexp eq e =>
          postlocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, exp, ":=", te))
        case _ =>
      }
      AccessExp(te, attributeName)
    case e @ IndexingExp(NameExp(NameUser(n)), indices) => e
    case e @ IndexingExp(exp, indices) =>
      val te = newTempVar
      prelocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, te, ":=", exp))
      println(e)
      clhs match {
        case Some(cexp) if cexp eq e =>
          postlocs :+= ActionLocation(newLabel, eannot, AssignAction(eannot, exp, ":=", te))
        case _ =>
      }

      val ie = IndexingExp(te, indices)
      ie.propertyMap ++= e.propertyMap
      ie
  }, Rewriter.TraversalMode.BOTTOM_UP)

  def rewrite(m : Model) : Model = {
    var packages = ilistEmpty[PackageDecl]
    Visitor.build({
      case p : PackageDecl =>
        var elems = ivectorEmpty[PackageElement]
        p.elements.foreach {
          case p @ ProcedureDecl(n, a, tv, params, rt, va, body : ImplementedBody) => {

            var locmap = ilinkedMapEmpty[LocationDecl, (ISeq[LocationDecl], ISeq[LocationDecl])]

            for (l <- body.locations) {
              clhs = None
              l match {
                case ActionLocation(_, _, AssignAction(_, lhs, _, _)) =>
                  lhs match {
                    case a : AccessExp   => clhs = Some(lhs)
                    case i : IndexingExp => clhs = Some(lhs)
                    case _               =>
                  }
                case _ =>
              }
              prelocs = ilistEmpty[LocationDecl]
              postlocs = ilistEmpty[LocationDecl]

              val rl = rewriter(l)
              locmap += (rl -> (prelocs, postlocs))
            }

            val x = locmap.flatMap { s => (s._2._1 :+ s._1) ++ s._2._2 }
            val pd = ProcedureDecl(n, a, tv, params, rt, va,
              ImplementedBody(body.locals, x.toList, body.catchClauses))
            pd.propertyMap ++= p.propertyMap
            elems :+= pd
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

  title : String = "Bakar Exp Rewriter",

  @Input @Output models : ISeq[Model])

object BakarExpRewriter {
  def main(args : Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(BakarExpRewriter.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/compiler/rewriter"

    ModuleGenerator.run(opt)
  }
}