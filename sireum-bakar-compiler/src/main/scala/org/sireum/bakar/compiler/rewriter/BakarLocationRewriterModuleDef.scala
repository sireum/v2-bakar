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
import org.sireum.pilar.ast.JumpLocation
import org.sireum.pilar.ast.LiteralType
import org.sireum.pilar.ast.AssertAction
import org.sireum.pilar.ast.LiteralExp
import org.sireum.pilar.ast.IfJump
import org.sireum.pilar.ast.IfThenJump
import org.sireum.pilar.ast.UnaryExp
import org.sireum.pilar.ast.EmptyLocation
import org.sireum.bakar.compiler.module.PilarNodeFactory.{ copyPropertyMap => cp }
import org.sireum.pilar.ast.ReturnJump
import org.sireum.pilar.ast.CallJump

class BakarLocationRewriterModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarLocationRewriterModule {
  var locs : ISeq[LocationDecl] = null
  var currLoc : Int = 0
  
  def getLabel(i : Int) = {
    val nextLabel = locs(i).name.get
    cp(nextLabel, NameUser(nextLabel.name))
  }
  
  val r = Rewriter.build[Model]({
    case b : ImplementedBody =>
      locs = b.locations
      b
    case i@ CallJump(a1, lhss, ce, None) =>
      val nextLoc = getLabel(currLoc + 1)
      cp(i, i.copy(jump = Some(GotoJump(ivectorEmpty, nextLoc))))
    case i@ IfJump(a1, Vector(itj @ IfThenJump(c, a2, trueLabel)), None) =>
      val falseLabel = getLabel(currLoc + 1)
      val (_exp, _trueLabel, _falseLabel) = c match {
        case i @ UnaryExp(op1, (UnaryExp(op2, exp))) => (exp, trueLabel, falseLabel)
        case i @ UnaryExp(op, exp) => (exp, falseLabel, trueLabel)
      }

      cp(i, IfJump(a1, ivector(cp(itj, IfThenJump(_exp, a2, _trueLabel))), 
          Some(GotoJump(ilistEmpty, _falseLabel))))
    case a : ActionLocation =>
      currLoc = a.index  
      val t = Transformation(ivectorEmpty, None, ivector(a.action),
        Some(GotoJump(ivectorEmpty, getLabel(currLoc + 1))))
      cp(a, ComplexLocation(a.name, a.annotations, ivector(t)))
    case j @ JumpLocation(name, annots, ij: IfJump) =>
      currLoc = j.index
      val t = Transformation(ivectorEmpty, None, ivectorEmpty, Some(ij))
      cp(j, ComplexLocation(name, annots, ivector(t)))
    case j @ JumpLocation(name, annots, gj: GotoJump) =>
      currLoc = j.index
      val t = Transformation(ivectorEmpty, None, ivectorEmpty, Some(gj))
      cp(j, ComplexLocation(name, annots, ivector(t)))      
    case j @ JumpLocation(name, annots, rj: ReturnJump) =>
      currLoc = j.index
      val t = Transformation(ivectorEmpty, None, ivectorEmpty, Some(rj))
      cp(j, ComplexLocation(j.name, j.annotations, ivector(t)))
    case j @ JumpLocation(name, annots, c : CallJump) =>
      currLoc = j.index
      j
    case e: EmptyLocation =>
      currLoc = e.index
      val gotoLabel = getLabel(currLoc + 1)
      val t = Transformation(ivectorEmpty, None, ivectorEmpty, 
          Some(GotoJump(ivectorEmpty, gotoLabel)))
      cp(e, ComplexLocation(e.name, e.annotations, ivector(t)))
  }, Rewriter.TraversalMode.TOP_DOWN, true)

  models = for (m <- models) yield { 
    r(m)
  }
}

case class BakarLocationRewriter(

  title : String = "Bakar Exp Rewriter",
  @Input @Output models : ISeq[Model])

object BakarLocationRewriter {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/compiler/rewriter"
    val cname = BakarLocationRewriter.getClass.getName.dropRight(1)

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cname)

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}