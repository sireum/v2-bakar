package org.sireum.bakar.pilar

import org.sireum.util._
import org.sireum.pipeline._
import java.lang.String
import org.sireum.pilar.ast.Model
import scala.collection.immutable.Map
import scala.collection.immutable.Seq

object NodePrettyPrinterModule extends PipelineModule {
  def title = "NodePrettyPrinter"
  def origin = classOf[NodePrettyPrinter]

  val resultsKey = "NodePrettyPrinter.results"
  val globalModelsKey = "Global.models"

  def compute(job : PipelineJob, info : PipelineJobModuleInfo) : MBuffer[Tag] = {
    val tags = marrayEmpty[Tag]
    try {
      val module = Class.forName("org.sireum.bakar.pilar.NodePrettyPrinterDef")
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
    var _models : scala.Option[AnyRef] = None
    var _modelsKey : scala.Option[String] = None

    val keylistmodels = List(NodePrettyPrinterModule.globalModelsKey)
    keylistmodels.foreach(key => 
      if(job ? key) { 
        if(_models.isEmpty) {
          _models = Some(job(key))
          _modelsKey = Some(key)
        }
        if(!(job(key).asInstanceOf[AnyRef] eq _models.get)) {
          tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
            "Input error for '" + this.title + "': 'models' keys '" + _modelsKey.get + " and '" + key + "' point to different objects.")
        }
      }
    )

    _models match{
      case Some(x) =>
        if(!x.isInstanceOf[scala.collection.immutable.Seq[org.sireum.pilar.ast.Model]]){
          tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
            "Input error for '" + this.title + "': Wrong type found for 'models'.  Expecting 'scala.collection.immutable.Seq[org.sireum.pilar.ast.Model]' but found '" + x.getClass.toString + "'")
        }
      case None =>
        tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
          "Input error for '" + this.title + "': No value found for 'models'")       
    }
    return tags
  }

  def outputDefined (job : PipelineJob) : MBuffer[Tag] = {
    val tags = marrayEmpty[Tag]
    if(!(job ? NodePrettyPrinterModule.resultsKey)) {
      tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
        "Output error for '" + this.title + "': No entry found for 'results'. Expecting (NodePrettyPrinterModule.resultsKey)") 
    }

    if(job ? NodePrettyPrinterModule.resultsKey && !job(NodePrettyPrinterModule.resultsKey).isInstanceOf[scala.collection.immutable.Map[java.lang.String, java.lang.String]]) {
      tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker, 
        "Output error for '" + this.title + "': Wrong type found for NodePrettyPrinterModule.resultsKey.  Expecting 'scala.collection.immutable.Map[java.lang.String, java.lang.String]' but found '" + 
        job(NodePrettyPrinterModule.resultsKey).getClass.toString + "'")
    } 
    return tags
  }

  def modGetModels (options : scala.collection.Map[Property.Key, Any]) : scala.collection.immutable.Seq[org.sireum.pilar.ast.Model] = {
    if (options.contains(NodePrettyPrinterModule.globalModelsKey)) {
       return options(NodePrettyPrinterModule.globalModelsKey).asInstanceOf[scala.collection.immutable.Seq[org.sireum.pilar.ast.Model]]
    }

    throw new Exception("Pipeline checker should guarantee we never reach here")
  }

  def setModels (options : MMap[Property.Key, Any], models : scala.collection.immutable.Seq[org.sireum.pilar.ast.Model]) : MMap[Property.Key, Any] = {

    options(NodePrettyPrinterModule.globalModelsKey) = models

    return options
  }

  def getResults (options : scala.collection.Map[Property.Key, Any]) : scala.collection.immutable.Map[java.lang.String, java.lang.String] = {
    if (options.contains(NodePrettyPrinterModule.resultsKey)) {
       return options(NodePrettyPrinterModule.resultsKey).asInstanceOf[scala.collection.immutable.Map[java.lang.String, java.lang.String]]
    }

    throw new Exception("Pipeline checker should guarantee we never reach here")
  }

  def modSetResults (options : MMap[Property.Key, Any], results : scala.collection.immutable.Map[java.lang.String, java.lang.String]) : MMap[Property.Key, Any] = {

    options(NodePrettyPrinterModule.resultsKey) = results

    return options
  }
}

trait NodePrettyPrinterModule {
  def job : PipelineJob

  def models : scala.collection.immutable.Seq[org.sireum.pilar.ast.Model] = NodePrettyPrinterModule.modGetModels(job.properties)


  def results_=(results : scala.collection.immutable.Map[java.lang.String, java.lang.String]) { NodePrettyPrinterModule.modSetResults(job.properties, results) }
}