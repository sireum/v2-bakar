package org.sireum.bakar.pilar

import org.sireum.util.ISeq
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.pilar.ast.Model
import org.sireum.pipeline.gen.ModuleGenerator
import org.sireum.option.PipelineMode

case class BakarPrettyPrinter(
  title : String = "BakarPrettyPrinter",

  @Input models : ISeq[Model],

  @Produce results : Map[String, String])

object BakarPrettyPrinter {
  def main(args : Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(BakarPrettyPrinter.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/pilar"
    opt.genClassName = "BakarPrettyPrinterCore"

    ModuleGenerator.run(opt)
  }
}