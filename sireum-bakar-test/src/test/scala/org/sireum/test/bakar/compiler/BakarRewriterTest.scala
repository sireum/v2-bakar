package org.sireum.test.bakar.compiler

import org.junit.runner.RunWith
import java.io.Writer
import org.sireum.pipeline._
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.bakar.compiler.module._
import org.sireum.test.bakar.xml.BakarXmlTest
import org.sireum.pipeline._
import org.scalatest.junit.JUnitRunner
import org.sireum.test.bakar.framework.BakarTestFileFramework
import org.sireum.util._
import org.sireum.example.bakar.Project
import org.sireum.example.bakar.ProjectProvider
import java.io.File
import java.io.FilenameFilter
import org.sireum.example.bakar.BakarExamples
import org.sireum.example.bakar.BakarExamplesAnchor
import org.sireum.test.bakar.framework.BakarSmfProjectProvider
import org.sireum.util.Visitor.VisitorStackProvider
import org.sireum.pilar.ast.PilarAstNode
import org.sireum.bakar.compiler.rewriter.BakarExpRewriterModule
import org.sireum.pilar.pretty.NodePrettyPrinter

@RunWith(classOf[JUnitRunner])
class BakarRewriterTest extends BakarTranslatorPrettyPrinterTest {

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
        "rewriter stage",
        false,
        BakarExpRewriterModule)        
    )

  override def outputSuffix = "rewriter"
  
  override def writeTestString(job : PipelineJob, w : Writer) = {
    import BakarExpRewriterModule.ConsumerView._
    job.models foreach ( m => w.write(NodePrettyPrinter.print(m)) )
  }
}