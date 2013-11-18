package org.sireum.test.bakar.compiler

import java.io.Writer
import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.compiler.rewriter.BakarExpRewriterModule
import org.sireum.bakar.compiler.rewriter.BakarExpRewriterModule.ConsumerView.BakarExpRewriterModuleConsumerView
import org.sireum.bakar.compiler.rewriter.BakarProcedureRewriterModule
import org.sireum.bakar.symbol.BakarSymbolResolverModule
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.pilar.pretty.NodePrettyPrinter
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.test.bakar.symbol.BakarSymbolResolverTest

@RunWith(classOf[JUnitRunner])
class BakarProcedureRewriterTest extends BakarSymbolResolverTest {
  
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
        "symbol resolver stage",
        false,
        BakarSymbolResolverModule),
      PipelineStage(
        "rewriter stage",
        false,
        BakarProcedureRewriterModule)        
    )

  override def outputSuffix = "proc.rewriter"
  
  override def writeTestString(job : PipelineJob, w : Writer) = {
    import BakarExpRewriterModule.ConsumerView._
    job.models foreach ( m => w.write(NodePrettyPrinter.print(m)) )
  }
}