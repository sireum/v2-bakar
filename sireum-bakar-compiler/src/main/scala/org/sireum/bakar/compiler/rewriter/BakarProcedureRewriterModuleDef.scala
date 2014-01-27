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
import org.sireum.bakar.compiler.module.{ PilarNodeFactory => PNF }
import org.sireum.bakar.symbol.TypeDecl

object Names {
  val tempVarPrefix = "_tbpr"
  val locationPrefix = "_lbpr"
}

class BakarProcedureRewriterModuleDef(val job: PipelineJob, info: PipelineJobModuleInfo) extends BakarProcedureRewriterModule {
  def cp[T <: PilarAstNode](a: T, b: T): T = {
    b.propertyMap ++= a.propertyMap
    b
  }

  var currentPackage: String = null

  def rewriteCallJumps(procNameUri: ResourceUri, locs: ISeq[LocationDecl]) = {
    var tempCounter = 0
    def nextCounter = {
      tempCounter += 1
      tempCounter
    }

    var newTempLocals = ivectorEmpty[LocalVarDecl]
    def newPath = URIS.getPath(procNameUri) :+ Names.tempVarPrefix + nextCounter
    def newLocLabel = {
      val labelName = Names.locationPrefix + nextCounter
      PNF.buildLocationLabel(URIS.getPath(procNameUri) :+ labelName)
    }

    def rewriteCallJumps(l: LocationDecl): ISeq[LocationDecl] = {
      l match {
        case jl @ JumpLocation(jn, ja,
          cj @ CallJump(a, lhss, ce @ CallExp(ne @ NameExp(nu), TupleExp(args)), jump)) if (lhss.isEmpty) =>
          val calledProc = symbolTable.procedureSymbolTable(nu.uri).procedure

          var prelocs = ivectorEmpty[LocationDecl]
          var postlocs = ivectorEmpty[LocationDecl]
          var _lhss = ivectorEmpty[NameExp]
          var modArgs = ivectorEmpty[Exp]
          for (i <- 0 to calledProc.params.size - 1) {
            if (calledProc.params(i).mode != Mode.IN) {
              val ptypeSpec = calledProc.params(i).typeSpec.get.asInstanceOf[NamedTypeSpec]
              val lhsTypeName: String = ptypeSpec.name.name
              val lhsTypeUri: ResourceUri = URIS.getTypeUri(ptypeSpec)
              val (lhsLvd, lhsTempVar) = PNF.buildLocalTempVar(lhsTypeName, lhsTypeUri, newPath)
              newTempLocals +:= lhsLvd
              _lhss :+= lhsTempVar
              def rewriteComplexExp(e: Exp): Exp = {
                e match {
                  case ie @ IndexingExp(e, indices) =>
                    val modIndices = for (index <- indices) yield {
                      val typ = bakarTypeUri2TypeMap(URIS.getTypeUri(e))
                      val (lvd, tempVar) = PNF.buildLocalTempVar(typ.id, typ.uri, newPath)
                      newTempLocals +:= lvd
                      prelocs :+= ActionLocation(Some(newLocLabel), ivectorEmpty,
                        AssignAction(ivectorEmpty, tempVar, ":=", index))
                      tempVar
                    }
                    cp(ie, IndexingExp(rewriteComplexExp(e), modIndices))
                  case a @ AccessExp(e, an) => cp(a, AccessExp(rewriteComplexExp(e), an))
                  case _ => e
                }
              }
              val modArg = cp(args(i), rewriteComplexExp(args(i)))

              postlocs :+= ActionLocation(Some(newLocLabel), ivectorEmpty,
                AssignAction(ivectorEmpty, modArg, ":=", lhsTempVar))

              modArgs :+= modArg
            } else {
              modArgs :+= args(i)
            }
          }
          val typeUri = if (URIS.hasTypeUri(ce)) Some(URIS.getTypeUri(ce))
          else None

          val modJL = cp(jl, JumpLocation(jn, ja,
            cp(cj, CallJump(a, _lhss,
              cp(ce, PNF.buildCallExp(ne, typeUri, TupleExp(modArgs))), jump))))

          (prelocs :+ modJL) ++ postlocs
        case _ => ivector(l)
      }
    }

    val modLocs = locs.flatMap(rewriteCallJumps(_))
    val modLocals = newTempLocals
    (modLocs, modLocals)
  }

  val rewriter = Rewriter.build[PilarAstNode]({
    case pd @ PackageDecl(name, a, e) =>
      currentPackage = name.get.name
      pd
    case pd @ ProcedureDecl(procName, a, t, params, None, v, ib @ ImplementedBody(locals, locations, cc)) =>
      val outParams = params.filter { p => p.mode != Mode.IN }

      if (!outParams.isEmpty) {
        val te = TupleExp(outParams.map(p =>
          PNF.buildNameExp(p.name.name, p.name.uri, Some(URIS.getTypeUri(p.typeSpec.get)))))

        val lastLoc = locations(locations.size - 1) match {
          case jl @ JumpLocation(label, annots, ReturnJump(retAnnots, None)) =>
            cp(jl, JumpLocation(label, annots, ReturnJump(retAnnots, Some(te))))
          case jl => throw new RuntimeException("Unexpected final location: " + jl)
        }

        val newlocs = locations.take(locations.size - 1) :+ lastLoc

        val (modLocs, newLocals) = rewriteCallJumps(procName.uri, newlocs)

        import org.sireum.bakar.symbol.BakarSymbol._
        val body = cp(ib, ImplementedBody(locals ++ newLocals, modLocs, cc))
        val parentUri = pd.parentUri.get
        cp(pd, PNF.buildProcedureDecl(procName, parentUri, params, None, body))
      } else pd
    case pd @ ProcedureDecl(procName, a, t, p, r, v, ib @ ImplementedBody(locals, locations, cc)) =>
      import org.sireum.bakar.symbol.BakarSymbol._

      val (modLocs, newLocals) = rewriteCallJumps(procName.uri, locations)
      val body = cp(ib, ImplementedBody(locals ++ newLocals, modLocs, cc))
      val parentUri = pd.parentUri.get
      cp(pd, PNF.buildProcedureDecl(procName, parentUri, p, r, body))
  }, Rewriter.TraversalMode.TOP_DOWN, true)

  this.models = this.models.map(m => rewriter(m).asInstanceOf[Model])
}

case class BakarProcedureRewriter(
  title: String = "Bakar Procedure Rewriter",

  @Input symbolTable: BakarSymbolTable,

  @Input bakarTypeUri2TypeMap: IMap[ResourceUri, TypeDecl],
  
  @Input @Output models: ISeq[Model])

object Gen {
  def main(args: Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/compiler/rewriter"
    val cname = BakarProcedureRewriter.getClass.getName.dropRight(1)

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cname)

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}