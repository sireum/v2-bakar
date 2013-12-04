package org.sireum.test.bakar.compiler

import java.io.File
import java.io.Writer
import org.junit.runner.RunWith
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.example.bakar.BakarExamplesAnchor
import org.sireum.pilar.ast.PilarAstNode
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.test.bakar.framework.BakarDirectoryProjectProvider
import org.sireum.test.bakar.framework.BakarSmfProjectProvider
import org.sireum.test.bakar.framework.BakarTestFileFramework
import org.sireum.test.bakar.framework.ProjectFile
import org.sireum.test.bakar.framework.Projects
import org.sireum.util.FileUtil
import org.sireum.util.ISeq
import org.sireum.util.Visitor
import org.scalatest.junit.JUnitRunner

@RunWith(classOf[JUnitRunner])
class BakarTranslatorTest extends BakarTestFileFramework[ProjectFile] {

  override def generateExpected = false

  //override def includes = super.includes ++= Set("2014_gnatprove_LC17-035__update_big_test$")

  override def includes = super.includes ++= Set(
    "2005_misc",
    "2005_simple",
    "2014_arrays",
    "2014_misc",
    "2014_sort",
    "xxxxxx")

  override def ignores = {
    super.ignores ++= Set(
      "2014_arrays_array_dim_fun", // not handled in sireum v1
      "2014_arrays_array_one_dim", // contains type decs defined in procedure
      "misc_p_public", // contains nested packages
      "misc_package_scope", // contains nested packages
      "misc_recordshape", // contains record refinements
      "sort_array_utilities", // contains nested methods
      "xxxxxxx")
  }

  register(Projects.getProjects(BakarSmfProjectProvider, BakarExamplesAnchor.REGRESSION_DIR))

  override def pre(c: Configuration): Boolean = {
    Gnat2XMLWrapperModule.setSrcFiles(c.job.properties, c.project.files)
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