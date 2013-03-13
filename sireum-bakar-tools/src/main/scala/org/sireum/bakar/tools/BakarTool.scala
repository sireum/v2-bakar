package org.sireum.bakar.tools

import org.sireum.option.SireumBakarTypeMode
import org.sireum.option.SireumBakarProgramMode
import org.sireum.bakar.jago.typ.BakarTypeTranslator
import org.sireum.option.TypeTarget
import org.sireum.pipeline._
import java.io.File
import java.io.FileWriter
import org.sireum.util.FileResourceUri
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.util.ImplicitLogging
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.bakar.jago.program.BakarProgramTranslatorModule
import org.sireum.bakar.jago.util.TranslatorUtil
import org.sireum.option.ProgramTarget
import org.sireum.util._

object BakarType {
  def run(o : SireumBakarTypeMode) = {
    BakarTypeTranslator.run(o)
  }
}

object BakarProgram extends ImplicitLogging {
//  case class Configuration(
//    sources : ISeq[FileResourceUri], // type FileResourceUri = String
//    expectedDir : File,
//    resultsDir : File,
//    job : PipelineJob)

  def pipeline : PipelineConfiguration =
    PipelineConfiguration(
      "Jago Bakar program translation pipeline",
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
        "program translator stage",
        false,
        BakarProgramTranslatorModule)
    )

  def setJobEnvirenment(job : PipelineJob, mode : SireumBakarProgramMode) {
    BakarProgramTranslatorModule.setJagoProgramTarget(job.properties, mode.typ)
    var srcFiles = mlistEmpty[String]
    for (srcFile <- mode.srcFiles) {
      val absoluteFileName = TranslatorUtil.getAbsolutePath(srcFile)
      val fileUri = FileUtil.toUri(absoluteFileName)
      srcFiles += fileUri
    }
    Gnat2XMLWrapperModule.setSrcFiles(job.properties, srcFiles)
    val outFilePath = TranslatorUtil.getAbsolutePath(mode.outFile)
    val parentPath = (new File(outFilePath)).getParentFile()
    //    val destDir = FileUtil.toUri(parentPath.getPath() + "/0/temp/")
    //    Gnat2XMLWrapperModule.setDestDir(job.properties, Some(destDir))  
  }

  def run(o : SireumBakarProgramMode) = {
    val job = PipelineJob()
    setJobEnvirenment(job, o)
    pipeline.compute(job)

    val results = BakarProgramTranslatorModule.getJagoProgramResults(job.properties)
    var r : String = ""
    for (e <- results) {
      r += e + "\n"
    }
    if (o.outFile != "") {
      TranslatorUtil.writeIntoOutFile(r, o.outFile)
    } else {
      Console.println(r)
    }
  }

  def main(args : Array[String]) {
    val srcFiles = scala.collection.immutable.Seq[String]("linear_div_with_loopInvariant.adb")
    val mode = SireumBakarProgramMode(
      ProgramTarget.Coq,
      srcFiles,
      "outFile")
    run(mode)
  }
}
