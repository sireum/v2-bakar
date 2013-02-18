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
  val unitTypeMap = mmapEmpty[String, Int] // from type name string to natural number
  val unitNameMap = mmapEmpty[String, Int] // from package/procedure name to natural number
  val unitIdentMap = mmapEmpty[String, Int] // from variable name to natural number
  val unitLocMap = mmapEmpty[Int, String] // from AST# number to its location
  val unitExpTypeMap = mmapEmpty[Int, Int] // from expression AST# number to its type number
  // TODO: it's none now
  val unitTypeDeclsMap = mmapEmpty[String, Int] // declared type to its ast number 
  
  val ident2TypeMap = mmapEmpty[String, String] // int x; x --> int

  var astnum = 0
  var idnum = 0
  var procnum = 0 
  var typenum = 0
  
  def next_astnum = {
    astnum = astnum + 1
    astnum
  }
  
  def next_idnum = {
    idnum = idnum + 1
    idnum
  }
  
  def next_procnum = {
    procnum = procnum + 1
    procnum
  }
  
  def next_typenum = {
    typenum = typenum + 1
    typenum
  }
  
  /**
   * For example: "hello"%string
   */
  def buildContext(value: String, ctxt: String) = {
    val result = stg.getInstanceOf("context")
    result.add("value", value)
    result.add("ctxt", ctxt)
    result.render()
  }
  
  /**
   * In Coq string should be like: "hello"%string,
   * while in OCaml, it looks like: "hello"
   */
  def buildString(str: String) = {
    (option: @unchecked) match {
      case ProgramTarget.Ocaml =>
        "\"" + str + "\""
      case ProgramTarget.Coq =>
        buildContext("\"" + str + "\"", "string")
    }
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
  
  def buildBinaryExpr(astnum: Int, op: String, loperand: String, roperand: String) = {
    val result = stg.getInstanceOf("binaryExpr") 
    result.add("astnum", astnum)
    result.add("op", op)
    result.add("loperand", loperand)
    result.add("roperand", roperand)
    result.render()
  }
  
  def buildUnaryExpr(astnum: Int, op: String, operand: String) = {
    val result = stg.getInstanceOf("unaryExpr")
    result.add("astnum", astnum)
    result.add("op", op)
    result.add("operand", operand)
    result.render()
  }

  // Map the AST# number to Location and (option: to Type, when AST is an expression)
  def buildAstMappingTable(sloc: SourceLocation, theType: Option[String]) = {
    // record the location for the current AST
    val astnum = next_astnum
    unitLocMap += (astnum -> buildLocation(sloc))
    // if the current AST is an expression, then we need to record its type
    if(theType.isDefined){
      val typenum = 
        if(unitTypeMap.get(theType.get).isDefined){
          unitTypeMap.get(theType.get).get
        }else{
          val n = next_typenum
          unitTypeMap += (theType.get -> n)
          n
        }
      unitExpTypeMap += (astnum -> typenum)
    }
    astnum
  }
  
  /**
   * the identifier can be either variable or package/procedure name. 
   * theType will be null if it's package/procedure name
   */
  def buildId(theType: Option[String], id_uri: String, id: String) = {
    // [1] Type Name Mapping
    if(theType.isDefined && unitTypeMap.get(theType.get).isEmpty){
      unitTypeMap += (theType.get -> next_typenum)
    }
    // [2] Package/Procedure Name Mapping
    if(theType.isEmpty){
      if(unitNameMap.get(id_uri).isEmpty){
        val procnum = next_procnum
        unitNameMap += (id_uri -> procnum)
        buildIdV0(id, procnum)
      }else{
        buildIdV0(id, unitNameMap.get(id_uri).get)
      }
    }else{
      // [3] Variable Name Mapping
      val result = if(unitIdentMap.get(id_uri).isEmpty){
        val idnum = next_idnum
        unitIdentMap += (id_uri -> idnum)
        // ((*L1* 8))
        buildIdV0(id, idnum)
      }else{
        buildIdV0(id, unitIdentMap.get(id_uri).get)        
      }
      ident2TypeMap += (result -> theType.get)
      result
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
  def buildIdentifierExpr(sloc: SourceLocation, varId: String) = {
    if(varId.startsWith("Econst") || varId.startsWith("Evar") || 
        varId.startsWith("Ebinop") || varId.startsWith("Eunop")){
      varId
    }else{ 
      // val varId = buildId(theType, id)
      val astnum = buildAstMappingTable(sloc, ident2TypeMap.get(varId))
      val result = stg.getInstanceOf("identifierExpr")
      result.add("astnum", astnum)
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
  
  def buildConstantExpr(astnum: Int, theType: String, constVal: String) = {
    val result = stg.getInstanceOf("constantExpr")
    result.add("astnum", astnum)
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
      result.add("astnum", next_astnum)
      result.add("stmt1", stmts.head)
      result.add("stmt2", buildSeqStmt(stmts.tail: _*))
      result.render()
    }
  }
  
  def buildWhileStmt(astnum: Int, cond: String, loopInv: String, loopBody: String) = {
    val result = stg.getInstanceOf("whileStmt")
    result.add("astnum", astnum)
    result.add("cond", cond)
    result.add("loopInv", loopInv)
    result.add("loopBody", loopBody)
    result.render()
  }
  
  def buildIfStmt(astnum: Int, cond: String, ifBody: String) = {
    val result = stg.getInstanceOf("ifStmt")
    result.add("astnum", astnum)
    result.add("cond", cond)
    result.add("ifBody", ifBody)
    result.render()
  }
  
  def buildAssignStmt(astnum: Int, lhs: String, rhs: String) = {
    val result = stg.getInstanceOf("assignStmt")
    result.add("astnum", astnum)
    result.add("lhs", lhs)
    result.add("rhs", rhs)
    result.render()
  }
  
  def buildParameter(astnum: Int, id: String, mode: String, initExp: Option[String]) = {
    val result = stg.getInstanceOf("param")
    result.add("astnum", astnum)
    result.add("id", id)
    result.add("mode", mode)
    if(initExp.isDefined)
      result.add("initExp", initExp.get)
    result.render()
  }
  
  def buildListAttributes(st: org.stringtemplate.v4.ST, 
      attributeName: String, attributeValues: String*) {
    attributeValues.foreach(v => st.add(attributeName, v))
  }
  
  def buildSubprogAspectSpecs(astnum: Int, pre: Option[String], post: Option[String]) = {
    val result = stg.getInstanceOf("subprogAspectSpecs")
    result.add("astnum", astnum)
    if(pre.isDefined)
      result.add("pre", pre.get)
    if(post.isDefined)
      result.add("post", post.get)
    result.render()
  }
  
  def buildIdentiferDecl(astnum: Int, ids: MList[String], optionalInit: Option[String]) = {
    val result = stg.getInstanceOf("identiferDecl")
    result.add("astnum", astnum)
    if(optionalInit.isDefined)
      result.add("optionalInit", optionalInit.get)
    buildListAttributes(result, "ids", ids: _*)
    result.render()
  }
  
  def buildProcedureBody(astnum: Int, procName: String, aspectSpecs: Option[String], params: MList[String], 
      identDecls: MList[String], procBody: String) = {
    val result = stg.getInstanceOf("procedureBody")
    result.add("astnum", astnum)
    result.add("procName", procName)
    result.add("procBody", procBody)
    if(aspectSpecs.isDefined)
      result.add("aspectSpecs", aspectSpecs.get)
    buildListAttributes(result, "params", params: _*)
    buildListAttributes(result, "identDecls", identDecls: _*)
    result.render()
  }
  
  def buildFunctionBody(astnum: Int, funcName: String, aspectSpecs: Option[String], returnT: String, params: MList[String], 
      identDecls: MList[String], funcBody: String) = {
    val result = stg.getInstanceOf("functionBody")
    result.add("astnum", astnum)
    result.add("funcName", funcName)
    result.add("returnT", returnT)
    result.add("funcBody", funcBody)
    if(aspectSpecs.isDefined)
      result.add("aspectSpecs", aspectSpecs.get)
    buildListAttributes(result, "params", params: _*)
    buildListAttributes(result, "identDecls", identDecls: _*)
    result.render()
  }
  
  def buildSubProgram(astnum: Int, kind: String, prog: String, annotation: Option[String]) = {
    val result = stg.getInstanceOf("subProgram")
    result.add("astnum", astnum)
    result.add("kind", kind)
    result.add("prog", prog)
    if(annotation.isDefined)
      result.add("annotation", annotation.get)
    result.render()
  }
  
  def buildPackageBody(astnum: Int, pkgBodyName: String, pkgBodyAspectSpecs: Option[String], pkgBodyDeclItems: String*) = {
    val result = stg.getInstanceOf("packageBody")
    result.add("astnum", astnum)
    result.add("pkgBodyName", pkgBodyName) 
    if(pkgBodyAspectSpecs.isDefined)
      result.add("pkgBodyAspectSpecs", pkgBodyAspectSpecs) 
    buildListAttributes(result, "pkgBodyDeclItems", pkgBodyDeclItems: _*)
    result.render()
  }
  
  /**
   * unitName should be a natural number, but it's annotated with its actual name string, so it's a string
   */
  def buildCompilationUnit(astnum: Int, unitName: String, unitDecl: String) = {
    val result = stg.getInstanceOf("compilationUnit")
    result.add("astnum", astnum)
    result.add("unitName", unitName)
    result.add("unitDecl", unitDecl)
    // [1]
    val sortedSeq1 = unitExpTypeMap.toSeq.sortBy(_._1)
    for(e <- sortedSeq1){
      result.add("unitExpTypeTable", buildMappingItem(e._1.toString, e._2.toString))
    }
    // [2]
    // reverse the map, and then sort the mapping according to the natural number
    val reversedTypeMapping = unitTypeMap.map(_.swap)
    val sortedSeq2 = reversedTypeMapping.toSeq.sortBy(_._1) 
    for(e <- sortedSeq2){
      // TODO: the type declaration AST number is now set None
      val typedecl_num = "None"
      val typeInfor = buildMappingItem(buildString(e._2), typedecl_num)
      result.add("unitTypeNameTable", buildMappingItem(e._1.toString, typeInfor)) 
    }
    result.render()
  }
  
  def buildMappingItem(key: String, value: String) = {
    val result = stg.getInstanceOf("mappingPair")
    result.add("key", key)
    result.add("value", value)
    result.render()
  }
  
  def buildLocation(sloc: SourceLocation) = {
    val result = stg.getInstanceOf("location")
    result.add("line", sloc.getLine)
    result.add("col", sloc.getCol)
    result.add("endline", sloc.getEndline)
    result.add("endcol", sloc.getEndcol)
    result.render()
  }
}







