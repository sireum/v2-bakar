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
  
  def compare(mode: SireumBakarTypeMode) {
    val typ = mode.typ
    val fileName = typ match {
      case TypeTarget.Coq => "typ.coq" 
      case TypeTarget.Ocaml => "typ.ocaml"
    }
    
    val outFile = new File(if (genExpected) EXPECTED_DIR else RESULT_DIR, fileName)
    // val outFile = new File(if (genExpected) EXPECTED_DIR else RESULT_DIR, fileName).toURI().toASCIIString()
    // mode.outFile = outFile
    val results = BakarTypeTranslator.run(mode)
    
    try {
      val fw = new FileWriter(outFile)
      fw.write(results)
      fw.close()
      if(!genExpected) {
        // val (results, _) = FileUtil.readFile(outFile)
        val (expected, _) = FileUtil.readFile(new File(EXPECTED_DIR , fileName).toURI.toString)
        results should equal(expected)
      }      
    } catch {
      case e: Throwable =>
        e.printStackTrace
        assert(false)
    }

  }
  
  test("Coq") {
    val mode = SireumBakarTypeMode()
    mode.typ = TypeTarget.Coq
    compare(mode)
  }

  test("Ocaml") {
    val mode = SireumBakarTypeMode()
    mode.typ = TypeTarget.Ocaml
    compare(mode)
  }
}