package org.sireum.test.bakar.framework

import java.io.File

import scala.Array.canBuildFrom

import org.sireum.example.bakar.Project
import org.sireum.example.bakar.ProjectProvider
import org.sireum.util.FileUtil
import org.sireum.util.ISeq
import org.sireum.util.ivector
import org.sireum.util.mlistEmpty

object BakarDirectoryProjectProvider extends ProjectProvider[Project] {
  override def getProjects(dir: File, rootdir: File): ISeq[Project] = {
    val _files = dir.listFiles.filter(f => f.getName.endsWith(".adb") || f.getName.endsWith(".ads"))
    val _testName = FileUtil.toUri(dir.getParentFile).replace(FileUtil.toUri(rootdir), "").replace("/", "_")
    ivector(new Project {
      val projectName = _testName
      val testName = _testName
      val files = (_files.map(f => f.toURI.toASCIIString)).toList
    })
  }
}

object BakarSmfProjectProvider extends ProjectProvider[Project] {
  override def getProjects(dir: File, rootdir: File): ISeq[Project] = {
    var projs = mlistEmpty[Project]
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
      projs += new Project {
        val projectName = smf.getName
        val testName = _testName
        val files = _files
      }
    }
    projs.toList
  }
}