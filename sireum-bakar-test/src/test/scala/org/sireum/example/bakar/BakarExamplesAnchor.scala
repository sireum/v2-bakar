package org.sireum.example.bakar

import org.sireum.util.FileUtil
import java.io.File
import java.net.URI

object BakarExamplesAnchor {
  
  //def sourceDirUri(claz: Class[_], path: String) =
  //  FileUtil.fileUri(claz, "").replaceFirst("/bin/", "/src/test/resources/") + path
    
  def sourceDirUri(claz: Class[_], path: String) = localize(claz) + path
 
  def localize(clazz : Class[_]) : String = {
    val a = new File(clazz.getResource("").toURI)
    val sbt = "/target/scala-"
    
    implicit def s(f : File) = f.getCanonicalFile.toURI.toASCIIString
    if(a.contains(sbt)) {
      val b = new File(new URI(a.substring(0, a.indexOf(sbt)))).getParentFile.getParentFile
      new File(b + "/bakar/sireum-bakar-test/" + a.substring(a.indexOf(sbt) + 1, s(a).length))
    } else {
      val b = new File(BakarExamplesAnchor.getClass.getResource("/").toURI)
      val c = new File(b, "../../../bakar/sireum-bakar-test/src/test/resources/")
      new File(new URI(a.replace(b, c)))
    }
  }
  
  val BASE_DIR = sourceDirUri(BakarExamplesAnchor.getClass, "")

  val GNAT_2012 = "2012-gnat"
  val GNAT_2012_DIR = sourceDirUri(BakarExamplesAnchor.getClass, GNAT_2012)

  val REGRESSION = "regression"
  val REGRESSION_DIR = sourceDirUri(BakarExamplesAnchor.getClass, REGRESSION)
}