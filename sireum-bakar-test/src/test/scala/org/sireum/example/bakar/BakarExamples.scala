package org.sireum.example.bakar

import java.io.File
import java.net.URI
import org.sireum.util.FileResourceUri
import org.sireum.util.FileUtil
import org.sireum.util.ISeq
import org.sireum.util.mlistEmpty

case class Project(
    projectName : String,
    testName : String,
    files : ISeq[FileResourceUri])

trait ProjectProvider {
  def getProjects(dir : File, rootDir : File) : ISeq[Project]
}

object BakarExamples {
  
  def sourceDirUri(claz : Class[_], path : String) = {
    FileUtil.fileUri(claz, path).replaceFirst("/bin/", "/src/test/resources/")
  }
  
  def getProjects(pp : ProjectProvider, dirUri : FileResourceUri,
      recursive : Boolean = false) : ISeq[Project] = 
    getProjects(pp, dirUri, new File(new URI(dirUri)).getParentFile(), recursive)
  
  
  def getProjects(pp : ProjectProvider, dirUri : FileResourceUri,
      rootDir : File, recursive : Boolean) : ISeq[Project] = {
    val ret = mlistEmpty[Project]
    val dir = new File(new URI(dirUri))
    if (dir.exists && dir.isDirectory()) {
      ret ++= pp.getProjects(dir, rootDir)

      if (recursive) {
        for(d <- dir.listFiles() if d.isDirectory()){
          ret ++= getProjects(pp, FileUtil.toUri(d), rootDir, recursive)
        }
      }
    }
    ret.toList
  }
}