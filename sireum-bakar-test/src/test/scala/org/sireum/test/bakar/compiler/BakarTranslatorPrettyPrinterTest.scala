package org.sireum.test.bakar.compiler

import java.io.Writer
import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.compiler.rewriter.BakarPropertyMapRewriterModule
import org.sireum.bakar.pilar.BakarPrettyPrinterModule
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.util.ImplicitLogging

@RunWith(classOf[JUnitRunner])
class BakarTranslatorPrettyPrinterTest extends BakarTranslatorTest {
  override def generateExpected = false
  override def pipeline = BakarTranslatorPrettyPrinterTest.pipeline
  override def outputSuffix = BakarTranslatorPrettyPrinterTest.outputSuffix
  override def writeTestString(job: PipelineJob, w: Writer) = BakarTranslatorPrettyPrinterTest.writeTestString(job, w)
}

object BakarTranslatorPrettyPrinterTest extends ImplicitLogging {

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
        "prop map rewriter stage",
        false,
        BakarPropertyMapRewriterModule),
      PipelineStage(
        "pretty printer stage",
        false,
        BakarPrettyPrinterModule))

  def outputSuffix = "pretty_print"

  def writeTestString(job: PipelineJob, w: Writer) = {
    val results = BakarPrettyPrinterModule.getResults(job.properties)
    results.foreach { x =>
      w.write(x._1)
      w.write("\n")
      w.write(x._2)
      w.write("\n\n")
    }
  }
}