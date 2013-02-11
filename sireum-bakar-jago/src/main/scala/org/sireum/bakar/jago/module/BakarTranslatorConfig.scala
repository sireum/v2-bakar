package org.sireum.bakar.jago.module

import org.sireum.pipeline.Input
import org.sireum.util.MMap
import org.sireum.bakar.xml.CompilationUnit
import org.sireum.util.FileResourceUri
import org.sireum.pipeline.Produce
import org.sireum.option.PipelineMode
import org.sireum.pipeline.gen.ModuleGenerator

case class BakarTranslator(
    title: String = "",
    
    @Input
    parseGnat2XMLresults: MMap[FileResourceUri, CompilationUnit],
    
    @Produce
    results: Seq[String]
)

object GenerateModuleCore{
  def main(args: Array[String]){
    val opt = PipelineMode()
    opt.classNames = Array(BakarTranslator.getClass().getName().dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/jago/module"
    opt.genClassName = "BakarTranslatorModuleCore"
    
    ModuleGenerator.run(opt) 
    println("++8888+")
  }
}