package org.sireum.bakar.jago.util

import org.stringtemplate.v4.STGroupFile
import org.sireum.util._
import org.sireum.option.ProgramTarget
import org.sireum.bakar.xml.SourceLocation

class Factory(option: ProgramTarget.Type = ProgramTarget.Coq) {
  // the default program translation option is Coq
  var url = (option: @unchecked) match { 
    case ProgramTarget.Ocaml =>
      getClass.getResource("./../module/" + TypeNameSpace.ProgramTransTemplate_OCaml)
    case ProgramTarget.Coq =>
      getClass.getResource("./../module/" + TypeNameSpace.ProgramTransTemplate_Coq)
  }
  val stg = new STGroupFile(url.getPath(), "UTF-8", '$', '$')
  // use natural number to represent variable (package/procedure name) string: VarStr -> NatVal
  val unitTypeMap = mmapEmpty[String, Int]  // from type name string to natural number
  val unitNameMap = mmapEmpty[String, Int] 
  val unitIdentMap = mmapEmpty[String, Int]  
  val unitLocMap = mmapEmpty[Int, String] // from AST# uri to its location
  val unitExpTypeMap = mmapEmpty[Int, Int] // from expression AST# uri to its type number
  var n = 0
  
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

  // Map the AST# uri to Location and (option: to Type, when AST is an expression)
  def buildUriMappingTable(sloc: SourceLocation, theType: Option[String]) = {
    n = n + 1
    // record the location for the current AST
    unitLocMap += (n -> buildLocation(sloc))
    // if the current AST is an expression, then we need to record its type
    if(theType.isDefined){
      val t = unitTypeMap.get(theType.get).get
      unitExpTypeMap += (n -> t)
    }
    n
  }
  
  /**
   * the identifier can be either variable or package/procedure name. 
   * theType will be null if it's package/procedure name
   */
  def buildId(theType: Option[String], id_uri: String, id: String) = {
    // [1] Type Name Mapping
    if(theType.isDefined && unitTypeMap.get(theType.get).isEmpty){
      n = n + 1
      unitTypeMap += (theType.get -> n)
    }
    // [2] Package/Procedure Name Mapping
    if(theType.isEmpty){
      if(unitNameMap.get(id_uri).isEmpty){
        n = n + 1
        unitNameMap += (id_uri -> n)
        buildIdV0(id, n)
      }else{
        buildIdV0(id, unitNameMap.get(id_uri).get)
      }
    }else{
      // [3] Variable Name Mapping
      if(unitIdentMap.get(id_uri).isEmpty){
        n = n + 1
        unitIdentMap += (id_uri -> n)
        buildIdV0(id, n)
      }else{
        buildIdV0(id, unitIdentMap.get(id_uri).get)        
      }
    }
  }
  
  def buildIdV0(id_str: String, id_nat: Int) = {
    // mapping the id string id_str to a natural number id_nat
    val result = stg.getInstanceOf("varId")
    result.add("annotation", id_str)
    result.add("id", id_nat)
    result.render()       
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
      attributeName: String, attributeValues: String*) {
    (option: @unchecked) match {
      case ProgramTarget.Coq =>
        attributeValues.foreach(v => st.add(attributeName, v))
      case ProgramTarget.Ocaml =>
        // st.add(attributeName, buildConstruct(attributeValues: _*))
        // drop the right most element "nil" in the list object
        val attVals = attributeValues.dropRight(1)
        attVals.foreach(v => st.add(attributeName, v))
    }
  }
  
  def buildSubprogAspectSpecs(pre: Option[String], post: Option[String]) = {
    val result = stg.getInstanceOf("subprogAspectSpecs")
    if(pre.isDefined)
      result.add("pre", pre.get)
    if(post.isDefined)
      result.add("post", post.get)
    result.render()
  }
  
  def buildIdentiferDecl(uri: Int, ids: MList[String], optionalInit: Option[String]) = {
    val result = stg.getInstanceOf("identiferDecl")
    result.add("uri", uri)
    if(optionalInit.isDefined)
      result.add("optionalInit", optionalInit.get)
    buildListAttributes(result, "ids", ids: _*)
    result.render()
  }
  
  def buildProcedureBody(uri: Int, procName: String, aspectSpecs: Option[String], params: MList[String], 
      identDecls: MList[String], procBody: String) = {
    val result = stg.getInstanceOf("procedureBody")
    result.add("uri", uri)
    result.add("procName", procName)
    result.add("procBody", procBody)
    if(aspectSpecs.isDefined)
      result.add("aspectSpecs", aspectSpecs.get)
    buildListAttributes(result, "params", params: _*)
    buildListAttributes(result, "identDecls", identDecls: _*)
    result.render()
  }
  
  def buildFunctionBody(uri: Int, funcName: String, aspectSpecs: Option[String], returnT: String, params: MList[String], 
      identDecls: MList[String], funcBody: String) = {
    val result = stg.getInstanceOf("functionBody")
    result.add("uri", uri)
    result.add("funcName", funcName)
    result.add("returnT", returnT)
    result.add("funcBody", funcBody)
    if(aspectSpecs.isDefined)
      result.add("aspectSpecs", aspectSpecs.get)
    buildListAttributes(result, "params", params: _*)
    buildListAttributes(result, "identDecls", identDecls: _*)
    result.render()
  }
  
  def buildSubProgram(uri: Int, kind: String, prog: String, annotation: String) = {
    val result = stg.getInstanceOf("subProgram")
    result.add("uri", uri)
    result.add("annotation", annotation)
    result.add("kind", kind)
    result.add("prog", prog)
    result.render()
  }
  
  def buildPackageBody(pkgBodyUri: Int, pkgBodyName: String, pkgBodyAspectSpecs: Option[String], pkgBodyDeclItems: String*) = {
	 // outputSpecification() 
    val result = stg.getInstanceOf("packageBody")
    result.add("pkgBodyUri", pkgBodyUri)
    result.add("pkgBodyName", pkgBodyName) 
    if(pkgBodyAspectSpecs.isDefined)
      result.add("pkgBodyAspectSpecs", pkgBodyAspectSpecs) 
    buildListAttributes(result, "pkgBodyDeclItems", pkgBodyDeclItems: _*)
    result.render()
  }
  
  /**
   * unitName should be a natural number, but it's annotated with its actual name string, so it's a string
   */
  def buildCompilationUnit(unitUri: Int, unitName: String, unitDecl: String, unitLocation: String) = {
    val result = stg.getInstanceOf("compilationUnit")
    result.add("unitUri", unitUri)
    result.add("unitUri", unitName)
    result.add("unitDecl", unitDecl)
    buildMappingTable(result, "unitTypeMap", unitTypeMap)
    buildMappingTable(result, "unitNameMap", unitNameMap)
    buildMappingTable(result, "unitIdentMap", unitIdentMap)
    result.add("unitLocation", unitLocation)
    result.render()
  }
  
  /**
   * <mapping> is a map from string name to natural number 
   */
  def buildMappingTable(st: org.stringtemplate.v4.ST, 
      attributeName: String, mapping: MMap[String, Int]) {
    // reverse the map, and then sort the mapping according to the natural number
    val reversedMapping = mapping.map(_.swap)
    val sortedSeq = reversedMapping.toSeq.sortBy(_._1) 
    for(e <- sortedSeq){
      val m = stg.getInstanceOf("mappingTable")
      m.add("key", e._2)
      m.add("value", e._1)
      st.add(attributeName, m)
    }  
  }
  
  def buildLocation(sloc: SourceLocation) = {
    val result = stg.getInstanceOf("location")
    result.add("line", sloc.getLine)
    result.add("col", sloc.getCol)
    result.add("endline", sloc.getEndline)
    result.add("endcol", sloc.getEndcol)
    result.render()
  }
  
  def outputSpecification() {
    val o: String = (option: @unchecked) match {
      case ProgramTarget.Coq => "Coq"
      case ProgramTarget.Ocaml => "OCaml"
    }
    println("\n(* " + "Translate SPARK Into: " + o + " ! *)\n\n")
    println("(****************************")
    println(" mapping from var string to nat value ")
    for(e <- unitIdentMap){
      println("\t" + e._1 + " -> " + e._2 + ";")
    }
    println("****************************)")
  }
}







