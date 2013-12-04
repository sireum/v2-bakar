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
    // nothing to emit
  }
}