package org.sireum.bakar.jago.typ

import org.sireum.option.TypeTarget
import org.sireum.pipeline.Input
import org.sireum.pipeline.Produce
import org.sireum.option.PipelineMode
import org.sireum.util.Exec

case class BakarTypTranslator ( 
    title: String = "",
    
    @Input
    jagoTypeTarget : TypeTarget.Type,

    @Produce 
    jagoTypeResults: String
)

object GenerateModuleCore_TypeTrans {
  def main(args: Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/jago/typ"    
    val cnames = Array(BakarTypTranslator.getClass.getName.dropRight(1))

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")
    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))    
    println(e.run(10000, args, None, None))
  }
}