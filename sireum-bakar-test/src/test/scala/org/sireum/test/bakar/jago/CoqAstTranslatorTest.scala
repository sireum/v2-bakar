package org.sireum.test.bakar.jago

import java.io.Writer
import org.junit.runner.RunWith
import org.sireum.bakar.jago.program.BakarProgramTranslatorModule
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.example.bakar.BakarExamplesAnchor
import org.sireum.option.ProgramTarget
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.test.bakar.framework.BakarSmfProjectProvider
import org.sireum.test.bakar.framework.BakarTestFileFramework
import org.sireum.test.bakar.framework.ProjectFile
import org.sireum.test.bakar.framework.Projects
import org.sireum.util._
import org.scalatest.junit.JUnitRunner
import scala.util.matching.Regex
import org.sireum.util.Exec.StringResult

@RunWith(classOf[JUnitRunner])
class CoqAstTranslatorTest extends BakarTestFileFramework[ProjectFile] {

  // ingore all the tests if we're not using a wavefront released after may 2014
  override def ignores = {
    val isNewWaveFront = try {
      val reg = """(?s).*(\d\d\d\d)(\d\d)(\d\d).*""".r
      new Exec().run(1000, ilist("gnat2xml", "--version"), None, None) match {
        case StringResult(s, i) =>
          if (i == 0) {
            val reg(y, m, d) = s
            y.toInt >= 2014 && m.toInt >= 6
          } else false
        case _ => false
      }
    } catch { case e: Throwable => false }

    if (!isNewWaveFront) msetEmpty[Regex] + ".*"
    else msetEmpty[Regex]
  }

  register(Projects.getProjects(BakarSmfProjectProvider, BakarExamplesAnchor.GNAT_2012_DIR + "/jago", true))

  override def pre(c: Configuration): Boolean = {
    import BakarProgramTranslatorModule.ProducerView._
    c.job.jagoProgramTarget = ProgramTarget.Coq

    Gnat2XMLWrapperModule.setSrcFiles(c.job.properties, c.project.files)
    Gnat2XMLWrapperModule.setDestDir(c.job.properties, Some(FileUtil.toUri(c.resultsDir)))

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
        BakarProgramTranslatorModule))

  override def generateExpected = false
  override def outputSuffix = "jago"

  override def writeTestString(job: PipelineJob, w: Writer) = {
    import BakarProgramTranslatorModule.ConsumerView._
    val results = job.jagoProgramResults
    results.foreach { f =>
      w.write(f)
      //println(f)
    }
  }
}