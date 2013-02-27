package org.sireum.test.bakar.jago

import org.sireum.test.framework.TestFramework
import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner
import org.sireum.bakar.jago.typ.BakarTypeTranslator
import org.sireum.option.SireumBakarTypeMode
import org.sireum.util.FileUtil
import java.io.File
import java.net.URI
import org.sireum.option.TypeTarget
import java.io.FileWriter

@RunWith(classOf[JUnitRunner])
class BakarTypeTest extends TestFramework {
  val base = FileUtil.fileUri(this.getClass, "").replace("/bin/", "/src/test/resources/")
  val expected = new File(new File(new URI(base)), "expected")
  val results = new File(new File(new URI(base)), "results")
  
  val genExpected = false
  
  test("Coq"){
    val mode = SireumBakarTypeMode()
    mode.typ = TypeTarget.Coq
    mode.outFile = new File(if (genExpected) expected else results, "typ.coq").toURI().toASCIIString()
    val jagoTypes = BakarTypeTranslator.run(mode)
    if(genExpected){
      val f = new File(new URI(mode.outFile))
      val fwriter = new FileWriter(f)
      fwriter.write(jagoTypes)
      fwriter.close()   
      println("wrote: " + f.getAbsolutePath)
    }else{
      // compare the results with expected ones
      val f = new File(new URI(mode.outFile))
      val fwriter = new FileWriter(f)
      fwriter.write(jagoTypes)
      fwriter.close()   
      
      val (expected, _) = FileUtil.readFile(f.toURI.toString)
      results should equal(expected)
      
    }
  }
  
  test("Ocaml"){
    val mode = SireumBakarTypeMode()
    mode.typ = TypeTarget.Ocaml
    mode.outFile = new File(if (genExpected) expected else results, "typ.ocaml").toURI().toASCIIString()
    val jagoTypes = BakarTypeTranslator.run(mode)
    if(genExpected){
      val f = new File(new URI(mode.outFile))
      val fwriter = new FileWriter(f)
      fwriter.write(jagoTypes)
      fwriter.close()   
      println("wrote: " + f.getAbsolutePath)      
    }else{
      // compare the results with expected ones
      val f = new File(new URI(mode.outFile))
      val fwriter = new FileWriter(f)
      fwriter.write(jagoTypes)
      fwriter.close()   
      
      val (expected, _) = FileUtil.readFile(f.toURI.toString)
      results should equal(expected)      
    }
  }
}