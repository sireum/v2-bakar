package org.sireum.bakar.symbol

import org.sireum.pipeline.Input
import org.sireum.pipeline.Output
import org.sireum.util._
import org.sireum.pilar.ast.Model
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
import org.sireum.bakar.util.UnexpectedError

class BakarSymbolResolverModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarSymbolResolverModule {
  try {

    val ms = this.models
    val par = this.parallel
    val fst = { _ : Unit => new BakarSymbolTable }
    val result : BakarSymbolTable =
      if (this.hasExistingModels.isDefined) {
        val ems = this.hasExistingModels.get
        val ebst = ems.asInstanceOf[BakarSymbolTable]
        val changedOrAddedFiles =
          ms.map { _.sourceURI }.filter { !_.isEmpty }.map { _.get }.toSet
        throw new UnexpectedError("Not handling changed/added yet")
      } else {
        BakarSymbolTable(ms, fst, par)
      }

    val bst = result.asInstanceOf[BakarSymbolTable]
    info.tags ++= bst.tags

    if (bst.hasErrors)
      info.hasError = true

    symbolTable = result
  } catch {
    case e : Throwable =>
      info.tags += org.sireum.bakar.util.TagUtil.genUnexpectedErrorTag(e)
  }
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
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/symbol"
    val cnames = Array(BakarSymbolResolver.getClass.getName.dropRight(1))

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))

    val e = new Exec()
    // current sireum dist may not have the needed sireum classes so use 
    // eclipse's classpath instead
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}