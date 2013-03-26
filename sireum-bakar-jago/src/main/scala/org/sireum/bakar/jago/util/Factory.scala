package org.sireum.bakar.jago.util

import org.stringtemplate.v4.STGroupFile
import org.sireum.util._
import org.sireum.option.ProgramTarget
import org.sireum.bakar.xml.SourceLocation

class Factory(stg: STGroupFile) {
  /**********************************************************
   * [1] The Following Is For Bakar Jago Program Translator *
   **********************************************************/
  // use natural number to represent variable (package/procedure name) string: VarStr -> NatVal
  val unitIdentMap = mmapEmpty[String, Int] // from variable name to natural number
  val unitTypeMap = mmapEmpty[String, Int] // from type name string to natural number
  val unitProcMap = mmapEmpty[String, Int] // from procedure name to natural number
  val unitPkgMap = mmapEmpty[String, Int] // from package name to natural number
  val unitAspectMap = mmapEmpty[String, Int] // from aspect mark name, like "Post", to natural number
  val unitExpTypeMap = mmapEmpty[Int, Int] // from expression AST# number to its type number
  // TODO: it's none now
  val unitTypeDeclsMap = mmapEmpty[String, Int] // declared type to its ast number 
  
  //val ident2TypeMap = mmapEmpty[String, String] // int x; x --> int

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
    val result = stg.getInstanceOf("stringFormat")
    result.add("value", str)
    result.render()
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
      case "AN_IN_MODE" | "A_DEFAULT_IN_MODE" => 
        Some("In")
      case "AN_OUT_MODE" => 
        Some("Out")
      case "AN_IN_OUT_MODE" =>
        Some("In_Out")
      case _ => 
        None
    }
    assert(result.isDefined)
    result.get
  }
  
  def buildExpTypeTable(exp_astnum: Int, exp_type: String) {
    val typenum = getTypeNum(exp_type)
    unitExpTypeMap += (exp_astnum -> typenum)
  }
  
  def buildBinaryExpr(astnum: Int, theType: String, op: String, loperand: String, roperand: String) = {
    buildExpTypeTable(astnum, theType)
    val result = stg.getInstanceOf("binaryExpr") 
    result.add("astnum", astnum)
    result.add("op", op)
    result.add("loperand", loperand)
    result.add("roperand", roperand)
    result.render()
  }
  
  def buildUnaryExpr(astnum: Int, theType: String, op: String, operand: String) = {
    buildExpTypeTable(astnum, theType)
    val result = stg.getInstanceOf("unaryExpr")
    result.add("astnum", astnum)
    result.add("op", op)
    result.add("operand", operand)
    result.render()
  }
  
  /**
   * the identifier can be either variable or package/procedure name. 
   * theType will be null if it's package/procedure name
   */
  def buildId(theType: Option[String], id: String, id_uri: String) = {
    if(theType.isDefined){
      // [1] Variable Name Mapping
      val id_num = getIdNum(id_uri)
      buildAnnotatedIdNum(id, id_num)
    }else{
      // [2] Package/Procedure Name Mapping
      val pkg_proc_num = 
        if(id_uri.contains("package_body"))
          getPkgNum(id_uri)
        else // if(id_uri.contains("procedure_body"))
          getProcNum(id_uri)
      buildAnnotatedIdNum(id, pkg_proc_num) 
    }
  }
  
  def buildAnnotatedIdNum(id_str: String, id_nat: Int) = {
    // the id number annotated with its id string, for example: (*x*) 1
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
  def buildIdExpr(astnum: Int, theType: String, id: String, id_uri: String) = {
    buildExpTypeTable(astnum, theType)
    val idnum_with_anno = buildId(Some(theType), id, id_uri) // for example: (* x *) 1
    val result = stg.getInstanceOf("identifierExpr")
    result.add("astnum", astnum)
    result.add("id", idnum_with_anno)
    result.render()    
  }
  
  def buildConstant(theType: String, constVal: String) = {
    val mTrans = Map[String, String]("integer" -> "Ointconst", "boolean" -> "Oboolconst")
    var o: Option[String] = None
    for(e <- mTrans if !(o.isDefined)) {
      if(theType.toLowerCase.contains(e._1))
        o = Some(e._2)
    }
    
    val result = stg.getInstanceOf("constant")
    if(o.isDefined)
      result.add("theType", o.get)
    result.add("constVal", constVal.toLowerCase) // transform bool value "False" to "false"
    result.render()
  }
  
  def buildConstantExpr(astnum: Int, theType: String, constVal: String) = {
    buildExpTypeTable(astnum, theType)
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

  def buildAssertStmt(astnum: Int, assertExp: String) = {
    val result = stg.getInstanceOf("assertStmt")
    result.add("astnum", astnum)
    result.add("assertExp", assertExp)
    result.render()
  }
  
  def buildLoopInvariantStmt(astnum: Int, invariantExp: String) = {
    val result = stg.getInstanceOf("loopInvariantStmt")
    result.add("astnum", astnum)
    result.add("invariantExp", invariantExp)
    result.render()
  }
  
  def buildWhileStmt(astnum: Int, cond: String, loopBody: String) = {
    val result = stg.getInstanceOf("whileStmt")
    result.add("astnum", astnum)
    result.add("cond", cond)
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
  
  def buildReturnStmt(astnum: Int, returnExp: Option[String]) = {
    val result = stg.getInstanceOf("returnStmt")
    result.add("astnum", astnum)
    if(returnExp.isDefined)
      result.add("returnExp", returnExp.get)
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
  
  /*******************************************************
   * [2] The Following Is For Bakar Jago Type Translator *
   *******************************************************/ 

  def buildBakarJagoTypes(typeDeclarations: String*) = {
    val result = stg.getInstanceOf("bakarJagoTypes")
    for(typeDecl <- typeDeclarations)
      result.add("typeDeclarations", typeDecl)
    result.render()
  }  

  /**
   * If the Coq type is defined by singleton inductive, its extracted OCaml type will be optimized, for example:
   * (1) Inductive constant: Type :=
   *       | Ointconst: nat -> constant.        =>      type constant = nat
   * However,
   * (2) Inductive package_body: Type :=
   *       | Packagebody: option (pkgbody_aspect_specs) -> list subprogram -> package_body.  =>
   *     type package_body =
   *       | Packagebody of pkgbody_aspect_specs option * subprogram list
   */  
  def buildTypeDeclaration(typeName : String, annotation : Option[String], constructors : String*) = {
    val result = stg.getInstanceOf("typeDeclaration")
    result.add("typeName", typeName)
    val stgFileName = stg.getName()
    stgFileName match{
      case "Type_In_Coq" =>
        for(e <- constructors)
          result.add("constructors", e) 
      case "Type_In_Ocaml" =>
        // do some optimization in Ocaml type
        if(constructors.length > 1){
          for(e <- constructors){
            result.add("constructors", e)
          }
         }else{
           val constr =
             if(constructors.head.contains("*")){
               constructors.head
             }else{
               val t = constructors.head.split(" of ")
               t.apply(1) // drop the constructor head
             }
           result.add("constructors", constr) 
         }
      case _ =>
        assert(false)
    }
    if (annotation.isDefined)
      result.add("annotation", annotation.get)
    result.render()    
  }
  
  def buildFieldDecl(fieldName : String, fieldType : String) = {
    val result = stg.getInstanceOf("fieldDeclaration")
    result.add("fieldName", fieldName)
    result.add("fieldType", fieldType)
    result.render()
  }  
  
  def buildRecordType(recordName : String, annotation : Option[String], fields : String*) = {
    val result = stg.getInstanceOf("recordDeclaration")
    result.add("recordName", recordName)
    for(e <- fields)
      result.add("fields", e)
    if (annotation.isDefined)
      result.add("annotation", annotation.get)
    result.render()
  }  
  
  /**
   * Type definitions are different in Coq and OCaml, take id as example
   * In Coq:   Inductive id := | Id: string -> id
   * In OCaml: type      id  = | Id of string
   */
  def buildTypeConstructor(typeName: String, constructorName : String, constructorArgs : String*) = {
    val result = stg.getInstanceOf("typeConstructor")
    result.add("typeName", typeName)
    result.add("constructorName", constructorName)
    for(e <- constructorArgs)
      result.add("constructorArgs", e)
    result.render()
  }  
  
  def buildTypeRename(newName : String, oldName : String) {
    val result = stg.getInstanceOf("typeRename")
    result.add("newName", newName)
    result.add("oldName", oldName)
    result.render()
  }  

  def buildOptionType(theType : String) = {
    // Coq type "option bool" should be written with "bool option" in OCaml
    val result = stg.getInstanceOf("optionType")
    result.add("theType", theType)
    result.render()
  }

  def buildListType(elemType : String) = {
    val result = stg.getInstanceOf("listType")
    result.add("elemType", elemType)
    result.render()
  }  
  
  
}







