package org.sireum.test.bakar.compiler.rewriter

import java.io.Writer
import org.junit.runner.RunWith
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.compiler.rewriter.BakarExpRewriterModule
import org.sireum.bakar.compiler.rewriter.BakarProcedureRewriterModule
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
class BakarProcedureRewriterTest extends BakarTranslatorTest {
  override def generateExpected = false
  override def pipeline = BakarProcedureRewriterTest.pipeline
  override def outputSuffix = BakarProcedureRewriterTest.outputSuffix
  override def writeTestString(job: PipelineJob, w: Writer) = BakarProcedureRewriterTest.writeTestString(job, w)
}

object BakarProcedureRewriterTest extends ImplicitLogging {

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
        "symbol resolver stage",
        false,
        BakarSymbolResolverModule),
      PipelineStage(
        "type resolver stage",
        false,
        BakarTypeResolverModule),        
      PipelineStage(
        "rewriter stage",
        false,
        BakarProcedureRewriterModule))

  def outputSuffix = "proc.rewriter"

  def writeTestString(job: PipelineJob, w: Writer) = {
    import BakarExpRewriterModule.ConsumerView._
    import org.sireum.pilar.pretty.NodePrettyPrinter
    job.models foreach (m => w.write(NodePrettyPrinter.print(m)))
  }
}