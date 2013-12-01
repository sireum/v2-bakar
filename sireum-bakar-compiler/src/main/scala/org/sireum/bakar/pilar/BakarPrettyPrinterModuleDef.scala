package org.sireum.bakar.pilar

import org.sireum.pilar.ast._
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.util._
import org.sireum.pilar.pretty.NodePrettyPrinter
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce

class BakarPrettyPrinterModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarPrettyPrinterModule {
  var result = ilinkedMapEmpty[String, String]
  for (m <- this.models)
    result += (m.sourceURI.get -> NodePrettyPrinter.print(m))
  this.results = result
}

case class BakarPrettyPrinter(
  title : String = "BakarPrettyPrinter",

  @Input models : ISeq[Model],

  @Produce results : Map[String, String])

object BakarPrettyPrinter {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/pilar"    
    val cnames = Array(BakarPrettyPrinter.getClass.getName.dropRight(1))

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}