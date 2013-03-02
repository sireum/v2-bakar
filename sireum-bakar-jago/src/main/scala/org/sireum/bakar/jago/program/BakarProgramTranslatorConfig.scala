package org.sireum.bakar.jago.program

import org.sireum.pipeline.Input
import org.sireum.util.MMap
import org.sireum.bakar.xml.CompilationUnit
import org.sireum.util.FileResourceUri
import org.sireum.pipeline.Produce
import org.sireum.option.PipelineMode
import org.sireum.option.ProgramTarget
import org.sireum.pipeline.gen.ModuleGenerator
import org.sireum.util._

case class BakarProgramTranslator (
    title: String = "",
    
    @Input
    jagoProgramTarget : ProgramTarget.Type,
    
    @Input
    parseGnat2XMLresults: MMap[FileResourceUri, CompilationUnit],
    
    @Produce
    jagoProgramResults: ISeq[String]    
)

object GenerateModuleCore_ProgramTrans{
  def main(args: Array[String]){
    val opt = PipelineMode()
    opt.classNames = Array(BakarProgramTranslator.getClass().getName().dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/jago/program"
    opt.genClassName = "BakarProgramTranslatorModuleCore"
    
    ModuleGenerator.run(opt) 
  }
}
