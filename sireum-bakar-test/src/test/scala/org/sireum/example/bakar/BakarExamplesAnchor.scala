package org.sireum.example.bakar

import org.sireum.util.FileUtil
import java.io.File

object BakarExamplesAnchor {
  
  //def sourceDirUri(claz: Class[_], path: String) =
  //  FileUtil.fileUri(claz, "").replaceFirst("/bin/", "/src/test/resources/") + path
    
  def sourceDirUri(claz: Class[_], path: String) = localize(claz) + path

  def localize(c : Class[_]) = {
    val a = new File(BakarExamplesAnchor.getClass.getResource("").toURI).getCanonicalPath
    val sbt = "/target/scala-"
      
    if(a.contains(sbt)) {
      val b = new File(a.substring(0, a.indexOf(sbt))).getParentFile.getParentFile
      val c = b + "/bakar/sireum-bakar-test/" + a.substring(a.indexOf(sbt) + 1, a.length)
      new File(c).toURI.toASCIIString
    } else {
      val b = new File(BakarExamplesAnchor.getClass.getResource("/").toURI).getCanonicalPath
      val c = new File(b, "../../../bakar/sireum-bakar-test/src/test/resources/").getCanonicalPath
      new File(a.replace(b, c)).getCanonicalFile.toURI.toASCIIString      
    }
  }
  
  val BASE_DIR = sourceDirUri(BakarExamplesAnchor.getClass, "")

  val GNAT_2012 = "2012-gnat"
  val GNAT_2012_DIR = sourceDirUri(BakarExamplesAnchor.getClass, GNAT_2012)

  val REGRESSION = "regression"
  val REGRESSION_DIR = sourceDirUri(BakarExamplesAnchor.getClass, REGRESSION)
}