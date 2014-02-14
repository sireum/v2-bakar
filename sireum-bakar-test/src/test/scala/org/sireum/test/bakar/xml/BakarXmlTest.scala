package org.sireum.test.bakar.xml

import java.io.File
import java.io.Writer
import java.net.URI
import org.junit.runner.RunWith
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.example.bakar.BakarExamplesAnchor
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.test.bakar.framework.BakarDirectoryProjectProvider
import org.sireum.test.bakar.framework.BakarSmfProjectProvider
import org.sireum.test.bakar.framework.BakarTestFileFramework
import org.sireum.test.bakar.framework.ProjectFile
import org.sireum.test.bakar.framework.Projects
import org.sireum.util.FileUtil
import com.thoughtworks.xstream.XStream
import org.scalatest.junit.JUnitRunner

@RunWith(classOf[JUnitRunner])
class BakarXmlTest extends BakarTestFileFramework[ProjectFile] {

  override def generateExpected = false

  //override def includes = super.includes ++= Set("2014_loop_entry")

  override def includes = super.includes ++= Set(
    "2005_misc",
    "2005_simple",
    "2014_arrays",
    "2014_loop_entry",
    "2014_misc",
    "2014_sort",
    "xxxxxx")

  override def excludes = super.excludes ++= Set(
    "function_simple" // causes gnat2xml v7.3.0w to hang
  )

  register(Projects.getProjects(BakarSmfProjectProvider, BakarExamplesAnchor.REGRESSION_DIR, true))

  override def pre(c : Configuration) : Boolean = {
    Gnat2XMLWrapperModule.setSrcFiles(c.job.properties, c.project.files)
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
        ParseGnat2XMLModule))

  override def outputSuffix = "g2xml"

  override def writeTestString(job : PipelineJob, w : Writer) = {
    import ParseGnat2XMLModule.ConsumerView._
    val xs = new XStream()

    job.parseGnat2XMLresults foreach {
      case (key, value) =>
        val f = new File(new URI(key))
        w.write(f.getName() + "\n" + xs.toXML(value) + "\n\n")
    }
  }
}