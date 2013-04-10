package org.sireum.test.bakar.symbol

import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner
import org.sireum.test.bakar.compiler.BakarRewriterTest
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.bakar.compiler.rewriter.BakarExpRewriterModule
import java.io.Writer
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.pilar.pretty.NodePrettyPrinter
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.typ.BakarTypeResolver
import org.sireum.bakar.typ.BakarTypeResolverModule
import org.sireum.bakar.compiler.rewriter.BakarPropertyMapRewriterModule
import org.sireum.bakar.symbol.BakarSymbolResolverModule

@RunWith(classOf[JUnitRunner])
class BakarSymbolResolverTest extends BakarRewriterTest {

  override def generateExpected = false

  override def pipeline =
    PipelineConfiguration(
      "gnat2xml test pipeline",
      false,
      PipelineStage(
        "gnat2xml stage",
        false,
        Gnat2XMLWrapperModule
      ),
      PipelineStage(
        "scalaxb stage",
        false,
        ParseGnat2XMLModule
      ),
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
        BakarSymbolResolverModule)
        /*        
      PipelineStage(
        "prop map rewriter",
        false,
        BakarPropertyMapRewriterModule)
        */
    )

  override def outputSuffix = "symbolresolver"

  override def writeTestString(job : PipelineJob, w : Writer) = {
    /*
    import BakarTypeResolverModule.ConsumerView._
    job.models foreach { m =>
      val x = NodePrettyPrinter.print(m)
      println(x)
      w.write(x)
    }
    */
  }
}