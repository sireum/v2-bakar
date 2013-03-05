package org.sireum.bakar.compiler.module

import org.sireum.bakar.xml.CompilationUnit
import org.sireum.pipeline.gen.ModuleGenerator
import org.sireum.util.FileResourceUri
import org.sireum.util.MMap
import org.sireum.option.PipelineMode
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.pilar.ast.Model
import org.sireum.util._
import org.sireum.pipeline.Output

case class BakarTranslator(

  title : String = "Bakar Vistor",

  @Input parseGnat2XMLresults : MMap[FileResourceUri, CompilationUnit],

  @Output models : ISeq[Model])

object BakarTranslator {
  def main(args : Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(BakarTranslator.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/compiler/module"
    opt.genClassName = "BakarTranslatorModuleCore"

    ModuleGenerator.run(opt)
  }
}