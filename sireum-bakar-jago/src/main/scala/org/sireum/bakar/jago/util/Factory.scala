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
  val unitIdentMap = mmapEmpty[String, Int] // from variable name to natural number
  val unitTypeMap = mmapEmpty[String, Int] // from type name string to natural number
  val unitProcMap = mmapEmpty[String, Int] // from procedure name to natural number
  val unitPkgMap = mmapEmpty[String, Int] // from package name to natural number
  val unitAspectMap = mmapEmpty[String, Int] // from aspect mark name, like "Post", to natural number
  val unitExpTypeMap = mmapEmpty[Int, Int] // from expression AST# number to its type number
  // TODO: it's none now
  val unitTypeDeclsMap = mmapEmpty[String, Int] // declared type to its ast number 
  
  val ident2TypeMap = mmapEmpty[String, String] // int x; x --> int

  var astnum = 0
  var idnum = 0
  var procnum = 0 
  var pkgnum = 0
  var typenum = 0
  
  var typedeclnum = 0
  var aspectnum = 0
  
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
  
  def next_pkgnum = {
    pkgnum = pkgnum + 1
    pkgnum
  }
  
  def next_typenum = {
    typenum = typenum + 1
    typenum
  }
  
  def next_typedeclnum = {
    typedeclnum = typedeclnum + 1
    typedeclnum
  }
  
  def next_aspectnum = {
    aspectnum = aspectnum + 1
    aspectnum
  }
  
  def getIdNum(var_name: String) = {
    if(unitIdentMap.get(var_name).isEmpty){
      val idnum = next_idnum
      unitIdentMap += (var_name -> idnum)
      idnum
    }else{
      unitIdentMap.get(var_name).get        
    }
  }
  
  def getTypeNum(theType: String) = {
    if(unitTypeMap.get(theType).isDefined){
      unitTypeMap.get(theType).get
    }else{
      val n = next_typenum
      unitTypeMap += (theType -> n)
      n
    }
  }
  
  def getProcNum(proc_name: String) = {
    if(unitProcMap.get(proc_name).isEmpty){
      val proc_num = next_procnum
      unitProcMap += (proc_name -> proc_num)
      proc_num
    }else{
      unitProcMap.get(proc_name).get
    }    
  }
  
  def getPkgNum(pkg_name: String) = {
    if(unitPkgMap.get(pkg_name).isEmpty){
      val pkg_num = next_pkgnum
      unitPkgMap += (pkg_name -> pkg_num)
      pkg_num
    }else{
      unitPkgMap.get(pkg_name).get
    }    
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
  def buildAstMappingTable(sloc: SourceLocation, theExpType: Option[String]) = {
    val astnum = next_astnum
    // if the current AST is an expression, then we need to record its type
    if(theExpType.isDefined){
      val typenum = getTypeNum(theExpType.get)
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
    if(theType.isDefined)
      getTypeNum(theType.get)
    // [2] Package/Procedure Name Mapping
    if(theType.isEmpty){
      val pkg_proc_num = 
        if(id_uri.contains("package_body"))
          getPkgNum(id_uri)
        else // if(id_uri.contains("procedure_body"))
          getProcNum(id_uri)
      buildIdV0(id, pkg_proc_num) 
    }else{
      // [3] Variable Name Mapping
      val id_num = getIdNum(id_uri)
      val result = buildIdV0(id, id_num)
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
  
  def buildSeqStmt(seq_astnum: Int, stmt1: String, stmt2: String): String = {
    // use "Sseq" to make the statements in sequence
    if(stmt2 == null){
      stmt1
    }else{
      val result = stg.getInstanceOf("seqStmt")
      result.add("astnum", seq_astnum)
      result.add("stmt1", stmt1)
      result.add("stmt2", stmt2)
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
  
  def buildListAttributes(st: org.stringtemplate.v4.ST, 
      attributeName: String, attributeValues: String*) {
    attributeValues.foreach(v => st.add(attributeName, v))
  }  
  
  // paramSpecification(astnum, ids, theType, mode, initExp)
  def buildParamSpecification(astnum: Int, ids: MList[String], theType: String, mode: String, initExp: Option[String]) = {
    val result = stg.getInstanceOf("paramSpecification")
    result.add("astnum", astnum)
    buildListAttributes(result, "ids", ids: _*)
    val typeNum = getTypeNum(theType)
    result.add("theType", typeNum)
    result.add("mode", mode)
    if(initExp.isDefined)
      result.add("initExp", initExp.get)
    result.render()
  }
  
  def buildAspectSpecification(astnum: Int, aspectMark: String, aspectDef: String) = {
    val result = stg.getInstanceOf("aspectSpecification")
    result.add("astnum", astnum)
    result.add("aspectMark", aspectMark)
    result.add("aspectDef", aspectDef)
    result.render()
  }
  
  def buildIdentiferDecl(astnum: Int, ids: MList[String], theType: String, optionalInit: Option[String]) = {
    val result = stg.getInstanceOf("localVarDeclaration")
    result.add("astnum", astnum)
    buildListAttributes(result, "ids", ids: _*)
    val theTypeNum = getTypeNum(theType)
    result.add("theType", theTypeNum)
    if(optionalInit.isDefined)
      result.add("init", optionalInit.get)
    result.render()
  }
  
  def buildProcedureBody(astnum: Int, procName: String, aspectSpecs: MList[String], params: MList[String], 
      identDecls: MList[String], procBody: String) = {
    val result = stg.getInstanceOf("procedureBody")
    result.add("astnum", astnum)
    result.add("procName", procName)
    result.add("procBody", procBody) 
    buildListAttributes(result, "aspectSpecs", aspectSpecs: _*)
    buildListAttributes(result, "params", params: _*)
    buildListAttributes(result, "identDecls", identDecls: _*)
    result.render()
  }
  
  def buildFunctionBody(astnum: Int, funcName: String, returnT: String, aspectSpecs: MList[String], params: MList[String], 
      identDecls: MList[String], funcBody: String) = {
    val result = stg.getInstanceOf("functionBody")
    result.add("astnum", astnum)
    result.add("funcName", funcName)
    result.add("returnT", returnT)
    result.add("funcBody", funcBody) 
    buildListAttributes(result, "aspectSpecs", aspectSpecs: _*)
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
  
  def buildPackageBody(astnum: Int, pkgBodyName: String, pkgBodyAspectSpecs: MList[String], pkgBodyDeclItems: String*) = {
    val result = stg.getInstanceOf("packageBody")
    result.add("astnum", astnum)
    result.add("pkgBodyName", pkgBodyName)
    buildListAttributes(result, "pkgBodyAspectSpecs", pkgBodyAspectSpecs: _*)
    buildListAttributes(result, "pkgBodyDeclItems", pkgBodyDeclItems: _*)
    result.render()
  }
  
  def buildUnitDeclaration(astnum: Int, kind: String, packageUnit: String) = {
    val result = stg.getInstanceOf("unitDeclaration")
    result.add("astnum", astnum)
    result.add("kind", kind)
    result.add("packageUnit", packageUnit)
    result.render()
  }
  
  /**
   * unitName should be a natural number, but it's annotated with its actual name string, so it's a string
   */
  def buildCompilationUnit(astnum: Int, unitDecl: String) = {
    val result = stg.getInstanceOf("compilationUnit")
    result.add("astnum", astnum)
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
      val typeInfor = buildMappingItem(buildString(e._2).replaceAll(" ", "_"), typedecl_num)
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
}







