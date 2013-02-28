package org.sireum.test.bakar.jago

import org.sireum.test.framework.TestFramework
import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner
import org.sireum.bakar.jago.typ.BakarTypeTranslator
import org.sireum.option.SireumBakarTypeMode
import org.sireum.option.TypeTarget
import org.sireum.util.FileUtil
import java.io.File
import java.net.URI
import org.sireum.option.TypeTarget
import java.io.FileWriter

@RunWith(classOf[JUnitRunner])
class BakarTypeTest extends TestFramework {
  val base = FileUtil.fileUri(this.getClass, "").replace("/bin/", "/src/test/resources/")
  val EXPECTED_DIR = new File(new File(new URI(base)), "expected")
  val RESULT_DIR = new File(new File(new URI(base)), "results")

  val genExpected = false

//  def compare (results : String, filename : String) {
//    val (expected, _) = FileUtil.readFile(new File(EXPECTED_DIR , filename).toURI.toString)
//    results should equal(expected)
//  }
  
  def compare(mode: SireumBakarTypeMode) {
    val typ = mode.typ
    val fileName = typ match {
      case TypeTarget.Coq => "typ1.coq" 
      case TypeTarget.Ocaml => "typ1.ocaml"
    }
    
    val outFile = new File(if (genExpected) EXPECTED_DIR else RESULT_DIR, fileName).toURI().toASCIIString()
    mode.outFile = outFile
    BakarTypeTranslator.run(mode)
    
    if(!genExpected) {
      val (results, _) = FileUtil.readFile(outFile)
      val (expected, _) = FileUtil.readFile(new File(EXPECTED_DIR , fileName).toURI.toString)
      results should equal(expected)
    }
  }
  
  test("Coq") {
    val mode = SireumBakarTypeMode()
    mode.typ = TypeTarget.Coq
    compare(mode)
//    mode.outFile = new File(if (genExpected) EXPECTED_DIR else RESULT_DIR, "typ1.coq").toURI().toASCIIString()
//    BakarTypeTranslator.run(mode)
//    val (results, _) = FileUtil.readFile(mode.outFile)
//    
//    if(!genExpected)
//      compare(results, "typ1.coq")
  }

  test("Ocaml") {
    val mode = SireumBakarTypeMode()
    mode.typ = TypeTarget.Ocaml
    compare(mode)
//    mode.outFile = new File(if (genExpected) EXPECTED_DIR else RESULT_DIR, "typ1.ocaml").toURI().toASCIIString()
//    BakarTypeTranslator.run(mode)
//    val (results, _) = FileUtil.readFile(mode.outFile)
//    
//    if(!genExpected)
//      compare(results, "typ1.ocaml")
  }
}