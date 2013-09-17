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

class BakarProcedureRewriterModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarProcedureRewriterModule {
  def cp[T <: PilarAstNode](a : T, b : T) : T = {
    b.propertyMap ++= a.propertyMap
    b
  }

  val rewriter = Rewriter.build[PilarAstNode]({
    case pd @ ProcedureDecl(n, a, t, params, None, v, ImplementedBody(locals, locations, cc)) =>
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
        cp(pd, ProcedureDecl(n, a, t, params, None, v, ImplementedBody(locals, newlocs, cc)))
      } else pd
    case cj @ CallJump(a, lhss, ce @ CallExp(NameExp(nu), TupleExp(args)), jump) if (lhss.isEmpty) =>
      val calledProc = this.symbolTable.procedureSymbolTable(nu.uri).procedure

      var _lhss = ivectorEmpty[NameExp]
      for (i <- 0 to calledProc.params.size - 1 if (calledProc.params(i).mode != Mode.IN))
        _lhss :+= args(i).asInstanceOf[NameExp]

      if (!_lhss.isEmpty) cp(cj, CallJump(a, _lhss, ce, jump))
      else cj
  })

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