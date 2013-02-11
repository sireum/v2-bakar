package org.sireum.test.bakar.framework

import org.sireum.example.bakar.ProjectProvider
import org.sireum.util._
import org.sireum.example.bakar.Project
import java.io.File

object BakarSmfProjectProvider extends ProjectProvider {
  override def getProjects(dir : File, rootdir : File) : ISeq[Project] = {
    var projs = mlistEmpty[Project]
    dir.listFiles.filter(f => f.getName().endsWith(".smf")).foreach{ smf =>
      val files = io.Source.fromFile(smf).getLines.toList.map{ s =>
        if(new File(s).exists) 
          new File(s).toURI().toASCIIString()
        else if(new File(smf.getParentFile(), s).exists())
          new File(smf.getParentFile(), s).toURI.toASCIIString()
        else
          throw new RuntimeException("Couldn't locate %s from %s".format(s, smf))
      }
      val testName = FileUtil.toUri(smf).replace(FileUtil.toUri(rootdir), "").replace("/", "_")
      projs += Project(smf.getName(), 
          testName,
          files)
    }
    projs.toList
  }
}