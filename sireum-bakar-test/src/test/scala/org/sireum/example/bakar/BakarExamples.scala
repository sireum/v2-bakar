package org.sireum.example.bakar

import java.io.File
import java.net.URI
import org.sireum.util.FileResourceUri
import org.sireum.util.FileUtil
import org.sireum.util.ISeq
import org.sireum.util.mlistEmpty

trait Project {
  val projectName: String
  val testName: String
  val files: ISeq[FileResourceUri]
}

trait ProjectProvider[P <: Project] {
  def getProjects(dir: File, rootDir: File): ISeq[P]
}

object BakarExamples {

  def sourceDirUri(claz: Class[_], path: String) =
    FileUtil.fileUri(claz, path).replaceFirst("/bin/", "/src/test/resources/")
   
  def getProjects[P <: Project](pp: ProjectProvider[P], dirUri: FileResourceUri,
    recursive: Boolean = true): ISeq[P] =
    getProjects(pp, dirUri, new File(new URI(dirUri)).getParentFile(), recursive)

  def getProjects[P <: Project](pp: ProjectProvider[P], dirUri: FileResourceUri,
      pathToExclude: FileResourceUri, recursive: Boolean = true): ISeq[P] =
   getProjects(pp, dirUri, new File(new URI(pathToExclude)), recursive)

  def getProjects[P <: Project](pp: ProjectProvider[P], dirUri: FileResourceUri,
    rootDir: File, recursive: Boolean): ISeq[P] = {
    val ret = mlistEmpty[P]
    val dir = new File(new URI(dirUri))
    if (dir.exists && dir.isDirectory()) {
      ret ++= pp.getProjects(dir, rootDir)

      if (recursive)
        for (d <- dir.listFiles() if d.isDirectory())
          ret ++= getProjects(pp, FileUtil.toUri(d), rootDir, recursive)
    }
    ret.toList
  }
}