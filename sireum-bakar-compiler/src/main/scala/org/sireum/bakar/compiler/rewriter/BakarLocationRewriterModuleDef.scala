package org.sireum.bakar.compiler.rewriter

import org.sireum.util.ISeq
import org.sireum.util.IMap
import org.sireum.pipeline.Input
import org.sireum.pipeline.Output
import org.sireum.util.Exec
import org.sireum.bakar.symbol.TypeDecl
import org.sireum.util.ResourceUri
import org.sireum.pilar.ast.Model
import org.sireum.util._
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.pilar.ast.LocationDecl
import org.sireum.pilar.ast.ActionLocation
import org.sireum.pilar.ast.ComplexLocation
import org.sireum.pilar.ast.Transformation
import org.sireum.pilar.ast.Body
import org.sireum.pilar.ast.ImplementedBody
import org.sireum.pilar.ast.NameUser
import org.sireum.pilar.ast.GotoJump
import java.net.URI

class BakarLocationRewriterModuleDef (val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarLocationRewriterModule {
  var locs : ISeq[LocationDecl] = null
  val r = Rewriter.build[Model]({
    case b: ImplementedBody =>
      locs = b.locations 
      b
    case a: ActionLocation =>
      val next = a.index + 1
      val nextLabel = locs(next).name.get
      val label = NameUser(nextLabel.name)
      val u = new URI(nextLabel.uri)
      label.uri(u.getScheme, u.getHost, u.getPath.split("/").toList, nextLabel.uri)
      
      val t = Transformation(ivectorEmpty,
          None,
          ivector(a.action),
          Some(GotoJump(ivectorEmpty, label)))
          
      ComplexLocation(a.name,
          a.annotations,
          ivector(t))
  }, Rewriter.TraversalMode.TOP_DOWN, true)
  
  models = for(m <- models) yield { r(m) }
}

case class BakarLocationRewriter(

  title: String = "Bakar Exp Rewriter",
  @Input @Output models: ISeq[Model])

object BakarLocationRewriter {
  def main(args: Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/compiler/rewriter"
    val cname = BakarLocationRewriter.getClass.getName.dropRight(1)

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cname)

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}