package org.sireum.bakar.tools

import org.sireum.option.SireumBakarTypeMode
import org.sireum.option.SireumBakarProgramMode
import org.sireum.bakar.jago.typ.BakarTypeTranslator

object BakarType {
  def run(o : SireumBakarTypeMode) = {
    println("Hi, Type Translator !")
    println("invoked BakarType: " + o.typ)
    
    val typeTranslator = new BakarTypeTranslator(o); 
    typeTranslator.typeTranslator 
  }
  
  def main(args: Array[String]) {
    val o = SireumBakarTypeMode()
    run(o)
    println(" run successfully !")
  }
}

object BakarProgram {
  def run(o : SireumBakarProgramMode) = {
    println("invoked BakarProgram: " + o)
    //BakarTranslatorModule
    
  }
}
