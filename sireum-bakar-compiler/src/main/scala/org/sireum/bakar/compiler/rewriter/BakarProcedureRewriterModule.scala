// Do not edit this file. It is auto-generated from org.sireum.bakar.compiler.rewriter.BakarProcedureRewriter
// by org.sireum.pipeline.gen.ModuleGenerator

package org.sireum.bakar.compiler.rewriter

import org.sireum.util._
import org.sireum.pipeline._
import org.sireum.bakar.symbol.BakarSymbolTable
import org.sireum.pilar.ast.Model
import scala.collection.immutable.Seq

object BakarProcedureRewriterModule extends PipelineModule {
  def title = "Bakar Procedure Rewriter"
  def origin = classOf[BakarProcedureRewriter]

  val globalModelsKey = "Global.models"
  val globalSymbolTableKey = "Global.symbolTable"

  def compute(job : PipelineJob, info : PipelineJobModuleInfo) : MBuffer[Tag] = {
    val tags = marrayEmpty[Tag]
    try {
      val module = Class.forName("org.sireum.bakar.compiler.rewriter.BakarProcedureRewriterModuleDef")
      val cons = module.getConstructors()(0)
      val params = Array[AnyRef](job, info)
      val inst = cons.newInstance(params : _*)
    } catch {
      case e : Throwable =>
        e.printStackTrace
        tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker, e.getMessage);
    }
    return tags
  }

  override def initialize(job : PipelineJob) {
  }

  override def validPipeline(stage : PipelineStage, job : PipelineJob) : MBuffer[Tag] = {
    val tags = marrayEmpty[Tag]
    val deps = ilist[PipelineModule]()
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
    var _symbolTable : scala.Option[AnyRef] = None
    var _symbolTableKey : scala.Option[String] = None

    val keylistsymbolTable = List(BakarProcedureRewriterModule.globalSymbolTableKey)
    keylistsymbolTable.foreach(key => 
      if(job ? key) { 
        if(_symbolTable.isEmpty) {
          _symbolTable = Some(job(key))
          _symbolTableKey = Some(key)
        }
        if(!(job(key).asInstanceOf[AnyRef] eq _symbolTable.get)) {
          tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
            "Input error for '" + this.title + "': 'symbolTable' keys '" + _symbolTableKey.get + " and '" + key + "' point to different objects.")
        }
      }
    )

    _symbolTable match{
      case Some(x) =>
        if(!x.isInstanceOf[org.sireum.bakar.symbol.BakarSymbolTable]){
          tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
            "Input error for '" + this.title + "': Wrong type found for 'symbolTable'.  Expecting 'org.sireum.bakar.symbol.BakarSymbolTable' but found '" + x.getClass.toString + "'")
        }
      case None =>
        tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
          "Input error for '" + this.title + "': No value found for 'symbolTable'")       
    }
    var _models : scala.Option[AnyRef] = None
    var _modelsKey : scala.Option[String] = None

    val keylistmodels = List(BakarProcedureRewriterModule.globalModelsKey)
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
    if(!(job ? BakarProcedureRewriterModule.globalModelsKey)) {
      tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker,
        "Output error for '" + this.title + "': No entry found for 'models'. Expecting (BakarProcedureRewriterModule.globalModelsKey)") 
    }

    if(job ? BakarProcedureRewriterModule.globalModelsKey && !job(BakarProcedureRewriterModule.globalModelsKey).isInstanceOf[scala.collection.immutable.Seq[org.sireum.pilar.ast.Model]]) {
      tags += PipelineUtil.genTag(PipelineUtil.ErrorMarker, 
        "Output error for '" + this.title + "': Wrong type found for BakarProcedureRewriterModule.globalModelsKey.  Expecting 'scala.collection.immutable.Seq[org.sireum.pilar.ast.Model]' but found '" + 
        job(BakarProcedureRewriterModule.globalModelsKey).getClass.toString + "'")
    } 
    return tags
  }

  def getSymbolTable (options : scala.collection.Map[Property.Key, Any]) : org.sireum.bakar.symbol.BakarSymbolTable = {
    if (options.contains(BakarProcedureRewriterModule.globalSymbolTableKey)) {
       return options(BakarProcedureRewriterModule.globalSymbolTableKey).asInstanceOf[org.sireum.bakar.symbol.BakarSymbolTable]
    }

    throw new Exception("Pipeline checker should guarantee we never reach here")
  }

  def setSymbolTable (options : MMap[Property.Key, Any], symbolTable : org.sireum.bakar.symbol.BakarSymbolTable) : MMap[Property.Key, Any] = {

    options(BakarProcedureRewriterModule.globalSymbolTableKey) = symbolTable

    return options
  }

  def getModels (options : scala.collection.Map[Property.Key, Any]) : scala.collection.immutable.Seq[org.sireum.pilar.ast.Model] = {
    if (options.contains(BakarProcedureRewriterModule.globalModelsKey)) {
       return options(BakarProcedureRewriterModule.globalModelsKey).asInstanceOf[scala.collection.immutable.Seq[org.sireum.pilar.ast.Model]]
    }

    throw new Exception("Pipeline checker should guarantee we never reach here")
  }

  def setModels (options : MMap[Property.Key, Any], models : scala.collection.immutable.Seq[org.sireum.pilar.ast.Model]) : MMap[Property.Key, Any] = {

    options(BakarProcedureRewriterModule.globalModelsKey) = models

    return options
  }

  object ConsumerView {
    implicit class BakarProcedureRewriterModuleConsumerView (val job : PropertyProvider) extends AnyVal {
      def symbolTable : org.sireum.bakar.symbol.BakarSymbolTable = BakarProcedureRewriterModule.getSymbolTable(job.propertyMap)
      def models : scala.collection.immutable.Seq[org.sireum.pilar.ast.Model] = BakarProcedureRewriterModule.getModels(job.propertyMap)
    }
  }

  object ProducerView {
    implicit class BakarProcedureRewriterModuleProducerView (val job : PropertyProvider) extends AnyVal {

      def symbolTable_=(symbolTable : org.sireum.bakar.symbol.BakarSymbolTable) { BakarProcedureRewriterModule.setSymbolTable(job.propertyMap, symbolTable) }
      def symbolTable : org.sireum.bakar.symbol.BakarSymbolTable = BakarProcedureRewriterModule.getSymbolTable(job.propertyMap)

      def models_=(models : scala.collection.immutable.Seq[org.sireum.pilar.ast.Model]) { BakarProcedureRewriterModule.setModels(job.propertyMap, models) }
      def models : scala.collection.immutable.Seq[org.sireum.pilar.ast.Model] = BakarProcedureRewriterModule.getModels(job.propertyMap)
    }
  }
}

trait BakarProcedureRewriterModule {
  def job : PipelineJob

  def symbolTable : org.sireum.bakar.symbol.BakarSymbolTable = BakarProcedureRewriterModule.getSymbolTable(job.propertyMap)


  def models_=(models : scala.collection.immutable.Seq[org.sireum.pilar.ast.Model]) { BakarProcedureRewriterModule.setModels(job.propertyMap, models) }
  def models : scala.collection.immutable.Seq[org.sireum.pilar.ast.Model] = BakarProcedureRewriterModule.getModels(job.propertyMap)
}