package org.sireum.bakar.compiler.rewriter

import org.sireum.util.ISeq
import org.sireum.pipeline.Output
import org.sireum.pipeline.Input
import org.sireum.pilar.ast._
//import org.sireum.pipeline.gen.ModuleGenerator
import org.sireum.option.PipelineMode
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.pipeline.PipelineJob
import org.sireum.util._

class BakarPropertyMapRewriterModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarPropertyMapRewriterModule {
  var r = ilistEmpty[Model]
  for (m <- this.models) 
    r :+= PPRewriter.rewrite(m)
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

  def copyAnnot[T <: Annotable[T]](o : Annotable[T]) : Annotable[T] = {
    if (!o.propertyEmpty) {
      var annots = o.annotations
      for ((k, v) <- o.propertyMap if k != AnnotableProperty.annPropKey)
        annots :+= Annotation(NameUser(k.toString),
          ilist(ExpAnnotationParam(None, LiteralExp(LiteralType.RAW, "", xs.to(v)))))
      o match {
        case x : AnnotableProperty[T] =>
          x.annotations = annots
          x
        case _ => o.make(annots)
      }
    } else
      o
  }

  val rewriter = Rewriter.build[Model]({
    case o : Annotable[_] => copyAnnot(o)
    case x => x
  })

  def rewrite(m : Model) : Model = rewriter(m)
}

case class BakarPropertyMapRewriter(
  title : String = "Property Map to Annotation Rewriter",

  @Input @Output models : ISeq[Model])

object BakarPropertyMapRewriter {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/compiler/rewriter"    
    val cnames = Array(BakarPropertyMapRewriter.getClass.getName.dropRight(1))

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))

    val e = new Exec()
    // current sireum dist may not have the needed sireum classes so use 
    // eclipse's classpath instead
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}