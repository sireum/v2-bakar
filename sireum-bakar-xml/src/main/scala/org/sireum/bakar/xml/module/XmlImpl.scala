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

object Util {
  val gnat2xml_key = "gnat2xml"
  val ext = OsArchUtil.detect match {
    case OsArch.Win32 | OsArch.Win64 => ".exe" 
    case _ =>  ""
  }
    
  def base(s : String) : String = {
    val f = new File(scala.util.Properties.envOrElse(gnat2xml_key, ""))
    if (!f.exists() || !f.isDirectory() || !(new File(f, s).exists()))
      s
    else
      new File(f, s).getAbsolutePath()
  }
  
  //val gnatmake = base("gnatmake" + ext)
  val gnat2xml = base("gnat2xml" + ext)

  def copy(srcUri : FileResourceUri, destUri : FileResourceUri) {
      def copyFile(f : File) {
        try {
          val fin = new FileInputStream(f)
          val dest = new File(new File(new URI(destUri)), f.getName())
          val fout = new FileOutputStream(dest)
          val buffer = new Array[Byte](1024)
          var bytesRead = fin.read(buffer)
          while (bytesRead > 0) {
            fout.write(buffer, 0, bytesRead)
            bytesRead = fin.read(buffer)
          }
          fin.close
          fout.close
        } catch {
          case e : Exception =>
            e.printStackTrace()
        }
      }

    val src = new File(new URI(srcUri))
    val dest = new File(new URI(destUri))

    if (src.exists()) {
      if (src.isDirectory()) {
        src.listFiles().foreach { f =>
          if (f.isFile()) {
            copyFile(f)
          }
        }
      } else {
        copyFile(src)
      }
    }
  }

  def cleanDir(dirUri : FileResourceUri) {
    val dir = new File(new URI(dirUri))

    if (dir.exists)
      dir.listFiles.foreach { f =>
        if (f.isDirectory()) {
          cleanDir(f.getAbsoluteFile.toURI.toASCIIString)
        }
        f.delete()
      }
  }
}

class Gnat2XMLWrapperDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends Gnat2XMLWrapperModule {
  val waittime = 200000
  
  val baseDestDir = if (this.destDir.isDefined) new File(new URI(this.destDir.get)) else java.nio.file.Files.createTempDirectory(null).toFile
  baseDestDir.mkdirs

  val tempDir = new File(baseDestDir, "0/temp")
  tempDir.mkdirs
  val tempUri = FileUtil.toUri(tempDir)

  Util.cleanDir(tempUri)
  this.srcFiles.foreach(f => Util.copy(f, tempUri))

  val sfiles = this.srcFiles.map(f => new File(new URI(f)).getName())

  //val gnargs = ivector(Util.gnatmake, "-gnat2012", "-gnatct", "-gnatd.V") ++ sfiles
  //val result1 = new Exec().run(waittime, gnargs, None, Some(tempDir))
  //println(result1)

  val g2xargs = ivector(Util.gnat2xml, "-v", "-t",
    "-m" + baseDestDir.getAbsolutePath()) ++ sfiles
  val gnat2xmlResult = new Exec().run(waittime, g2xargs, None, Some(tempDir))

  val results = mlistEmpty[FileResourceUri]
  gnat2xmlResult match {
    case Exec.StringResult(str, exitval) =>
      str.split("\n").foreach { l =>
        if (l.startsWith("Creating")) {
          results += FileUtil.toUri(new File(l.substring("Creating ".length())))
        }
      }
    case _ =>
      println(gnat2xmlResult)
  }

  this.gnat2xmlResults_=(results)
}

class ParseGnat2XMLDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends ParseGnat2XMLModule {
  import javax.xml.bind._
  import org.sireum.bakar.xml._

  val results = mmapEmpty[FileResourceUri, CompilationUnit]
  val u = JAXBContext.newInstance("org.sireum.bakar.xml").createUnmarshaller();

  for(uri <- this.gnat2xmlResults) {
    val f = new File(new URI(uri))
    val o = u.unmarshal(new FileInputStream(f)).asInstanceOf[JAXBElement[CompilationUnit]]
    results(uri) = o.getValue()    
  }

  this.parseGnat2XMLresults_=(results)
}
