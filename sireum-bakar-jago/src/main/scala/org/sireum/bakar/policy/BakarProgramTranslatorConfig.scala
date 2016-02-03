package org.sireum.bakar.policy

import org.sireum.pipeline.Input
import org.sireum.util.MMap
import org.sireum.bakar.xml.CompilationUnit
import org.sireum.util.FileResourceUri
import org.sireum.pipeline.Produce
import org.sireum.option.PipelineMode
import org.sireum.option.ProgramTarget
import org.sireum.util._

case class BakarProgramTranslator(
  title : String = "",

  @Input jagoProgramTarget : ProgramTarget.Type,

  @Input parseGnat2XMLresults : IMap[FileResourceUri, CompilationUnit],

  @Produce jagoProgramResults : ISeq[String])

object GenerateModuleCore_ProgramTrans {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/policy"    
    val cnames = Array(BakarProgramTranslator.getClass.getName.dropRight(1))

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")
    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))    
    println(e.run(10000, args, None, None))
  }
}
