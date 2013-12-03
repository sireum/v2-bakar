package org.sireum.example.bakar

import org.sireum.util.FileUtil

object BakarExamplesAnchor {

  def sourceDirUri(claz: Class[_], path: String) =
    FileUtil.fileUri(claz, "").replaceFirst("/bin/", "/src/test/resources/") + path

  val BASE_DIR = sourceDirUri(BakarExamplesAnchor.getClass, "")

  val GNAT_2012 = "2012-gnat"
  val GNAT_2012_DIR = sourceDirUri(BakarExamplesAnchor.getClass, GNAT_2012)

  val REGRESSION = "regression"
  val REGRESSION_DIR = sourceDirUri(BakarExamplesAnchor.getClass, REGRESSION)
}