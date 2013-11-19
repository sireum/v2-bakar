package org.sireum.test.bakar.compiler

import java.io.File
import java.io.Writer
import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.example.bakar.BakarExamples
import org.sireum.example.bakar.BakarExamplesAnchor
import org.sireum.example.bakar.Project
import org.sireum.pilar.ast.PilarAstNode
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.test.bakar.framework.BakarSmfProjectProvider
import org.sireum.test.bakar.framework.BakarTestFileFramework
import org.sireum.util.FileUtil
import org.sireum.util.ISeq
import org.sireum.util.Visitor

@RunWith(classOf[JUnitRunner])
class BakarTranslatorTest extends BakarTestFileFramework {

  override def generateExpected = false

  //override def includes = super.includes ++= Set("quant")
  override def includes = super.includes ++= Set("2005_misc", "2005_simple", "regression_2014")
  
  //override def excludes = super.excludes ++= Set("gnat_jago", "gnat_kiasan")

  override def ignores = {
    super.ignores ++= Set(
      "misc_p_public",
      "misc_package_scope",
      "misc_recordshape")
  }

  this.register(BakarExamples.getProjects(BakarSmfProjectProvider, BakarExamplesAnchor.REGRESSION_DIR, true))

  override def pre(c: Configuration): Boolean = {
    val dest = new File(c.resultsDir + "/0")
    dest.mkdirs
    Gnat2XMLWrapperModule.setSrcFiles(c.job.properties, c.sources)
    Gnat2XMLWrapperModule.setDestDir(c.job.properties, Some(FileUtil.toUri(dest)))
    BakarTranslatorModule.setRegression(c.job.properties, true)
    return true;
  }

  override def pipeline =
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
        BakarTranslatorModule))

  override def outputSuffix = "gvisitor"

  def printTree(t: PilarAstNode, w: Writer) {
    Visitor.visit(Some { vsp =>
      val indent = "  "
      def printIndent {
        for (i <- 0 until vsp.stack.size) w.write("  ")
      }
      def printlnContent(o: Any) {
        val s = o.toString
        w.write(s.substring(0, if (s.length < 150) s.length else 150) + "\n")
      }
      {
        case p: PilarAstNode =>
          printIndent; printlnContent(p); true
        case Nil =>
          printIndent; w.write("List()\n"); false
        case l: ISeq[_] =>
          printIndent; printlnContent(l); true
        case None =>
          printIndent; w.write("None\n"); false
        case s: Some[_] => printIndent; printlnContent(s); true
      }
    }, None)(t)
  }

  override def writeTestString(job: PipelineJob, w: Writer) = {
    val results = BakarTranslatorModule.getModels(job.properties)
    results foreach (printTree(_, w))
  }
}