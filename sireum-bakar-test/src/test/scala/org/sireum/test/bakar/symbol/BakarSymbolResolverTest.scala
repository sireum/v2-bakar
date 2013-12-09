package org.sireum.test.bakar.symbol

import java.io.Writer
import org.junit.runner.RunWith
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.compiler.rewriter.BakarExpRewriterModule
import org.sireum.bakar.symbol.BakarSymbolResolverModule
import org.sireum.bakar.typ.BakarTypeResolverModule
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.test.bakar.compiler.BakarTranslatorTest
import org.sireum.util.ImplicitLogging
import org.scalatest.junit.JUnitRunner

@RunWith(classOf[JUnitRunner])
class BakarSymbolResolverTest extends BakarTranslatorTest {
  override def generateExpected = false
  override def pipeline = BakarSymbolResolverTest.pipeline
  override def outputSuffix = BakarSymbolResolverTest.outputSuffix
  override def writeTestString(job: PipelineJob, w: Writer) = BakarSymbolResolverTest.writeTestString(job, w)
}

object BakarSymbolResolverTest extends ImplicitLogging {

  def pipeline =
    PipelineConfiguration(
      "gnat2xml test pipeline",
      false,
      PipelineStage(
        "gnat2xml stage",
        false,
        Gnat2XMLWrapperModule),
      PipelineStage(
        "scalaxb stage",
        false,
        ParseGnat2XMLModule),
      PipelineStage(
        "translator stage",
        false,
        BakarTranslatorModule),
      PipelineStage(
        "exp rewriter stage",
        false,
        BakarExpRewriterModule),
      PipelineStage(
        "type resolver stage",
        false,
        BakarTypeResolverModule),
      PipelineStage(
        "symbol resolver stage",
        false,
        BakarSymbolResolverModule))

  def outputSuffix = "symbolresolver"

  def writeTestString(job: PipelineJob, w: Writer) = {
    import BakarSymbolResolverModule.ConsumerView._
    val st = job.symbolTable
    
    w.write("Package Table\n")
    for((k, vals) <- st.packagesTable.toSeq.sortBy(_._1)){
      w.write(s"  $k\n")
      for(v <- vals.sortBy(f => f))
        w.write(s"    $v\n")
    }
    w.write("\n")
    
    w.write("Const Table\n")
    for(k <- st.tables.constTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")
    
    w.write("Const Element Table\n")
    for(k <- st.tables.constElementTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")
    
    w.write("Enum Table\n")
    for(k <- st.tables.enumTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")

    w.write("Enum Element Table\n")
    for(k <- st.tables.enumElementTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")
    
    w.write("Global Var Table\n")
    for(k <- st.tables.globalVarTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")

    w.write("Record Table\n")        
    for(k <- st.tables.recordTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")
    
    w.write("Attribute Table\n")
    for(k <- st.tables.attributeTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")
      
    w.write("Type Alias Table\n")
    for(k <- st.tables.typeAliasTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")
    
    w.write("Procedure Table\n")    
    for((k, vals) <- st.tables.procedureTable.toSeq.sortBy(_._1)) { 
      w.write(s"  $k \n")
      for (v <- vals.toSeq.sortBy(f => f)) 
        w.write(s"    $v \n")
    }
    w.write("\n")

    w.write("Procedure Symbol Table\n")        
    for(bst <- st.procedureSymbolTables.toSeq.sortBy(f => f.procedureUri)) {
      w.write(s"  ${bst.procedureUri} \n\n")
      
      w.write("    LocalVarTable\n")
      for(k <- bst.tables.localVarTable.keys.toSeq.sortBy(f => f))
        w.write(s"      $k \n")
      w.write("\n")
      
      w.write("    Params\n")
      for(k <- bst.tables.params.toSeq.sortBy(f => f))
        w.write(s"      $k \n")
      w.write("\n")
    }
    w.write("\n")
  }
}