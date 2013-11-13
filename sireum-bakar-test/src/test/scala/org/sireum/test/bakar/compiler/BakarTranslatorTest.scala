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
import org.sireum.util._
import org.sireum.example.bakar.BakarExamplesAnchor

@RunWith(classOf[JUnitRunner])
class BakarTranslatorTest extends BakarTestFileFramework {
  
  override def generateExpected = false
  
  override def includes = super.includes ++= Set("gnat_misc", "gnat_simple", "spark2014")
  
  override def excludes = {
    super.excludes ++= Set("constraints", "dependence_test_suite_01",
      "faultintegrator", "in_range", "misc_labeled", "misc_p_public",
      "misc_package_scope", "packagedemo_b", "misc_recordshape", 
      "simplemath1", "misc_the_stack")
  }

  this.register(BakarExamples.getProjects(BakarSmfProjectProvider, BakarExamplesAnchor.GNAT_2012_DIR, true))

  override def pre(c : Configuration) : Boolean = {
    Gnat2XMLWrapperModule.setSrcFiles(c.job.properties, c.sources)
    Gnat2XMLWrapperModule.setDestDir(c.job.properties, Some(FileUtil.toUri(c.resultsDir)))
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
        BakarTranslatorModule)
    )

  override def outputSuffix = "gvisitor"

  def printTree(t : PilarAstNode, w : Writer) {
    Visitor.visit(Some { vsp =>
      val indent = "  "
        def printIndent {
          for (i <- 0 until vsp.stack.size) w.write("  ")
        }
        def printlnContent(o : Any) {
          val s = o.toString
          w.write(s.substring(0, if (s.length < 150) s.length else 150) + "\n")
        }
      {
        case p : PilarAstNode =>
          printIndent; printlnContent(p); true
        case Nil =>
          printIndent; w.write("List()\n"); false
        case l : ISeq[_] =>
          printIndent; printlnContent(l); true
        case None =>
          printIndent; w.write("None\n"); false
        case s : Some[_] => printIndent; printlnContent(s); true
      }
    }, None)(t)
  }

  override def writeTestString(job : PipelineJob, w : Writer) = {
    val results = BakarTranslatorModule.getModels(job.properties)
    results foreach (printTree(_, w))
  }
}