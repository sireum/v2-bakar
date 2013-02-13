package org.sireum.bakar.jago.util

import org.stringtemplate.v4.STGroupFile
import org.sireum.util._
import org.sireum.option.ProgramTarget

object Factory {
  // the default program translation option is Coq
  var option: ProgramTarget.Type = ProgramTarget.Coq
  var url = (option: @unchecked) match {
    case ProgramTarget.Ocaml =>
      getClass.getResource("./../module/" + TypeNameSpace.ProgramTransTemplate_OCaml)
    case ProgramTarget.Coq =>
      getClass.getResource("./../module/" + TypeNameSpace.ProgramTransTemplate_Coq)
  }
  val stg = new STGroupFile(url.getPath(), "UTF-8", '$', '$')
  // use natural number to represent variable string: VarStr -> NatVal
  val identMap = mmapEmpty[String, String]
  var c = 0
  
  def setOption(theOption: ProgramTarget.Type) {
    if(theOption != ProgramTarget.Coq && theOption != ProgramTarget.Ocaml){
      println("program translator usage: target option can be either Coq or OCaml !")
    }
    option = theOption
  }
  
  def buildOptionV(value: Option[String]) = {
    val result = stg.getInstanceOf("optionVal")
    if(value.isDefined)
      result.add("value", value.get)
    result.render()
  }
  
  def buildMode(mode: String) = {
    // In XML AST, mode is AN_OUT_MODE, or AN_IN_MODE
    val result = mode match {
      case "AN_IN_MODE" => 
        Some("In")
      case "AN_OUT_MODE" => 
        Some("Out")
      case "AN_IN_OUT_MODE" =>
        Some("In Out")
      case _ => 
        None
    }
    assert(result.isDefined)
    result.get
  }
  
  def buildBinaryExpr(op: String, loperand: String, roperand: String) = {
    val result = stg.getInstanceOf("binaryExpr") 
    result.add("op", op)
    result.add("loperand", loperand)
    result.add("roperand", roperand)
    result.render()
  }
  
  def buildUnaryExpr(op: String, operand: String) = {
    val result = stg.getInstanceOf("unaryExpr")
    result.add("op", op)
    result.add("operand", operand)
    result.render()
  }
  
  def buildId(theType: String, id_uri: String, id: String) = {
    val value = identMap.get(id_uri)
    if(value.isDefined){
      value.get
    }else{
      c = c + 1
      val mTrans = Map[String, String]("Boolean" -> "Bid", "Integer" -> "Aid")
      var o: Option[String] = None
      
      for(e <- mTrans if o.isEmpty) {
        if(theType.contains(e._1))
          o = Some(e._2)
      }
      val result = stg.getInstanceOf("varId")
      // the identifier can be either variable or function name. theType will be null if it's function name
      if(o.isDefined)
        result.add("theType", o.get)
      result.add("id", c)
      result.add("annotation", id)
      identMap += (id_uri -> result.render())
      result.render()      
    }
  }
  
  /**
   * In Coq, the variables on both sides of assignment, for example x = y, have different representation forms
   * Its Coq representation is: Sassign x (Evar y), 
   * where the left-hand is an identifier, while its right-hand is an expression with prefix "Evar"
   */
  def buildIdentifierExpr(varId: String) = {
    if(varId.startsWith("Econst") || varId.startsWith("Evar") || 
        varId.startsWith("Ebinop") || varId.startsWith("Eunop")){
      varId
    }else{ 
      // val varId = buildId(theType, id)
      val result = stg.getInstanceOf("identifierExpr")
      result.add("id", varId)
      result.render()
    }
  }
  
  def buildConstant(theType: String, constVal: String) = {
    val mTrans = Map[String, String]("integer" -> "Ointconst")
    var o: Option[String] = None
    for(e <- mTrans if !(o.isDefined)) {
      if(theType.contains(e._1))
        o = Some(e._2)
    }
    
    val result = stg.getInstanceOf("constant")
    if(o.isDefined)
      result.add("theType", o.get)
    result.add("constVal", constVal)
    result.render()
  }
  
  def buildConstantExpr(theType: String, constVal: String) = {
    val result = stg.getInstanceOf("constantExpr")
    val o = buildConstant(theType, constVal)
    result.add("constVal", o)
    result.render()
  }
  
  def buildProcedureCall(procName: String, args: String*) = {
    val result = stg.getInstanceOf("procedureCall")
    result.add("procName", procName)
    args.foreach(arg => result.add("args", arg))
    result.render()
  }
  
  def buildSeqStmt(stmts: String*): String = {
    // use "Sseq" to make the statements in sequence
    assert(stmts.length > 0)
    if(stmts.length == 1){
      stmts.head
    }else{
      val result = stg.getInstanceOf("seqStmt")
      result.add("stmt1", stmts.head)
      result.add("stmt2", buildSeqStmt(stmts.tail: _*))
      result.render()
    }
  }
  
  def buildWhileStmt(cond: String, loopInv: String, loopBody: String) = {
    val result = stg.getInstanceOf("whileStmt")
    result.add("cond", cond)
    result.add("loopInv", loopInv)
    result.add("loopBody", loopBody)
    result.render()
  }
  
  def buildIfStmt(cond: String, ifBody: String) = {
    val result = stg.getInstanceOf("ifStmt")
    result.add("cond", cond)
    result.add("ifBody", ifBody)
    result.render()
  }
  
  def buildAssignStmt(lhs: String, rhs: String) = {
    val result = stg.getInstanceOf("assignStmt")
    result.add("lhs", lhs)
    result.add("rhs", rhs)
    result.render()
  }
  
  def buildParameter(id: String, mode: String, initExp: Option[String]) = {
    val result = stg.getInstanceOf("param")
    result.add("id", id)
    result.add("mode", mode)
    if(initExp.isDefined)
      result.add("initExp", initExp.get)
    result.render()
  }
  
  // + + + 
  def buildListAttributes(st: org.stringtemplate.v4.ST, 
      attributeName: String, attributeValues: String*) = {
    (option: @unchecked) match {
      case ProgramTarget.Coq =>
        attributeValues.foreach(v => st.add(attributeName, v))
      case ProgramTarget.Ocaml =>
        // st.add(attributeName, buildConstruct(attributeValues: _*))
        // drop the right most element "nil" in the list object
        val attVals = attributeValues.dropRight(1)
        attVals.foreach(v => st.add(attributeName, v))
    }
    st
  }
  
  def buildSubprogAspectSpecs(pre: Option[String], post: Option[String]) = {
    val result = stg.getInstanceOf("subprogAspectSpecs")
    if(pre.isDefined)
      result.add("pre", pre.get)
    if(post.isDefined)
      result.add("post", post.get)
    result.render()
  }
  
  def buildIdentiferDecl(theType: String, ids: MList[String], optionalInit: Option[String]) = {
    val result = stg.getInstanceOf("identiferDecl")
    if(optionalInit.isDefined)
      result.add("optionalInit", optionalInit.get)
    buildListAttributes(result, "ids", ids: _*).render()
  }
  
  def buildProcedureBody(procName: String, aspectSpecs: Option[String], params: MList[String], 
      identDecls: MList[String], procBody: String) = {
    val result = stg.getInstanceOf("procedureBody")
    // result.add("procName", procName)
    result.add("procBody", procBody)
    if(aspectSpecs.isDefined)
      result.add("aspectSpecs", aspectSpecs.get)
    val st1 = buildListAttributes(result, "params", params: _*)
    val st2 = buildListAttributes(st1, "identDecls", identDecls: _*)
    st2.render()
  }
  
  def buildFunctionBody(funcName: String, aspectSpecs: Option[String], returnT: String, params: MList[String], 
      identDecls: MList[String], funcBody: String) = {
    val result = stg.getInstanceOf("functionBody")
    // result.add("funcName", funcName)
    result.add("returnT", returnT)
    result.add("funcBody", funcBody)
    if(aspectSpecs.isDefined)
      result.add("aspectSpecs", aspectSpecs.get)
    val st1 = buildListAttributes(result, "params", params: _*)
    val st2 = buildListAttributes(st1, "identDecls", identDecls: _*)
    st2.render()
  }
  
  def buildSubProgram(kind: String, prog: String, annotation: String) = {
    val result = stg.getInstanceOf("subProgram")
    result.add("annotation", annotation)
    result.add("kind", kind)
    result.add("prog", prog)
    result.render()
  }
  
  def buildPackageBody(pkgBodyName: String, pkgBodyDeclItems: String*) = {
    val o: String = (option: @unchecked) match {
      case ProgramTarget.Coq => "Coq"
      case ProgramTarget.Ocaml => "OCaml"
    }
    println("\n(* " + "Translate SPARK Into: " + o + " ! *)\n\n")
    println("(****************************")
    println(" mapping from var string to nat value ")
    for(e <- identMap){
      println("\t" + e._1 + " -> " + e._2 + ";")
    }
    println("****************************)")
    
    
    val result = stg.getInstanceOf("packageBody")
    result.add("pkgBodyName", pkgBodyName)
    buildListAttributes(result, "pkgBodyDeclItems", pkgBodyDeclItems: _*).render()
  }
}







