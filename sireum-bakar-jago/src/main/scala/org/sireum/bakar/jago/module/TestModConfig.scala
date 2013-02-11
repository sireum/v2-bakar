package org.sireum.bakar.jago.module

import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.option.PipelineMode
import org.sireum.pipeline.gen.ModuleGenerator

case class TestMod (

    title : String = "Test Mod",
    
    @Input
    str : String,
    
    @Produce
    results : Boolean
)

object hold2 {
  def main(args : Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(TestMod.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/coq/module"
    opt.genClassName = "TestModCore"

    ModuleGenerator.run(opt)
  }
} 