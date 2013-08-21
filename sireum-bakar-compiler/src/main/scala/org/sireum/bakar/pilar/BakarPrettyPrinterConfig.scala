package org.sireum.bakar.pilar

import org.sireum.util.ISeq
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.pilar.ast.Model
import org.sireum.option.PipelineMode
import org.sireum.util.Exec

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
    // current sireum dist may not have the needed sireum classes so use 
    // eclipse's classpath instead
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}