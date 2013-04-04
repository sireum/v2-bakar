package org.sireum.bakar.xml.module

import scala.Array.apply
import org.sireum.option.PipelineMode.apply
import org.sireum.pipeline.gen.ModuleGenerator
import org.sireum.util.FileResourceUri
import org.sireum.util.IMap
import org.sireum.option.PipelineMode
import org.sireum.pipeline.Consume
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.pipeline.Output
import org.sireum.bakar.xml.CompilationUnit

case class Gnat2XMLWrapper(
  title : String = "Gnat2XML Wrapper Module",

  @Input srcFiles : Seq[FileResourceUri],

  @Input destDir : scala.Option[FileResourceUri] = None,

  @Produce gnat2xmlResults : IMap[FileResourceUri, FileResourceUri])

case class ParseGnat2XML(
  title : String = "ParseGnat2XML Module",

  @Consume(Array(classOf[Gnat2XMLWrapper])) gnat2xmlResults : IMap[FileResourceUri, FileResourceUri],

  @Produce @Output parseGnat2XMLresults : IMap[FileResourceUri, CompilationUnit])

object Gnat2XMLWrapper {
  def main(args : Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(ParseGnat2XML.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/xml/module"
    opt.genClassName = "BakarXmlModulesCore"

    ModuleGenerator.run(opt)
  }
}