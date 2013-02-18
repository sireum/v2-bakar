package org.sireum.bakar.jago.util

import org.stringtemplate.v4.STGroupFile
import org.sireum.util.FileUtil



class test {
  val x = println("1. x")
  val y = println("2. y")
  def foo = {
    "How are you"
  }
}

object obj {
  val x = "Inside the obj";
  var y = 0;
  def printCurrentState {
    y = y + 1
    println(">>> " + y)
  }
}

object Test1{
  def updateST(st: org.stringtemplate.v4.ST, 
      attributeName: String, value: String){
    st.add(attributeName, value)
  }
  
  def main(args: Array[String]){
    // @Switch(false)
        
//    for(m <- cls.getDeclaredMethods() if m.getName() == "foo") {
//      val result = m.invoke(y)
//      println(result)
//    }
    
    val ls = List("How")
    val res = ls.dropRight(1)

    val stg = new STGroupFile(getClass.getResource("./../xml/" + TypeNameSpace.TypeTransTemplate_Coq).getPath(), "UTF-8", '$', '$')
    val zz = stg.getInstanceOf("typeRename")
    updateST(zz, "newName", "new")
    println(zz.render())
    updateST(zz, "oldName", "old")
//    zz.add("newName", "new")
//    zz.add("oldName", "old")
    println(zz.render())
    
//    val result = FileUtil.fileUri(this.getClass, "")
//    println("The result is: \n" + result)
    
//  var url = getClass.getResource("./../module/" + TypeNameSpace.ProgramTransTemplate_Coq)
//  val stg = new STGroupFile(url.getPath(), "UTF-8", '$', '$')
//  val result = stg.getInstanceOf("optionV")
//  // result.add("value", "V")
//  println(result.render())
    
//    val str = "Some of ddd";
//    println(str)
//    val result = str.split(" of ")
//    println(result.apply(0))
//    println(result.apply(1))
//    
//    val map = Map[String, String]("xxx" -> "3", "yyy" -> "2", "zzz" -> "1")
//    val reverse = map.map(_.swap)
//    val fr = reverse.toSeq.sortBy(_._1)
//    for(e <- fr)
//      println(e._1 + "->" + e._2)
    var x = "how";
    var y = "are";
    def foo (p: String) = {p match {case "how" | "are" => "you" case _ => "!!!"}}
    println(foo(x))
    println(foo(y))
    
  }
  
}

