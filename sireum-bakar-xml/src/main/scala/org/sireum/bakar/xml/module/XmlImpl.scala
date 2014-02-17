package org.sireum.bakar.xml.module

import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.net.URI
import scala.Some.apply
import org.sireum.bakar.xml.CompilationUnit
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.util.Exec
import org.sireum.util.FileUtil
import org.sireum.util._
import javax.xml.bind.JAXBContext
import org.sireum.util.FileResourceUri
import scala.util.matching.Regex

object Util {
  val gnat2xml_key = "GNAT2XML"
  val ext = OsArchUtil.detect match {
    case OsArch.Win32 | OsArch.Win64 => ".exe"
    case _                           => ""
  }

  def base(s : String) : String = {
    val sireumHome = System.getenv("SIREUM_HOME")
    if(sireumHome != null){
      var gnatPath = "/apps/gnat/2014/bin/" + s
      val f = new File(sireumHome, gnatPath)
      if(f.canExecute())
        return f.getAbsolutePath()
    }
            
    val f = new File(scala.util.Properties.envOrElse(gnat2xml_key, ""), s)
        
    if (!(f.canExecute())) s
    else f.getAbsolutePath()
  }

  //val gnatmake = base("gnatmake" + ext)
  val gnat2xml = base("gnat2xml" + ext)
}

class Gnat2XMLWrapperModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends Gnat2XMLWrapperModule {
  val waittime = 200000

  val baseDestDir =
    if (this.destDir.isDefined) new File(new URI(this.destDir.get))
    else java.nio.file.Files.createTempDirectory(null).toFile
  baseDestDir.mkdirs

  // need to write gnat2xml results to disc since it just dumps out the
  // compilation units to the console as it processes them.  That isn't valid
  // xml since they aren't wrapped in a list so jaxb can't process them 
  val tempDir = new File(baseDestDir, "0/temp")
  tempDir.mkdirs

  val dirs = msetEmpty[String]
  val sfiles = this.srcFiles.map { f =>
    val fl = new File(new URI(f))
    dirs += fl.getParentFile().getAbsolutePath()
    fl.getAbsolutePath()
  }

  //val gnargs = ivector(Util.gnatmake, "-gnat2012", "-gnatct", "-gnatd.V") ++ sfiles
  //val result1 = new Exec().run(waittime, gnargs, None, Some(tempDir))
  //println(result1)

  val g2xargs = ivector(Util.gnat2xml, "-I" + dirs.mkString(","), "-v",
    "-m" + baseDestDir.getAbsolutePath()) ++ sfiles ++ ivector("-cargs", "-gnataa-gnatd.V")

  // fix to resolve an issue when eclipse is run under a sireum distro on mac.
  // DYLD_FALLBACK_LIBRARY_PATH is set which causes gnat2xml to fail so we'll
  // remove it from the env vars before running
  val e = new Exec()
  e.env -= "DYLD_FALLBACK_LIBRARY_PATH"

  val gnat2xmlResult = e.run(waittime, g2xargs, None, Some(tempDir))

  def buildLocationTag(message : String) = {
    val tagType = MarkerType(
      "ERROR", None, "gnat2xml error", MarkerTagSeverity.Error,
      MarkerTagPriority.High, ilistEmpty[MarkerTagKind.Type]
    )

    implicit def isDigits(str : String) = str.forall(c => c.isDigit)

    var rettags = ivectorEmpty[Tag]
    for (m <- message.split("\n").drop(3)) {
      m.split(":").toList match {
        case fname :: line :: col :: error :: Nil if line && col =>
          rettags :+= Tag.toTag(Some(fname.toLowerCase), line.toInt, col.toInt, error, tagType)
        case fname :: error :: Nil =>
          rettags :+= new LocationTag(tagType, Some(error),
            new FileLocation { var fileUri = fname.toLowerCase })
        case x => InfoTag(tagType, Some(x.toString))
      }
    }
    rettags
  }

  var results = imapEmpty[FileResourceUri, FileResourceUri]
  gnat2xmlResult match {
    case Exec.StringResult(str, exitval) =>
      if (exitval != 0)
        info.tags ++= buildLocationTag(str)
      else {
        var createXMLFile = false
        for (l <- str.split("\n") if l.startsWith("Creating ")) {
          // (1) successfully create xml file for spark program
          createXMLFile = true
          val f = new File(l.substring("Creating ".length).trim)
          val fname = f.getName().dropRight(4)
          val key = this.srcFiles.find(p => p.endsWith(fname)) match {
            case Some(uri) => uri
            case None      => fname
          }
          results += (key -> FileUtil.toUri(f))
        }
        if (!createXMLFile)
          // (2) report error for undefined program file name
          for (m <- str.split("\n").drop(3))
            info.tags += InfoTag(MarkerType(
              "ERROR", None, "gnat2xml parameter error", MarkerTagSeverity.Error,
              MarkerTagPriority.High, ilistEmpty[MarkerTagKind.Type]),
              Some(m.split(":").apply(1)))
      }
    case Exec.Timeout =>
    case Exec.ExceptionRaised(exception) =>
      /**
       * For the error of Gnat2XML not being in the PATH:
       * Mac: java.io.IOException: Cannot run program "gnat2xml"
       * Windows: java.io.IOException: Cannot run program "gnat2xml.exe"
       * Linux: 
       */
      val error_pattern = "java.io.IOException: Cannot run program \"gnat2xml"
      val emsg =
        if (exception.toString.contains(error_pattern))
          Some("\"gnat2xml\" cannot be found in the path !")
        else
          None
      info.tags += InfoTag(MarkerType(
        "ERROR", None, "gnat2xml error", MarkerTagSeverity.Error,
        MarkerTagPriority.High, ilistEmpty[MarkerTagKind.Type]), emsg)
  }

  this.gnat2xmlResults = results
}

class ParseGnat2XMLModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends ParseGnat2XMLModule {
  import javax.xml.bind._
  import org.sireum.bakar.xml._

  var results = imapEmpty[FileResourceUri, CompilationUnit]
  val u = JAXBContext.newInstance("org.sireum.bakar.xml").createUnmarshaller();

  for ((orig, xml) <- this.gnat2xmlResults) {
    val f = new File(new URI(xml))
    val o = u.unmarshal(new FileInputStream(f)).asInstanceOf[JAXBElement[CompilationUnit]]
    results += (orig -> o.getValue())
  }

  this.parseGnat2XMLresults = results
}
