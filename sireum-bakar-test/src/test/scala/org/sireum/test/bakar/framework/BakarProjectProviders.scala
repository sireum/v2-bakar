package org.sireum.test.bakar.framework

import java.io.File
import java.net.URI

import scala.Array.canBuildFrom

import org.sireum.util.FileResourceUri
import org.sireum.util.FileUtil
import org.sireum.util.ISeq
import org.sireum.util.ivector
import org.sireum.util.ivectorEmpty
import org.sireum.util.mlistEmpty

trait ProjectProvider[P <: Project] {
  def getProjects(dir: File, rootDir: File): ISeq[P]
}

object Projects {
  def getProjects[P <: Project](pp: ProjectProvider[P], dirUri: FileResourceUri) : ISeq[P] =
    getProjects(pp, dirUri, new File(new URI(dirUri)).getParentFile(), true)

  def getProjects[P <: Project](pp: ProjectProvider[P], dirUri: FileResourceUri,
    recursive: Boolean): ISeq[P] =
    getProjects(pp, dirUri, new File(new URI(dirUri)).getParentFile(), recursive)

  def getProjects[P <: Project](pp: ProjectProvider[P], dirUri: FileResourceUri,
      pathToExclude: FileResourceUri): ISeq[P] =
   getProjects(pp, dirUri, new File(new URI(pathToExclude)), true)

  def getProjects[P <: Project](pp: ProjectProvider[P], dirUri: FileResourceUri,
      pathToExclude: FileResourceUri, recursive: Boolean): ISeq[P] =
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

object BakarDirectoryProjectProvider extends ProjectProvider[ProjectFile] {
  override def getProjects(dir: File, rootdir: File): ISeq[ProjectFile] = {
    val _files = dir.listFiles.filter(f => f.getName.endsWith(".adb") || f.getName.endsWith(".ads"))
    val _testName = FileUtil.toUri(dir).replace(FileUtil.toUri(rootdir), "").replace("/", "_").dropRight(1)
    if (_files.isEmpty)
      ivectorEmpty
    else
      ivector(new ProjectFile {
        val projectName = _testName
        val testName = _testName
        val files = (_files.map(f => f.toURI.toASCIIString)).toList
      })
  }
}

object BakarSmfProjectProvider extends ProjectProvider[ProjectFile] {
  override def getProjects(dir: File, rootdir: File): ISeq[ProjectFile] = {
    var projs = mlistEmpty[ProjectFile]
    dir.listFiles.filter(f => f.getName.endsWith(".smf")).foreach { smf =>
      val _files = io.Source.fromFile(smf).getLines.toList.map { s =>
        if (new File(s).exists)
          new File(s).toURI.toASCIIString
        else if (new File(smf.getParentFile, s).exists)
          new File(smf.getParentFile, s).toURI.toASCIIString
        else
          throw new RuntimeException("Couldn't locate %s from %s".format(s, smf))
      }
      val _testName = FileUtil.toUri(smf).replace(FileUtil.toUri(rootdir), "").replace("/", "_")
      projs += new ProjectFile {
        val projectName = smf.getName
        val testName = _testName
        val files = _files
      }
    }
    projs.toList
  }
}
