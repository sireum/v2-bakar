package org.sireum.test.bakar.xml
import org.junit.runner.RunWith
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import java.io.Writer
import org.sireum.pipeline.PipelineJob
import org.sireum.util.FileUtil
import java.io.File
import java.net.URI
import org.sireum.util.ISeq
import org.sireum.util.FileResourceUri
import com.thoughtworks.xstream.XStream
import org.sireum.pipeline._
import scala.Some.apply
import org.scalatest.junit.JUnitRunner
import scala.collection.immutable.TreeMap
import org.sireum.test.bakar.framework.BakarTestFileFramework
import org.sireum.example.bakar.BakarExamples
import org.sireum.test.bakar.framework.BakarSmfProjectProvider
import org.sireum.example.bakar.BakarExamplesAnchor

@RunWith(classOf[JUnitRunner])
class BakarXmlTest extends BakarTestFileFramework {

  //this.includes += "case"
  //this.excludes += "function_simple"
  //this.includes += "constraints"
  this.includes += "misc"
    
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

  override def generateExpected = false
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