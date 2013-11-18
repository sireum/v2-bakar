package org.sireum.test.bakar.xml

import com.thoughtworks.xstream.XStream
import java.io.File
import java.io.Writer
import java.net.URI
import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.example.bakar.BakarExamples
import org.sireum.example.bakar.BakarExamplesAnchor
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.test.bakar.framework.BakarSmfProjectProvider
import org.sireum.test.bakar.framework.BakarTestFileFramework
import org.sireum.util.FileUtil
import scala.collection.immutable.TreeMap

@RunWith(classOf[JUnitRunner])
class BakarXmlTest extends BakarTestFileFramework {

  override def generateExpected = false
  
  override def includes = super.includes ++= Set("gnat_misc", "gnat_simple", "gnat_spark2014")
    
  this.register(BakarExamples.getProjects(BakarSmfProjectProvider, BakarExamplesAnchor.GNAT_2012_DIR, true))

  override def pre(c : Configuration) : Boolean = {
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
      )
    )

  override def outputSuffix = "g2xml"

  override def writeTestString(job : PipelineJob, w : Writer) = {
    val xs = new XStream()
    val results = TreeMap(ParseGnat2XMLModule.getParseGnat2XMLresults(job.properties).toSeq:_*)

    results foreach {
      case (key, value) =>
        val f = new File(new URI(key))
        w.write(f.getName() + "\n" + xs.toXML(value) + "\n\n")
    }
  }
}