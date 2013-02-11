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
  def main(args: Array[String]){
    // @Switch(false)
        
//    for(m <- cls.getDeclaredMethods() if m.getName() == "foo") {
//      val result = m.invoke(y)
//      println(result)
//    }
    
    val ls = List("How")
    val res = ls.dropRight(1)

//    val stg = new STGroupFile(getClass.getResource(TypeNameSpace.TypeTransTemplate_OCaml), "UTF-8", '$', '$')
//    val result = stg.getInstanceOf("typeRename")
//    result.add("newName", "new")
//    result.add("oldName", "old")
//    println(result.toString())
    
//    val result = FileUtil.fileUri(this.getClass, "")
//    println("The result is: \n" + result)
    
//  var url = getClass.getResource("./../module/" + TypeNameSpace.ProgramTransTemplate_Coq)
//  val stg = new STGroupFile(url.getPath(), "UTF-8", '$', '$')
//  val result = stg.getInstanceOf("optionV")
//  // result.add("value", "V")
//  println(result.render())
    
    val str = "Some of ddd";
    println(str)
    val result = str.split(" of ")
    println(result.apply(0))
    println(result.apply(1))
  }
  
}

