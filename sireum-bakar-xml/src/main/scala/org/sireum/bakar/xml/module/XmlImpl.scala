package org.sireum.bakar.xml.module

import java.io.ByteArrayInputStream
import java.io.File
import java.io.LineNumberReader
import java.io.StringReader
import java.net.URI
import javax.xml.bind.JAXBContext
import javax.xml.bind.JAXBElement
import org.sireum.bakar.xml.CompilationUnit
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.util.Exec
import org.sireum.util.FileLocation
import org.sireum.util.FileResourceUri
import org.sireum.util.InfoTag
import org.sireum.util.LocationTag
import org.sireum.util.MarkerTagKind
import org.sireum.util.MarkerTagPriority
import org.sireum.util.MarkerTagSeverity
import org.sireum.util.MarkerType
import org.sireum.util.OsArch
import org.sireum.util.OsArchUtil
import org.sireum.util.Tag
import org.sireum.util.ilinkedMapEmpty
import org.sireum.util.ilistEmpty
import org.sireum.util.ivector
import org.sireum.util.ivectorEmpty
import org.sireum.util.mmapEmpty
import org.sireum.util.msetEmpty

object Gnat2XMLWrapperModuleDef {

  val ext = OsArchUtil.detect match {
    case OsArch.Win32 | OsArch.Win64 => ".exe"
    case _                           => ""
  }

  def gnat2xml(bin : Option[FileResourceUri]) : String = {
    val s = "gnat2xml" + ext

    if (bin.isDefined && new File(bin.get).isDirectory) {
      val f = new File(bin.get, s)
      if (f.canExecute)
        return f.getAbsolutePath
    }

    val sireumHome = System.getenv("SIREUM_HOME")
    if (sireumHome != null) { // in sireum dist
      var gnatPath = "/apps/gnat/2014/bin/" + s
      val f = new File(sireumHome, gnatPath)
      if (f.canExecute())
        return f.getAbsolutePath()
    }

    s // hopefully it's in the path
  }
}

class Gnat2XMLWrapperModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends Gnat2XMLWrapperModule {
  val waittime = 200000

  var results = ilinkedMapEmpty[FileResourceUri, FileResourceUri]

  val absfiles = mmapEmpty[String, String]
  var proceed = true
  val sfiles = this.srcFiles.map { f =>
    val fl = new File(new URI(f))
    if (!fl.exists) {
      // gnat2xml does not emit an error exit code when given invalid filenames
      proceed = false
      info.tags += InfoTag(MarkerType(
        "ERROR", None, "gnat2xml error", MarkerTagSeverity.Error,
        MarkerTagPriority.High, ilistEmpty[MarkerTagKind.Type]),
        Some("Could not locate " + fl.getAbsolutePath))
    }
    absfiles += (fl.getName -> fl.toURI.toASCIIString)
    fl.getAbsolutePath
  }

  if (proceed) {
    val g2xargs = ivector(Gnat2XMLWrapperModuleDef.gnat2xml(gnatBin), "-v") ++ sfiles

    // fix to resolve an issue when eclipse is run under a sireum distro on mac.
    // DYLD_FALLBACK_LIBRARY_PATH is set which causes gnat2xml to fail so we'll
    // remove it from the env vars before running
    val e = new Exec()
    e.env -= "DYLD_FALLBACK_LIBRARY_PATH"

    val gnat2xmlResult = e.run(waittime, g2xargs, None)

      def buildLocationTag(message : String) = {
        val tagType = MarkerType(
          "ERROR", None, "gnat2xml error", MarkerTagSeverity.Error,
          MarkerTagPriority.High, ilistEmpty[MarkerTagKind.Type])

          implicit def isDigits(str : String) = str.forall(c => c.isDigit)

        var rettags = ivectorEmpty[Tag]
        for (m <- message.split("\n").drop(3)) {
          m.split(":").toList match {
            case fname :: line :: col :: error :: Nil if line && col =>
              rettags :+= Tag.toTag(Some(absfiles(fname)), line.toInt, col.toInt, error, tagType)
            case "gnat2xml" :: error :: Nil =>
              if (error.trim.startsWith("cannot compile")) {
                val _fname = error.substring(error.indexOf("\"") + 1).dropRight(1)
                rettags :+= new LocationTag(tagType, Some(error.trim),
                  new FileLocation { var fileUri = absfiles(_fname) })
              } else {
                throw new RuntimeException("Unexpected error: " + m)
              }
            case x => InfoTag(tagType, Some(x.toString))
          }
        }
        rettags
      }

    gnat2xmlResult match {
      case Exec.StringResult(str, exitval) =>
        if (exitval != 0)
          info.tags ++= buildLocationTag(str)
        else {
          val lnr = new LineNumberReader(new StringReader(str))
          var line = lnr.readLine
          var currFileName : String = null
          var sb : StringBuilder = null
          while (line != null) {
            if (line.charAt(0) == '[') {
              if (sb != null)
                results += (currFileName -> sb.toString)
              sb = new StringBuilder
              currFileName = absfiles(line.drop(line.indexOf(']') + 2))
            } else if (sb != null)
              sb.append(line)
            line = lnr.readLine
          }
          assert(currFileName != null && sb != null)
          results += (currFileName -> sb.toString)
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
  }
  gnat2xmlResults = results
}

class ParseGnat2XMLModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends ParseGnat2XMLModule {
  import javax.xml.bind._
  import org.sireum.bakar.xml._

  var results = ilinkedMapEmpty[FileResourceUri, CompilationUnit]
  val u = JAXBContext.newInstance("org.sireum.bakar.xml").createUnmarshaller();

  for ((orig, xml) <- this.gnat2xmlResults) {
    val in = new ByteArrayInputStream(xml.getBytes("UTF-8"));
    val o = u.unmarshal(in).asInstanceOf[JAXBElement[CompilationUnit]]
    results += (orig -> o.getValue())
  }

  parseGnat2XMLresults = results
}