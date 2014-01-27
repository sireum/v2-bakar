package org.sireum.test.bakar.typ

import java.io.Writer
import org.junit.runner.RunWith
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.compiler.rewriter.BakarExpRewriterModule
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
class BakarTypeResolverTest extends BakarTranslatorTest {
  override def generateExpected = false
  override def pipeline = BakarTypeResolverTest.pipeline
  override def outputSuffix = BakarTypeResolverTest.outputSuffix
  override def writeTestString(job: PipelineJob, w: Writer) = BakarTypeResolverTest.writeTestString(job, w)
}

object BakarTypeResolverTest extends ImplicitLogging {

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
        "type resolver stage",
        false,
        BakarTypeResolverModule),
      PipelineStage(
        "exp rewriter stage",
        false,
        BakarExpRewriterModule),
      PipelineStage(
        "type resolver stage",
        false,
        BakarTypeResolverModule))

  def outputSuffix = "typeresolver"

  def writeTestString(job: PipelineJob, w: Writer) = {
    import BakarTypeResolverModule.ConsumerView._
    for ((k, v) <- job.bakarRef2TypeUriMap.toList.sortBy(_._1))
      w.write(s"$k -> $v\n")
  }
}