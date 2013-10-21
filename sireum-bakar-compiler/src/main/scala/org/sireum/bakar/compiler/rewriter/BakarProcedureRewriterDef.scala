package org.sireum.bakar.compiler.rewriter

import org.sireum.bakar.compiler.module.URIS
import org.sireum.bakar.symbol.BakarSymbol.pd2pi
import org.sireum.bakar.symbol.BakarSymbolTable
import org.sireum.bakar.symbol.Mode
import org.sireum.pilar.ast._
import org.sireum.pilar.symbol.Symbol.pp2r
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.util.Exec
import org.sireum.util._
import org.sireum.util.Rewriter
import org.sireum.util.ilistEmpty
import org.sireum.pipeline.Input
import org.sireum.pipeline.Output

object Names {
  val tempVarPrefix = "_tbpr"
  val locationPrefix = "_lbpr"
}

class BakarProcedureRewriterModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarProcedureRewriterModule {
  def cp[T <: PilarAstNode](a : T, b : T) : T = {
    b.propertyMap ++= a.propertyMap
    b
  }

  var currentPackage : String = null

  /* we only need to rewrite Ada procedures (i.e. pilar procedures which return
   * nothing).  Spark functions can't call a procedure which contains out
   * params so no copy backs need to be performed.  
   *   f[i] := P(f[i])
   */
  val rewriter = Rewriter.build[PilarAstNode]({
    case pd @ PackageDecl(name, a, e) =>
      currentPackage = name.get.name
      pd
    case pd @ ProcedureDecl(procName, a, t, params, None, v, ib @ ImplementedBody(locals, locations, cc)) =>
      val outParams = params.filter { p => p.mode != Mode.IN }

      if (!outParams.isEmpty) {
        val te = TupleExp(outParams.map(p =>
          NameExp(URIS.addResourceUri(NameUser(p.name.name), p.name.uri))))

        val lastLoc = locations(locations.size - 1) match {
          case jl @ JumpLocation(label, annots, ReturnJump(retAnnots, None)) =>
            cp(jl, JumpLocation(label, annots, ReturnJump(retAnnots, Some(te))))
          case jl => throw new RuntimeException("Unexpected final location: " + jl)
        }

        val newlocs = locations.take(locations.size - 1) :+ lastLoc

        var tempCounter = 0
          def nextCounter = {
            tempCounter += 1
            tempCounter
          }

        var newTempLocals = ivectorEmpty[LocalVarDecl]
          def newPath = ilist(currentPackage, procName.name, Names.tempVarPrefix + nextCounter)
          def newLocLabel = RewriteUtil.createLocationLabel(Names.locationPrefix + nextCounter)

          def rewriteCallJumps(l : LocationDecl) : ISeq[LocationDecl] = {
            l match {
              case jl @ JumpLocation(jn, ja,
                cj @ CallJump(a, lhss, ce @ CallExp(NameExp(nu), TupleExp(args)), jump)) if (lhss.isEmpty) =>
                val calledProc = this.symbolTable.procedureSymbolTable(nu.uri).procedure

                var prelocs = ivectorEmpty[LocationDecl]
                var postlocs = ivectorEmpty[LocationDecl]
                var _lhss = ivectorEmpty[NameExp]
                var modArgs = ivectorEmpty[Exp]
                for (i <- 0 to calledProc.params.size - 1) {
                  if (calledProc.params(i).mode != Mode.IN) {
                    val ptypeSpec = calledProc.params(i).typeSpec.get.asInstanceOf[NamedTypeSpec]
                    val lhsTypeName : String = ptypeSpec.name.name
                    val lhsTypeUri : String = ptypeSpec.name(URIS.REF_URI)
                    val (lhsLvd, lhsTempVar) = RewriteUtil.createTempVar(lhsTypeName, lhsTypeUri, newPath)
                    newTempLocals +:= lhsLvd
                    _lhss :+= lhsTempVar
                      def rewriteComplexExp(e : Exp) : Exp = {
                        e match {
                          case ie @ IndexingExp(e, indices) =>
                            val modIndices = for (index <- indices) yield {
                              val iuri : String = e(URIS.TYPE_URI)
                              val (lvd, tempVar) = RewriteUtil.createTempVar("FIXME", iuri, newPath)
                              newTempLocals +:= lvd
                              prelocs :+= ActionLocation(Some(newLocLabel), ivectorEmpty,
                                AssignAction(ilist(Annotation(NameUser("IN"), ivectorEmpty)),
                                  tempVar, ":=", index))
                              tempVar
                            }
                            cp(ie, IndexingExp(rewriteComplexExp(e), modIndices))
                          case a @ AccessExp(e, an) => cp(a, AccessExp(rewriteComplexExp(e), an))
                          case _                    => e
                        }
                      }
                    val modArg = cp(args(i), rewriteComplexExp(args(i)))

                    postlocs :+= ActionLocation(Some(newLocLabel), ivectorEmpty,
                      AssignAction(ilist(Annotation(NameUser("OUT"), ivectorEmpty)),
                        modArg, ":=", lhsTempVar))

                    modArgs :+= modArg
                  } else {
                    modArgs :+= args(i)
                  }
                }
                val modJL = cp(jl, JumpLocation(jn, ja,
                  cp(cj, CallJump(a, _lhss,
                    cp(ce, CallExp(NameExp(nu), TupleExp(modArgs))), jump))))

                (prelocs :+ modJL) ++ postlocs
              case _ => ivector(l)
            }
          }

        val modLocs = newlocs.map(rewriteCallJumps(_)).flatten
        val modLocals = locals ++ newTempLocals

        cp(pd, ProcedureDecl(procName, a, t, params, None, v, cp(ib, ImplementedBody(modLocals, modLocs, cc))))
      } else pd
  }, Rewriter.TraversalMode.TOP_DOWN, true)

  this.models = this.models.map(m => rewriter(m).asInstanceOf[Model])
}

case class BakarProcedureRewriter(
  title : String = "Bakar Procedure Rewriter",

  @Input symbolTable : BakarSymbolTable,

  @Input @Output models : ISeq[Model])

object Gen {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/compiler/rewriter"
    val cname = BakarProcedureRewriter.getClass.getName.dropRight(1)

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cname)

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}