package org.sireum.bakar.jago.module

import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineStage
//import org.sireum.util.ImplicitLogging

object TestMe {
//object TestMe extends ImplicitLogging {
  def main(args : Array[String]) {
//  val pipeline = 
//    PipelineConfiguration("",false,PipelineStage("", false, TestModModule))
//    val job = PipelineJob()
//    TestModModule.setStr(job.properties, "inputt")
//    
//    pipeline.compute(job)
    
//    assert(TestModModule.getResults(job.properties))
    println("Test Case")
  }
}
class TestModDef (val job : PipelineJob, info : PipelineJobModuleInfo) extends TestModModule {
  val inny = this.str
  
  println(inny)
  
  this.results_=(inny == "input")
}