package org.sireum.bakar.pilar

import org.sireum.util.ISeq
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.pilar.ast.Model
import org.sireum.pipeline.gen.ModuleGenerator
import org.sireum.option.PipelineMode

case class NodePrettyPrinter (
    title :String = "NodePrettyPrinter",
    
    @Input
    models : ISeq[Model],
    
    @Produce 
    results : Map[String, String]
    )
    
    
object build {
  def main(args : Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(NodePrettyPrinter.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/pilar"
    opt.genClassName = "NodePrettyPrinterCore"

    ModuleGenerator.run(opt)
  }
} 