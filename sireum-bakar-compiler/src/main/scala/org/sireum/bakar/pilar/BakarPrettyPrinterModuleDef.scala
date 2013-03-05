package org.sireum.bakar.pilar

import org.sireum.pilar.ast._
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.util._
import org.sireum.pilar.pretty.NodePrettyPrinter

class BakarPrettyPrinterModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarPrettyPrinterModule {
  var result = mmapEmpty[String, String]
  for (m <- this.models)
    result(m.sourceURI.get) = NodePrettyPrinter.print(m)
  this.results_=(result.toMap)
}
