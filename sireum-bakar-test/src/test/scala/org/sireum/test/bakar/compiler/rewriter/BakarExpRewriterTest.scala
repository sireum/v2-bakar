package org.sireum.test.bakar.compiler.rewriter

import java.io.Writer
import org.junit.runner.RunWith
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.compiler.rewriter.BakarExpRewriterModule
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.pilar.pretty.NodePrettyPrinter
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.test.bakar.compiler.BakarTranslatorTest
import org.sireum.util.ImplicitLogging
import org.scalatest.junit.JUnitRunner

@RunWith(classOf[JUnitRunner])
class BakarExpRewriterTest extends BakarTranslatorTest {
  override def generateExpected = false
  override def pipeline = BakarExpRewriterTest.pipeline
  override def outputSuffix = BakarExpRewriterTest.outputSuffix
  override def writeTestString(job: PipelineJob, w: Writer) = BakarExpRewriterTest.writeTestString(job, w)
}

object BakarExpRewriterTest extends ImplicitLogging {

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
        "rewriter stage",
        false,
        BakarExpRewriterModule))

  def outputSuffix = "rewriter"

  def writeTestString(job: PipelineJob, w: Writer) = {
    import BakarExpRewriterModule.ConsumerView._
    job.models foreach (m => w.write(NodePrettyPrinter.print(m)))
  }
}