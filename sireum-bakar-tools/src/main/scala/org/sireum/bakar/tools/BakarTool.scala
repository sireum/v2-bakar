package org.sireum.bakar.tools

import org.sireum.option.SireumBakarTypeMode
import org.sireum.option.SireumBakarProgramMode
import org.sireum.bakar.jago.xml.XMLSchemaTranslator

object BakarType {
  def run(o : SireumBakarTypeMode) = {
    println("invoked BakarType: " + o)
  }
}

object BakarProgram {
  def run(o : SireumBakarProgramMode) = {
    println("invoked BakarProgram: " + o)
  }
}
