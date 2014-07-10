package org.sireum.bakar.symbol

import org.sireum.util._
import java.io.File
import org.sireum.pipeline.Input
import org.sireum.pipeline.Output
import org.sireum.util.Exec
import org.sireum.pilar.ast._
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.pipeline.PipelineJob
import org.sireum.util.SourceLocation.SourceLocationWithAt
import org.sireum.bakar.compiler.module.PackageURIs

class BakarLocationResolverModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarLocationResolverModule {
  def getLocation(o : PilarAstNode) : SourceLocationWithAt[_] = o.getProperty(Location.locPropKey)
  var ret = mlistEmpty[ISeq[String]]

  for (p <- symbolTable.packages if (p != PackageURIs.standardPackageURI)) {
    val pack = symbolTable.package_(p)
    val l = getLocation(pack.name.get)
    if (l.fileUri == fileUri) {
      if (l.lineBegin <= line && l.lineEnd >= line) {
        pack.elements.foreach {
          case i : ProcedureDecl => ret += ilist(pack.name.get.name, i.name.name)
          case _                 =>
        }
      } else {
        var nearest = (ilist(""), Integer.MAX_VALUE)
        pack.elements.foreach {
          case i : ProcedureDecl =>
            val pl = getLocation(i)
            
            if (pl.lineBegin <= line && pl.lineEnd >= line) {
              ret += ilist(pack.name.get.name, i.name.name)
            } else {
              // compute distance
              val d = Math.min(Math.abs(pl.lineBegin - line), Math.abs(pl.lineEnd - line))
              if (d < nearest._2)
                nearest = (ilist(pack.name.get.name, i.name.name), d)
            }
          case _ =>
        }
        if (ret.isEmpty) ret += nearest._1
      }
    }
  }
  units = ret.toList
}

case class BakarLocationResolver(
  title : String = "Bakar Location Resolver",
  @Input models : ISeq[Model],
  @Input fileUri : FileResourceUri,
  @Input line : Integer,
  @Input @Output symbolTable : BakarSymbolTable,
  @Output units : ISeq[ISeq[String]])

object BakarLocationResolver {
  def main(args : Array[String]) {
    val cnames = Array(BakarLocationResolver.getClass.getName.dropRight(1))

    val bindir = Some(new File("./bin"))
    val destdir = "../src/main/scala/org/sireum/bakar/symbol/"

    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))

    val e = new Exec()
    // current sireum dist may not have the needed sireum classes so use 
    // eclipse's classpath instead
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, bindir))
  }
}