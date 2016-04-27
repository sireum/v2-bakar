package org.sireum.bakar.jago.util

import org.stringtemplate.v4.STGroupFile
import org.sireum.util._
import org.sireum.option.ProgramTarget
import org.sireum.bakar.xml._
import org.sireum.bakar.xml.SourceLocation

/*
 * uniqueIdNumOrNot: denote whether generate unique id number for all
 * id strings or generate unique id number only for the same type of
 * id strings and id numbers of different type can be the same ;
 */
class Factory(stg: STGroupFile) {    
  /**********************************************************
   * [1] The Following Is For Bakar Jago Program Translator *
   **********************************************************/
  val uniqueIdNumOrNot = true;
  
  // use natural number to represent variable (package/procedure name) string: VarStr -> NatVal
  val unitIdentMap = mmapEmpty[String, Int] // from variable name to natural number
  val unitTypeMap = mmapEmpty[String, Int] // from type name string to natural number
  val unitProcMap = mmapEmpty[String, Int] // from procedure name to natural number
  val unitPkgMap = mmapEmpty[String, Int] // from package name to natural number
  val unitAspectMap = mmapEmpty[String, Int] // from aspect mark name, like "Post", to natural number
  val unitExpTypeMap = mmapEmpty[Int, Int] // from expression AST# number to its type number
  // TODO: it's none now
  val unitTypeDeclsMap = mmapEmpty[String, Int] // declared type to its ast number 
  
  // e.g. 1 -> (“X”, “ada://variable/pacakge_name/procedure_name_where_X_is_decalred/X+12:24")
  val varNameMap = mmapEmpty[Int, (String, String)]
  val procNameMap = mmapEmpty[Int, (String, String)]
  val pkgNameMap = mmapEmpty[Int, (String, String)]
  val typeNameMap = mmapEmpty[Int, (String, String)]
  
  def getVarNameMap = varNameMap
  def getProcNameMap = procNameMap
  def getPkgNameMap = pkgNameMap
  def getTypeNameMap = typeNameMap
  
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
    if(uniqueIdNumOrNot){
      idnum = idnum + 1
      idnum
    }else{
      procnum = procnum + 1
      procnum
    }
  }
  
  def next_pkgnum = {
    if(uniqueIdNumOrNot){
      idnum = idnum + 1
      idnum
    }else{
      pkgnum = pkgnum + 1
      pkgnum
    }
  }
  
  def next_typenum = {
    if(uniqueIdNumOrNot){
      idnum = idnum + 1
      idnum
    }else{
      typenum = typenum + 1
      typenum
    }
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
  
  def buildChecks(checks: String) = {
    val cks = mlistEmpty[Any]
    if(checks != null) {
      val ls = checks.split(',')
      for(e <- ls){
        e match {
          case "do_division_check" => 
            cks += "DivCheck"
          case "do_overflow_check" =>
            cks += "OverflowCheck"
          case "do_range_check" =>
            cks += "RangeCheck"
          case _ =>
            cks += "UndefinedCheck"
        }
      }
    }
    buildList(cks)
  }
  
  def buildRefType(typeMark: Any, typeId: Any) = {
    val result = stg.getInstanceOf("refType")
    result.add("typeMark", typeMark)
    result.add("typeId", typeId)
    result.render()
  }
  
  def buildLiteral(theType: String, theLiteral: String) = {
    val mTrans = Map[String, String]("integer" -> "Integer_Literal", "boolean" -> "Boolean_Literal")
    var o: Option[String] = None
    for(e <- mTrans if !(o.isDefined)) {
      if(theType.toLowerCase.contains(e._1))
        o = Some(e._2)
    }
    
    val result = stg.getInstanceOf("literal")
    if(o.isDefined)
      result.add("theType", o.get)
    result.add("theLiteral", theLiteral.toLowerCase) // transform bool value "False" to "false"
    result.render()
  }
  
  def buildLiteralExpr(astnum: Int, theType: String, theLiteral: String, checks: String) = {
    buildExpTypeTable(astnum, theType)
    val result = stg.getInstanceOf("literalExpr")
    result.add("astnum", astnum)
    val o = buildLiteral(theType, theLiteral)
    result.add("litval", o)
    val cks = buildChecks(checks)
    result.add("checks", cks)
    result.render()
  }  
  
  def buildBinaryExpr(astnum: Int, theType: String, op: String, loperand: String, roperand: String, checks: String) = {
    buildExpTypeTable(astnum, theType)
    val result = stg.getInstanceOf("binaryExpr") 
    result.add("astnum", astnum)
    result.add("op", op)
    result.add("loperand", loperand)
    result.add("roperand", roperand)
    val cks = buildChecks(checks)
    result.add("checks", cks)
    result.render()
  }
  
  def buildUnaryExpr(astnum: Int, theType: String, op: String, operand: String, checks: String) = {
    buildExpTypeTable(astnum, theType)
    val result = stg.getInstanceOf("unaryExpr")
    result.add("astnum", astnum)
    result.add("op", op)
    result.add("operand", operand)
    val cks = buildChecks(checks)
    result.add("checks", cks)
    result.render()
  }  
  
  def buildNameExp(astnum: Int, theType: String, x: Any, checks: String) = {
    buildExpTypeTable(astnum, theType)
    val result = stg.getInstanceOf("nameExpr")
    result.add("astnum", astnum)
    result.add("x", x)
    // val cks = buildChecks(checks)
    // result.add("checks", cks)
    result.render()
  }
  
  // it's used as a type for a declared variable, or used as a parent type for 
  // declaring subtype and derived type; it can be standard integer, boolean type
  // or declared array / record / subtype;
  def buildRefTypeMark(refTypeName: String, refTypeDecl: String) = {
    if (refTypeDecl.contains("SubtypeDecl"))
      buildRefType("Subtype", refTypeName)
    else if (refTypeDecl.contains("DerivedTypeDecl"))
      buildRefType("Derived_Type", refTypeName)
    else if (refTypeDecl.contains("IntegerTypeDecl"))
      buildRefType("Integer_Type", refTypeName)
    else if (refTypeDecl.contains("ArrayTypeDecl"))
      buildRefType("Array_Type", refTypeName)
    else if (refTypeDecl.contains("RecordTypeDecl"))
      buildRefType("Record_Type", refTypeName)
    else 
      "Undefined RefType !"
  }

  
  /**
   * the identifier can be either 
   * - variable, parameter, record field, or 
   * - newly defined type name, e.g. declared array/record type, or
   * - package/procedure name
   */
  def buildId(id: String, id_uri: String) = {
    val id_num = 
      if (id_uri.contains("constant") || id_uri.contains("variable") || 
          id_uri.contains("parameter") || id_uri.contains("component"))
        // constant example, T : constant Boolean := false;
        getIdNum(id_uri)
      else if(id_uri.contains("ordinary_type") || id_uri.contains("subtype") || id_uri.contains("private_type"))
        getTypeNum(id_uri)
      else if(id_uri.contains("procedure_body") || id_uri.contains("function_body"))
        // for a newly declared procedure, its id_uri is in the form like 
        // "ada://procedure_body/Array_Record_Package-1:9/Increase-10:14"
        getProcNum(id_uri)
      else if(id_uri.contains("procedure/") || id_uri.contains("function/"))
        // for a procedure call, its id_uri is in the form like 
        // "ada://procedure/Array_Record_Package-1:9/Increase-10:14"
        if(id_uri.contains("procedure/"))
          getProcNum(id_uri.replace("procedure", "procedure_body"))
        else
          getProcNum(id_uri.replace("function", "function_body"))
      else if(id_uri.contains("package_body"))
        getPkgNum(id_uri)
      else if(id_uri.contains("package/"))
        getPkgNum(id_uri.replace("package", "package_body"))
      else
        // TODO: to deal with other kind of identifier
        getIdNum(id_uri)
     
     buildNameTable(id_num, id, id_uri)
     buildAnnotatedIdNum(id, id_num)   
  }
  
  def buildNameTable(id_num: Int, id: String, id_uri: String){
    if (id_uri.contains("constant") || id_uri.contains("variable") || 
        id_uri.contains("parameter") || id_uri.contains("component"))
      // constant example, T : constant Boolean := false;
      varNameMap += (id_num -> ("\""+id+"\"", "\""+id_uri+"\""))
    else if(id_uri.contains("ordinary_type") || id_uri.contains("subtype") || id_uri.contains("private_type"))
      typeNameMap += (id_num -> ("\""+id+"\"", "\""+id_uri+"\""))
    else if(id_uri.contains("procedure_body") || id_uri.contains("function_body") ||
        id_uri.contains("procedure/") || id_uri.contains("function/"))
      // for a newly declared procedure, its id_uri is in the form like 
      // "ada://procedure_body/Array_Record_Package-1:9/Increase-10:14"
      procNameMap += (id_num -> ("\""+id+"\"", "\""+id_uri+"\""))
    else if(id_uri.contains("package_body") || id_uri.contains("package/"))
      pkgNameMap += (id_num -> ("\""+id+"\"", "\""+id_uri+"\""))
    else {}
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
  def buildIdExpr(astnum: Int, theType: String, id: String, id_uri: String, checks: String) = {
    buildExpTypeTable(astnum, theType)
    // each identifier, which is represented with natural number, is annotated with its string name,
    // e.g. (* x *) 1; 
    val idnum_with_anno = buildId(id, id_uri) 
    val result = stg.getInstanceOf("identifierExpr")
    result.add("astnum", astnum)
    result.add("id", idnum_with_anno)
    val cks = buildChecks(checks)
    result.add("checks", cks)
    // result.render()    
  }
   
  def buildIndexedComponent(astnum: Int, x: String, e: String, checks: String) = {
    val result = stg.getInstanceOf("indexedComponent")
    val cks = buildChecks(checks)
    result.add("astnum", astnum)
    result.add("x", x)
    result.add("e", e)
    result.add("checks", cks)
    result.render()    
  }
  
  def buildSelectedComponent(astnum: Int, x: String, f: String, checks: String) = {
    val result = stg.getInstanceOf("selectedComponent")
    val cks = buildChecks(checks)
    result.add("astnum", astnum)
    result.add("x", x)
    result.add("f", f)
    result.add("checks", cks)
    result.render()
  }
  
  def buildNullStmt = {
    val result = stg.getInstanceOf("nullStmt")
    result.render()
  }
  
  def buildAssignStmt(astnum: Int, lhs: Any, rhs: Any) = {
    val result = stg.getInstanceOf("assignStmt")
    result.add("astnum", astnum)
    result.add("lhs", lhs)
    result.add("rhs", rhs)
    result.render()
  }
  
  def buildIfStmt(astnum: Int, cond: Any, trueBranch: Any, falseBranch: Any) = {
    val result = stg.getInstanceOf("ifStmt")
    result.add("astnum", astnum)
    result.add("cond", cond)
    result.add("trueBranch", trueBranch)
    if(falseBranch != null)
      result.add("falseBranch", falseBranch)
    result.render()
  }

  def buildWhileStmt(astnum: Int, cond: Any, loopBody: Any) = {
    val result = stg.getInstanceOf("whileStmt")
    result.add("astnum", astnum)
    result.add("cond", cond)
    result.add("loopBody", loopBody)
    result.render()
  }
  
  def buildProcedureCall(astnum: Int, p_astnum: Int, p: Any, args: MList[Any]) = {
    val result = stg.getInstanceOf("procedureCall")
    val arguments = buildList(args)
    
    result.add("astnum", astnum)
    result.add("p_astnum", p_astnum)
    result.add("p", p)
    result.add("args", arguments)
    result.render()
  }
  
  def buildSeqStmt(astnum: Int, stmt1: String, stmt2: String): String = {
    // use "S_Sequence" to make the statements in sequence
    if(stmt2 == null){
      stmt1
    }else{
      val result = stg.getInstanceOf("seqStmt")
      result.add("astnum", astnum)
      result.add("stmt1", stmt1)
      result.add("stmt2", stmt2)
      result.render()      
    }
  }  
  
  def buildReturnStmt(astnum: Int, returnExp: Option[String]) = {
    val result = stg.getInstanceOf("returnStmt")
    result.add("astnum", astnum)
    if(returnExp.isDefined)
      result.add("returnExp", returnExp.get)
    result.render()    
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

  def buildRange(low: Any, upper: Any) = {
    val result = stg.getInstanceOf("range")
    var low_bound = low
    var upper_bound = upper
    if (low.asInstanceOf[String].charAt(0) == '-')
      low_bound = "(" + low + ")"
    if (upper.asInstanceOf[String].charAt(0) == '-')
      upper_bound = "(" + upper + ")"      
    result.add("l", low_bound)
    result.add("u", upper_bound)
    result.render()
  }
  
  def buildSubtypeDecl(astnum: Int, subtypeName: Any, parentTypeName: Any, low: Any, upper: Any) = {
    val result = stg.getInstanceOf("subtypeDecl")
    val range = buildRange(low, upper)
    result.add("astnum", astnum)
    result.add("tid", subtypeName)
    result.add("parentSubtypeMark", parentTypeName)
    result.add("range", range)
    result.render()
  }

  def buildDerivedTypeDecl(astnum: Int, derivedTypeName: Any, parentTypeName: Any, low: Any, upper: Any) = {
    val result = stg.getInstanceOf("derivedtypeDecl")
    val range = buildRange(low, upper)
    result.add("astnum", astnum)
    result.add("tid", derivedTypeName)
    result.add("parentSubtypeMark", parentTypeName)
    result.add("range", range)
    result.render()
  }
  
  def buildIntegerTypeDecl(astnum: Int, integerTypeName: Any, low: Any, upper: Any) = {
    val result = stg.getInstanceOf("integertypeDecl")
    val range = buildRange(low, upper)
    result.add("astnum", astnum)
    result.add("tid", integerTypeName)
    result.add("range", range)
    result.render()
  }
  
  def buildArrayTypeDecl(astnum: Int, arrayTypeName: Any, indexSubtypeMark: Any, componentType: Any) = {
    val result = stg.getInstanceOf("arrayTypeDecl")
    result.add("astnum", astnum)
    result.add("tid", arrayTypeName)
    result.add("indexSubtypeMark", indexSubtypeMark)
    result.add("componentType", componentType)
    result.render()
  }
  
  def buildRecordTypeDecl(astnum: Int, recordTypeName: Any, fields: MList[Any]) = {
    val result = stg.getInstanceOf("recordTypeDecl")
    val fs = buildList(fields)
    result.add("astnum", astnum)
    result.add("tid", recordTypeName)
    result.add("fields", fs)
    result.render()
  }
  
  def buildObjectDecl(astnum: Int, id: Any, theType: Any, optionalInit: Option[Any]) = {
    val result = stg.getInstanceOf("objectDeclaration")
    result.add("astnum", astnum)
    //buildListAttributes(result, "ids", ids: _*)
    result.add("id", id)
    result.add("theType", theType)
    if(optionalInit.isDefined)
      result.add("init", optionalInit.get)
    result.render()
  }  
  
  def buildListAttributes(st: org.stringtemplate.v4.ST, 
      attributeName: String, attributeValues: String*) {
    attributeValues.foreach(v => st.add(attributeName, v))
  }  
  
  def buildList(elements: MList[Any]) = {
    val result = stg.getInstanceOf("list")
    for(element <- elements)
      result.add("elements", element)
    result.render()
  }  
  
  def buildParamSpecification(astnum: Int, x: Any, theType: Any, mode: Any) = {
    val result = stg.getInstanceOf("paramSpecification")
    result.add("astnum", astnum)
    //buildListAttributes(result, "ids", ids: _*)
    result.add("id", x)
    result.add("theType", theType)
    result.add("mode", mode)
    result.render()
  }
  
  def buildAspectSpecification(astnum: Int, aspectMark: String, aspectDef: String) = {
    val result = stg.getInstanceOf("aspectSpecification")
    result.add("astnum", astnum)
    result.add("aspectMark", aspectMark)
    result.add("aspectDef", aspectDef)
    result.render()
  }

  def buildObjectDeclarationWrapper(astnum: Int, objectDecl: Any) = {
    val result = stg.getInstanceOf("objectDeclarationWrapper")
    result.add("astnum", astnum)
    result.add("objectDecl", objectDecl)
    result.render()
  }

  def buildProcedureBodyDeclarationWrapper(astnum: Int, procedureBodyDecl: Any) = {
    val result = stg.getInstanceOf("procedureBodyDeclWrapper")
    result.add("astnum", astnum)
    result.add("procedureBodyDecl", procedureBodyDecl)
    result.render()    
  }
  
  def buildTypeDeclarationWrapper(astnum: Int, typeDecl: Any) = {
    val result = stg.getInstanceOf("typeDeclarationWrapper")
    result.add("astnum", astnum)
    result.add("typeDecl", typeDecl)
    result.render()
  }
  
  def buildSeqDeclaration(astnum: Int, d1: Any, d2: Any) = {
    val result = stg.getInstanceOf("seqDeclaration")
    result.add("astnum", astnum)
    result.add("d1", d1)
    result.add("d2", d2)
    result.render()
  }
  
  def buildDeclaration(astnum: Int, decl: String) = {
    if (decl.startsWith("(mkobjDecl")) {
      buildObjectDeclarationWrapper(astnum, decl)
    } else if (decl.startsWith("(mkprocBodyDecl")) {
      buildProcedureBodyDeclarationWrapper(astnum, decl)
    } else if (decl.startsWith("(SubtypeDecl") || decl.startsWith("(DerivedTypeDecl") ||
        decl.startsWith("(IntegerTypeDecl") || decl.startsWith("(ArrayTypeDecl") || 
        decl.startsWith("(RecordTypeDecl")) {
      buildTypeDeclarationWrapper(astnum, decl)
    } else {
      "NullDecl_XX (* Undefined Declarations ! *)"
    }
  }

  def buildProcedureBodyDeclaration(astnum: Int, procName: String, params: MList[String], identDecls: String, procBody: String) = {
    val result = stg.getInstanceOf("procedureBodyDeclaration")
    result.add("astnum", astnum)
    result.add("procName", procName)
    result.add("procBody", procBody) 
    result.add("identDecls", identDecls)    
//  buildListAttributes(result, "aspectSpecs", aspectSpecs: _*)
    buildListAttributes(result, "params", params: _*)
    result.render()
  }
  
  def buildFunctionBodyDeclaration(astnum: Int, funcName: String, returnT: String, 
      params: MList[String], identDecls: String, funcBody: String) = {
    val result = stg.getInstanceOf("functionBodyDeclaration")
    result.add("astnum", astnum)
    result.add("funcName", funcName)
    result.add("returnT", returnT)
    result.add("funcBody", funcBody) 
    result.add("identDecls", identDecls) 
//  buildListAttributes(result, "aspectSpecs", aspectSpecs: _*)
    buildListAttributes(result, "params", params: _*)
    result.render()
  }
  
  def buildProgramDeclaration(decls: String, main: String) = {
    val result = stg.getInstanceOf("programDeclaration")
    result.add("decls", decls)
    result.add("main", main)
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
  
  def buildEmptyProcedureBody = {
    // it's used as a placehold for unrecognized or undeclared subprograms;
    val result = stg.getInstanceOf("emptySubProgram")
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
//    // [1]
//    val sortedSeq1 = unitExpTypeMap.toSeq.sortBy(_._1)
//    for(e <- sortedSeq1){
//      result.add("unitExpTypeTable", buildMappingItem(e._1.toString, e._2.toString))
//    }
//    // [2]
//    // reverse the map, and then sort the mapping according to the natural number
//    val reversedTypeMapping = unitTypeMap.map(_.swap)
//    val sortedSeq2 = reversedTypeMapping.toSeq.sortBy(_._1) 
//    for(e <- sortedSeq2){
//      // TODO: the type declaration AST number is now set None
//      val typedecl_num = "None"
//      val typeInfor = buildMappingItem(buildString(e._2).replaceAll(" ", "_"), typedecl_num)
//      result.add("unitTypeNameTable", buildMappingItem(e._1.toString, typeInfor)) 
//    }
    result.render()
  }
  
  def buildSourceLocation(line: Any, col: Any, endline: Any, endcol: Any) = {
    val result = stg.getInstanceOf("sourceLocation")
    result.add("line", line)
    result.add("col", col)
    result.add("endline", endline)
    result.add("endcol", endcol)
    result.render()
  }
  
  def buildProduct(x: Any, y: Any) = {
    val result = stg.getInstanceOf("compilationUnit")
    result.add("x", x)
    result.add("y", y)
    result.render()
  }
  
  def buildDefinition(x: Any, v: Any) = {
    val result = stg.getInstanceOf("definition")
    result.add("x", x)
    result.add("v", v)
    result.render()
  }
  
  def buildNameTable(stg: STGroupFile, 
      varNameMap: MMap[Int, (String, String)],
      procNameMap: MMap[Int, (String, String)],
      pkgNameMap: MMap[Int, (String, String)],
      typeNameMap: MMap[Int, (String, String)]): String = {
    val result = stg.getInstanceOf("nameTable") 
    
    for(x <- varNameMap) {
      val var_element = stg.getInstanceOf("product")
      var_element.add("x", x._1).add("y", stg.getInstanceOf("product").add("x", x._2._1).add("y", x._2._2))
      result.add("varNames", var_element)
    }
    
    for(x <- procNameMap) {
      val proc_element = stg.getInstanceOf("product")
      proc_element.add("x", x._1).add("y", stg.getInstanceOf("product").add("x", x._2._1).add("y", x._2._2))
      result.add("procNames", proc_element)
    }
    
    for(x <- pkgNameMap) {
      val pkg_element = stg.getInstanceOf("product")
      pkg_element.add("x", x._1).add("y", stg.getInstanceOf("product").add("x", x._2._1).add("y", x._2._2))
      result.add("pkgNames", pkg_element)
    }
    
    for(x <- typeNameMap) {
      val type_element = stg.getInstanceOf("product")
      type_element.add("x", x._1).add("y", stg.getInstanceOf("product").add("x", x._2._1).add("y", x._2._2))
      result.add("typeNames", type_element)
    }
    
    result.render()
  }  
  
  def buildSymbolTable(stg: STGroupFile, 
      vars: MMap[String,(String, String)],
      procs: MMap[String,(Int, String)],
      types: MMap[String,String],
      exps: MMap[Int, String],
      slocs: MMap[Int, SourceLocation],
      names: String): String = {
    val result = stg.getInstanceOf("symbolTable")
    
    for(x <- vars) {
      val var_element = stg.getInstanceOf("product")
      var_element.add("x", x._1).add("y", stg.getInstanceOf("product").add("x", x._2._1).add("y", x._2._2))
      result.add("vars", var_element)
    }
    
    for(x <- procs) {
      val proc_element = stg.getInstanceOf("product")
      proc_element.add("x", x._1).add("y", stg.getInstanceOf("product").add("x", x._2._1).add("y", x._2._2))
      result.add("procs", proc_element)
    }
    
    for(x <- types) {
      val type_element = stg.getInstanceOf("product")
      type_element.add("x", x._1).add("y", x._2)
      result.add("types", type_element)
    }
    
    for(x <- exps) {
      val exp_type_element = stg.getInstanceOf("product")
      exp_type_element.add("x", x._1).add("y", x._2)
      result.add("exps", exp_type_element)
    }
    
    for(x <- slocs) {
      val sloc_element = stg.getInstanceOf("product")
      val sloc = buildSourceLocation(x._2.getLine, x._2.getCol, x._2.getEndline, x._2.getEndcol)
      sloc_element.add("x", x._1).add("y", sloc)
      result.add("slocs", sloc_element)
    }    
    
    result.add("nameTable", names)
    result.render()
  }
  
  
  /*******************************************************
   * [2] The Following Is For Bakar Jago Type Translator *
   *******************************************************/ 

  def buildBasicAstTypes(typeDeclarations: String*) = {
    val result = stg.getInstanceOf("basicAstTypes")
    for(typeDecl <- typeDeclarations)
      result.add("typeDeclarations", typeDecl)
    result.render()
  }
  
  def buildAstTypes(typeDeclarations: String*) = {
    val result = stg.getInstanceOf("astTypes")
    for(typeDecl <- typeDeclarations)
      result.add("typeDeclarations", typeDecl)
    result.render()
  }  
  
  def buildBasicTypes =  {
    val result = stg.getInstanceOf("basicTypes")
    result.render()
  }
  
  def buildModes =  {
    val result = stg.getInstanceOf("modes")
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
  def buildInductiveType(typeName : String, annotation : Option[String], constructors : String*) = {
    val result = stg.getInstanceOf("inductiveType")
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
  
  def buildWithType(typeName : String, annotation : Option[String], constructors : String*) = {
    val result = stg.getInstanceOf("withType")
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
  
  def buildWithOneConstructorType(typeName : String, annotation : Option[String], 
      constructorName: String, elements : String*) = {
    val result = stg.getInstanceOf("withOneConstructorType")
    result.add("typeName", typeName)
    result.add("constructorName", constructorName)
    for(e <- elements)
      result.add("elements", e) 

    if (annotation.isDefined)
      result.add("annotation", annotation.get)
    result.render()    
  } 
  
  def buildMutuallyInductiveType(typeName : String, annotation : Option[String], constructors : MList[String], withs: MList[String]) = {
    val result = stg.getInstanceOf("mutuallyInductiveType")
    result.add("typeName", typeName)
    
    for(e <- constructors) 
      result.add("constructors", e) 
    
    for(w <- withs)
      result.add("withs", w)
      
    if (annotation.isDefined)
      result.add("annotation", annotation.get)
    result.render()
  }
  
  def buildFieldDecl(fieldName : Any, fieldType : Any) = {
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
  
  def buildProduct(x : String, y: String) = {
    val result = stg.getInstanceOf("product")
    result.add("x", x)
    result.add("y", y)
    result.render()
  }
  
  def buildImportRequiredLibs() = {
    stg.getInstanceOf("importRequiredLibsForAst").render()
  }
  
  def getStringValue(o : Any) = {
    if (o.isInstanceOf[org.stringtemplate.v4.ST])
      o.asInstanceOf[org.stringtemplate.v4.ST].render()
    else
      o.asInstanceOf[String]
  }
}







