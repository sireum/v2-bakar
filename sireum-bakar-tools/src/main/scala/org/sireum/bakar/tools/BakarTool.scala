package org.sireum.bakar.tools

import org.sireum.option.SireumBakarTypeMode
import org.sireum.option.SireumBakarProgramMode
import org.sireum.bakar.jago.typ.BakarTypeTranslator
import org.sireum.option.TypeTarget

object BakarType {
  def run(o : SireumBakarTypeMode) = {
    BakarTypeTranslator.run(o)
//    val typeTranslator = new BakarTypeTranslator(o); 
//    typeTranslator.r 
  }
}

object BakarProgram {
  def run(o : SireumBakarProgramMode) = {
    println("invoked BakarProgram: " + o)
    //BakarTranslatorModule
    
  }
}
