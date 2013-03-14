package org.sireum.bakar.jago.typ

import org.sireum.option.TypeTarget
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.option.PipelineMode
import org.sireum.pipeline.gen.ModuleGenerator

case class BakarTypTranslator ( 
    title: String = "",
    
    @Input
    jagoTypeTarget : TypeTarget.Type,

    @Produce 
    jagoTypeResults: String
)

object GenerateModuleCore_TypeTrans {
  def main(args: Array[String]) {
    val opt = new PipelineMode()
    opt.classNames = Array(BakarTypTranslator.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/jago/typ"
    opt.genClassName = "BakarTypeTranslatorModuleCore"
      
    ModuleGenerator.run(opt)
  }
}