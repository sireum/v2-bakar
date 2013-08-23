package org.sireum.bakar.compiler.module

import org.sireum.bakar.xml.CompilationUnit
import org.sireum.util.FileResourceUri
import org.sireum.util.MMap
import org.sireum.option.PipelineMode
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.pilar.ast.Model
import org.sireum.util._
import org.sireum.pipeline.Output
import java.io.File

case class BakarTranslator(

  title : String = "Bakar Vistor",

  @Input parseGnat2XMLresults : IMap[FileResourceUri, CompilationUnit],

  @Input regression : Boolean = false,
  
  @Output models : ISeq[Model])

object BakarTranslator {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/compiler/module"    
    val cnames = Array(BakarTranslator.getClass.getName.dropRight(1))

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))

    val e = new Exec()
    // current sireum dist may not have the needed sireum classes so use 
    // eclipse's classpath instead
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}