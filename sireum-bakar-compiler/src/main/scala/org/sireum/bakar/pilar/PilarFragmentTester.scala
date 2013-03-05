package org.sireum.bakar.pilar

import org.sireum.pilar.parser.PilarParser
import org.sireum.pilar.pretty.NodePrettyPrinter
import org.sireum.util.FileUtil

object PilarFragmentTester {
  val claz = classOf[org.sireum.pilar.ast.PackageElement]
  //val claz = classOf[org.sireum.pilar.ast.Exp]
  //val claz = classOf[org.sireum.pilar.ast.Model.getClass]

  def main(args : Array[String]) {
    val frag = FileUtil.fileUri(this.getClass, "frag.plr")
    val p = PilarParser.parseFileWithErrorAsString(frag, claz)
    println(p)
    if (p._1.isDefined) {
      println(NodePrettyPrinter.print(p._1.get))
    }
  }
}