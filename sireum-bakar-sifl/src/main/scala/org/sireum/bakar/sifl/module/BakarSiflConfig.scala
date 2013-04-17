package org.sireum.bakar.sifl.module

import org.sireum.alir.ControlFlowGraph
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.option.PipelineMode
import org.sireum.pipeline.gen.ModuleGenerator

case class BakarSiflConfig (
    title : String = "SIFL information flow analysis tool",
    
    @Input
    cfg : Boolean, //ControlFlowGraph[Boolean], 
    
    @Produce
    siflResults : Boolean
)

object BakarSiflModuleGen {
  def main(args: Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(BakarSiflConfig.getClass().getName().dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/sifl/module"
    opt.genClassName = "BakarSiflModuleCore"
    
    ModuleGenerator.run(opt)
  }
}