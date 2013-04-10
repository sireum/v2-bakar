package org.sireum.bakar.symbol

import org.sireum.pipeline.Input
import org.sireum.pipeline.Output
import org.sireum.util._
import org.sireum.pilar.ast.Model
import org.sireum.pipeline.gen.ModuleGenerator
import org.sireum.option.PipelineMode
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.pilar.symbol.SymbolTableProducer
import org.sireum.core.module.PilarSymbolResolverModuleDef
import org.sireum.pilar.symbol.SymbolTableData
import org.sireum.pilar.symbol.ProcedureSymbolTable
import org.sireum.pilar.symbol.ProcedureSymbolTableProducer
import org.sireum.pilar.symbol.SymbolTable
import org.sireum.pilar.symbol.ProcedureSymbolTable
import org.sireum.pilar.symbol.ProcedureSymbolTableData
import org.sireum.pilar.ast.ImplementedBody
import org.sireum.pilar.ast.NameDefinition
import org.sireum.pilar.ast.ParamDecl
import org.sireum.pilar.ast.LocalVarDecl
import org.sireum.pilar.ast.CatchClause

class BakarSymbolResolverModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarSymbolResolverModule {
  val ms = this.models
  val par = this.parallel
  val fst = { _ : Unit => new BakarSymbolTable }

  val result : BakarSymbolTable =
    if (this.hasExistingModels.isDefined) {
      val ems = this.hasExistingModels.get
      val ebst = ems.asInstanceOf[BakarSymbolTable]
      val changedOrAddedFiles =
        ms.map { _.sourceURI }.filter { !_.isEmpty }.map { _.get }.toSet
      throw new RuntimeException("Not handling changed/added yet")
    } else {
      BakarSymbolTable(ms, fst, par)
    }

  val bst = result.asInstanceOf[BakarSymbolTable]
  info.tags ++= bst.tags

  if (bst.hasErrors)
    info.hasError = true

  this.symbolTable = result
}

case class BakarSymbolResolver(
  title : String = "Bakar Symbol Resolver",

  @Input parallel : Boolean = false,

  @Input @Output models : ISeq[Model],

  @Input hasExistingSymbolTable : scala.Option[BakarSymbolTable] = None,

  @Input hasExistingModels : scala.Option[ISeq[Model]] = None,

  @Output symbolTable : BakarSymbolTable)

object BakarSymbolResolver {
  def main(args : Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(BakarSymbolResolver.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/symbol"

    ModuleGenerator.run(opt)
  }
}