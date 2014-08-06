package org.sireum.bakar.xml.module

import org.sireum.util.FileResourceUri
import org.sireum.util.IMap
import org.sireum.option.PipelineMode
import org.sireum.pipeline.Consume
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.pipeline.Output
import org.sireum.bakar.xml.CompilationUnit
import org.sireum.util.Exec

case class Gnat2XMLWrapper(
  title : String = "Gnat2XML Wrapper Module",

  @Input srcFiles : Seq[FileResourceUri],

  @Input destDir : scala.Option[FileResourceUri] = None,

  @Input gnatBin : scala.Option[FileResourceUri] = None,
  
  @Produce gnat2xmlResults : IMap[FileResourceUri, FileResourceUri])

case class ParseGnat2XML(
  title : String = "ParseGnat2XML Module",

  @Consume(Array(classOf[Gnat2XMLWrapper])) gnat2xmlResults : IMap[FileResourceUri, FileResourceUri],

  @Produce @Output parseGnat2XMLresults : IMap[FileResourceUri, CompilationUnit])

object Gnat2XMLWrapper {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/xml/module"    
    val cnames = Array(ParseGnat2XML.getClass.getName.dropRight(1))

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")
    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))    
    println(e.run(10000, args, None, None))
  }
}