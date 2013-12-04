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
import org.sireum.util.FileUtil
import org.scalatest.junit.JUnitRunner

@RunWith(classOf[JUnitRunner])
class BakarProgramTest_OCaml extends BakarTestFileFramework[ProjectFile] {
    
  this.register(Projects.getProjects(BakarSmfProjectProvider, BakarExamplesAnchor.GNAT_2012_DIR + "/jago", true))

  override def pre(c : Configuration) : Boolean = {
    BakarProgramTranslatorModule.setJagoProgramTarget(c.job.properties, ProgramTarget.Ocaml)
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
        BakarProgramTranslatorModule)
    )

  override def generateExpected = false
  override def outputSuffix = "ocaml"

  override def writeTestString(job : PipelineJob, w : Writer) = {
    val results = BakarProgramTranslatorModule.getJagoProgramResults(job.properties)
    results.foreach{f => 
      w.write(f)
      //println(f)
    }
  }
}