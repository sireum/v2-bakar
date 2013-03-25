package org.sireum.bakar.compiler.rewriter

import org.sireum.util.ISeq
import org.sireum.pipeline.Output
import org.sireum.pipeline.Input
import org.sireum.pilar.ast._
import org.sireum.pipeline.gen.ModuleGenerator
import org.sireum.option.PipelineMode
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.pipeline.PipelineJob
import org.sireum.util._

class BakarPropertyMapRewriterModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarPropertyMapRewriterModule {
  var r = ilistEmpty[Model]
  for (m <- this.models) {
    r :+= PPRewriter.rewrite(m)
  }
  this.models = r
}

object PPRewriter {
  def rewrite(m : Model) : Model = new PPRewriter().rewrite(m)
}

class PPRewriter {
  val xs = new XStreamer {
    override def isDiet : Boolean = true
    override def mode : XStreamer.Mode.Type = XStreamer.Mode.XML
  }

  val rewriter = Rewriter.build[Model]({
    case o : AnnotableProperty =>
      if (!o.propertyMap.isEmpty) {
        var annots = ilistEmpty[Annotation]
        for ((k, v) <- o.propertyMap if k != ".annotations") {
          val xv = xs.to(v)
          annots :+= Annotation(NameUser(k.toString),
            ilist(ExpAnnotationParam(None, LiteralExp(LiteralType.STRING, "", xv))))
        }
        o.annotations = annots
      }
      o
    case x =>
      println("Don't know what to do with " + x)
      x

  })

  def rewrite(m : Model) : Model = rewriter(m)
}

case class BakarPropertyMapRewriter(
  title : String = "Property Map to Annotation Rewriter",

  @Input @Output models : ISeq[Model])

object BakarPropertyMapRewriter {
  def main(args : Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(BakarPropertyMapRewriter.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/compiler/rewriter"

    ModuleGenerator.run(opt)
  }
}