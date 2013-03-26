package org.sireum.test.bakar.jago

import org.junit.runner.RunWith
import java.io.Writer
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.pipeline._
import org.sireum.test.bakar.framework.BakarTestFileFramework
import org.sireum.util._
import org.sireum.example.bakar.BakarExamples
import org.sireum.example.bakar.BakarExamplesAnchor
import org.sireum.test.bakar.framework.BakarSmfProjectProvider
import org.sireum.bakar.jago.program.BakarProgramTranslatorModule
import org.scalatest.junit.JUnitRunner
import org.sireum.option.ProgramTarget

@RunWith(classOf[JUnitRunner])
class BakarProgramTest_OCaml extends BakarTestFileFramework {

  //this.includes += "case"
  //this.excludes += "function_simple"
  //this.includes += "example"
  //this.includes += "test_case_10"
  //this.includes += "linear_div_with_loopInvariant"
  //this.includes += "linear_div_fn"
    
  this.register(BakarExamples.getProjects(BakarSmfProjectProvider, BakarExamplesAnchor.GNAT_2012_DIR + "/jago", true))

  override def pre(c : Configuration) : Boolean = {
    BakarProgramTranslatorModule.setJagoProgramTarget(c.job.properties, ProgramTarget.Ocaml)
    Gnat2XMLWrapperModule.setSrcFiles(c.job.properties, c.sources)
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
      println(f)}
  }
}