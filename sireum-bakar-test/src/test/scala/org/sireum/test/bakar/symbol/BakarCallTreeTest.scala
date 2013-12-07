package org.sireum.test.bakar.symbol

import java.io.Writer
import org.junit.runner.RunWith
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.symbol.BakarCallTreeModule
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.test.bakar.compiler.BakarTranslatorTest
import org.sireum.util.ImplicitLogging
import org.scalatest.junit.JUnitRunner
import org.sireum.bakar.symbol.BakarSymbolResolverModule

@RunWith(classOf[JUnitRunner])
class BakarCallTreeTest extends BakarTranslatorTest {
  override def generateExpected = false
  override def pipeline = BakarCallTreeTest.pipeline
  override def outputSuffix = BakarCallTreeTest.outputSuffix
  override def writeTestString(job: PipelineJob, w: Writer) =
    BakarCallTreeTest.writeTestString(job, w)
}

object BakarCallTreeTest extends ImplicitLogging {
  def pipeline =
    PipelineConfiguration(
      "bakar call tree test pipeline",
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
        "translator stage",
        false,
        BakarSymbolResolverModule),        
      PipelineStage(
        "exp rewriter stage",
        false,
        BakarCallTreeModule))

  def outputSuffix = "call_tree"

  def writeTestString(job: PipelineJob, w: Writer) {
    import BakarCallTreeModule.ConsumerView._

    w.write(job.callTree.outputCallTree)
  }
}