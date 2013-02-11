package org.sireum.bakar.jago.module

import org.sireum.util._
import org.sireum.pipeline._
import java.lang.String

object TestModModule extends PipelineModule {
  def title = "Test Mod"
  def origin = classOf[TestMod]

  val globalStrKey = "Global.str"
  val resultsKey = "TestMod.results"

  def compute(job : PipelineJob, info : PipelineJobModuleInfo) : MBuffer[Tag] = {
    val tags = marrayEmpty[Tag]
    try {
      val module = Class.forName("org.sireum.bakar.coq.module.TestModDef")
      val cons = module.getConstructors()(0)
      val params = Array[AnyRef](job, info)
      val inst = cons.newInstance(params : _*)
    } catch {
      case e =>
        e.printStackTrace
        tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker, e.getMessage);
    }
    return tags
  }

  override def initialize(job : PipelineJob) {
  }

  override def validPipeline(stage : PipelineStage, job : PipelineJob) : MBuffer[Tag] = {
    val tags = marrayEmpty[Tag]
    val deps = ivector[PipelineModule]()
    deps.foreach(d =>
      if(stage.modules.contains(d)){
        tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
            "'" + this.title + "' depends on '" + d.title + "' yet both were found in stage '" + stage.title + "'"
        )
      }
    )
    return tags
  }

  def inputDefined (job : PipelineJob) : MBuffer[Tag] = {
    val tags = marrayEmpty[Tag]
    var _str : scala.Option[AnyRef] = None
    var _strKey : scala.Option[String] = None

    val keyliststr = List(TestModModule.globalStrKey)
    keyliststr.foreach(key => 
      if(job ? key) { 
        if(_str.isEmpty) {
          _str = Some(job(key))
          _strKey = Some(key)
        }
        if(!(job(key).asInstanceOf[AnyRef] eq _str.get)) {
          tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
            "Input error for '" + this.title + "': 'str' keys '" + _strKey.get + " and '" + key + "' point to different objects.")
        }
      }
    )

    _str match{
      case Some(x) =>
        if(!x.isInstanceOf[java.lang.String]){
          tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
            "Input error for '" + this.title + "': Wrong type found for 'str'.  Expecting 'java.lang.String' but found '" + x.getClass.toString + "'")
        }
      case None =>
        tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
          "Input error for '" + this.title + "': No value found for 'str'")       
    }
    return tags
  }

  def outputDefined (job : PipelineJob) : MBuffer[Tag] = {
    val tags = marrayEmpty[Tag]
    if(!(job ? TestModModule.resultsKey)) {
      tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
        "Output error for '" + this.title + "': No entry found for 'results'. Expecting (TestModModule.resultsKey)") 
    }

    if(job ? TestModModule.resultsKey && !job(TestModModule.resultsKey).isInstanceOf[scala.Boolean]) {
      tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker, 
        "Output error for '" + this.title + "': Wrong type found for TestModModule.resultsKey.  Expecting 'scala.Boolean' but found '" + 
        job(TestModModule.resultsKey).getClass.toString + "'")
    } 
    return tags
  }

  def modGetStr (options : scala.collection.Map[Property.Key, Any]) : java.lang.String = {
    if (options.contains(TestModModule.globalStrKey)) {
       return options(TestModModule.globalStrKey).asInstanceOf[java.lang.String]
    }

    throw new Exception("Pipeline checker should guarantee we never reach here")
  }

  def setStr (options : MMap[Property.Key, Any], str : java.lang.String) : MMap[Property.Key, Any] = {

    options(TestModModule.globalStrKey) = str

    return options
  }

  def getResults (options : scala.collection.Map[Property.Key, Any]) : scala.Boolean = {
    if (options.contains(TestModModule.resultsKey)) {
       return options(TestModModule.resultsKey).asInstanceOf[scala.Boolean]
    }

    throw new Exception("Pipeline checker should guarantee we never reach here")
  }

  def modSetResults (options : MMap[Property.Key, Any], results : scala.Boolean) : MMap[Property.Key, Any] = {

    options(TestModModule.resultsKey) = results

    return options
  }
}

trait TestModModule {
  def job : PipelineJob

  def str : java.lang.String = TestModModule.modGetStr(job.properties)


  def results_=(results : scala.Boolean) { TestModModule.modSetResults(job.properties, results) }
}