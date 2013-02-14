package org.sireum.bakar.jago.xml

import org.stringtemplate.v4.STGroupFile
import org.sireum.bakar.xml.ExpressionClass
import org.sireum.bakar.xml.FunctionCall
import javax.xml.bind.annotation.XmlElements
import org.sireum.bakar.xml.ExpressionClass
import org.sireum.bakar.xml.FunctionCall
import org.stringtemplate.v4.ST
import java.io.FileWriter
import java.io.File
import org.sireum.bakar.xml.CpuPragma
import org.sireum.bakar.xml.DivideOperator
import org.sireum.bakar.jago.util.TypeNameSpace
import org.sireum.bakar.xml.StatementClass
import org.sireum.bakar.xml.DeclarationClass
import org.sireum.bakar.xml.PackageBodyDeclaration
import org.sireum.bakar.xml.ProcedureBodyDeclaration
import org.sireum.bakar.xml.FunctionBodyDeclaration
import org.sireum.bakar.xml.CompilationUnit
import org.sireum.util._
import org.sireum.util.MList


/**
 * Refer the following file for reference
 * - sireum-bakar/sireum-bakar-compiler/src/main/scala/org/sireum/bakar/compiler/module/BakarTranslatorImpl.scala
 * Notes: 
 * 1. in both stringTemplate for Coq and OCaml, their function name and parameter name are all the same 
 *    in order to uniform the type translation for either Coq types or OCaml types according to the user 
 *    selected option: Coq or OCaml
 * 2. In Coq, "option bool" should be written with "bool option" in OCaml
 * 3. In OCaml the type name should not be capital
 * 4. In OCaml, integer type is "int"
 */

object XMLSchemaTranslator {
  def getOption(option: Option[String]) = {
    // the default option is <Coq>
    option match {
      case Some("OCaml") =>
        option
      case Some("Coq") =>
        option
      case _ =>
        Some("Coq")
    }
  }
  
  def getStringTemplateGroup(option: Option[String]) = {
    (option: @unchecked) match {
      case Some("Coq") =>
        // STGroupFile (URL url, String encoding, char delimiterStartChar, char delimiterStopChar)
        new STGroupFile(getClass.getResource(TypeNameSpace.TypeTransTemplate_Coq), "UTF-8", '$', '$')
      case Some("OCaml") =>
        new STGroupFile(getClass.getResource(TypeNameSpace.TypeTransTemplate_OCaml), "UTF-8", '$', '$')
    }
  }
  
  def getOutFileName(option: Option[String]) = {
    (option: @unchecked) match {
      case Some("Coq") =>
        TypeNameSpace.CoqFileName
      case Some("OCaml") =>
        TypeNameSpace.OCamlFileName
    }
  } 
  val t = classOf[XMLSchemaTranslator] 
  val outdir = t.getResource(".").getPath().replace("bin", "src/main/scala")
}

class XMLSchemaTranslator(userOption: Option[String]) {
  import XMLSchemaTranslator._
  val option = getOption(userOption)
  val stg = getStringTemplateGroup(option)
  val outFileName = getOutFileName(option)
  
  val typeDeclarations = mlistEmpty[String]
  val typeConstructors = mlistEmpty[String]
   
  def emptyTypeConstructors {
    typeConstructors.clear
  }
  
  def getTypeConstructors = {
    typeConstructors
  }
  
  def setTypeConstructors(constructors: MList[String]){
    // getTypeConstructors() return a reference to "typeConstructors", 
    // so emptyTypeConstructors() will empty both "typeConstructors" and the return result of getTypeConstructors()
    val temp = mlistEmpty[String]
    constructors.foreach(c => temp += c)
    emptyTypeConstructors
    temp.foreach(c => typeConstructors += c)
  }
  
  /**
   * Type definitions are different in Coq and OCaml, take id as example
   * In Coq:   Inductive id := | Id: string -> id. (its constructorArgs is <Id, string, id>)
   * In OCaml: type      id = | Id of string       (its constructorArgs is <Id, string>)
   */
  def getTypeConstructorElems(typeConstructorElems: String*) = {
    (option: @unchecked) match {
      case Some("Coq") =>
        typeConstructorElems
      case Some("OCaml") =>
        typeConstructorElems.dropRight(1)
    }
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
  def getTypeConstructor(cons: String) = {
    (option: @unchecked) match {
      case Some("Coq") =>
        cons
      case Some("OCaml") =>
        if(cons.contains("*")){
          cons
        }else{
          val t = cons.split(" of ") 
          t.apply(1) // drop the constructor head
        }
    } 
  }
  
  /**
   * In Coq, "option bool" should be written with "bool option" in OCaml
   */
  def getOptionType(theType: String) = {
    val result = stg.getInstanceOf("optionType")
    result.add("theType", theType)
    result.render()
  }
  
  def getListType(elemType: String) = {
    val result = stg.getInstanceOf("listType")
    result.add("elemType", elemType)
    result.render()
  }
  
  // xml2coq(c: org.sireum.bakar.xml.Base)
  def typeTranslator {
    trans_compilatoin_unit
    //trans_package_declaration
    writeIntoCoqFile
  }
  
  def trans_compilatoin_unit {
    val cu = classOf[CompilationUnit]
    for(f <- cu.getDeclaredFields){
      val fldname = f.getName()
      fldname match {
        case "unitDeclarationQ" =>
          trans_package_declaration
        case _ =>
          Unit
      }
    }
    val annotation: Option[String] = Some("compilation unit can be either package_declaration or package_body_declaration")
    val constructors = List(
        List("PkgBodyDecl", TypeNameSpace.Uri, TypeNameSpace.VarT, TypeNameSpace.Location,
            TypeNameSpace.PackageBodyT, TypeNameSpace.CompilationUnit))
    this.createInductiveTypeV2(TypeNameSpace.CompilationUnit, annotation, constructors)    
  }
  
  def trans_package_declaration {
    val decls = classOf[DeclarationClass]
    for(f <- decls.getDeclaredFields){
      for(a <- f.getDeclaredAnnotations){
        if(a.annotationType == classOf[XmlElements]){
          val xelems = a.asInstanceOf[XmlElements]
          for(elem <- xelems.value()){
            for(m <- elem.getClass.getDeclaredMethods if m.getName == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val cons = mtype.getSimpleName match {
                case "PackageDeclaration" =>
                  // TODO: define the type for package_declaration
                  Unit
                case "PackageBodyDeclaration" => 
                  trans_packagebody_declaration
                case _ =>
                  Unit
              }
            }
          }
        }
      }
      
    }
  }

  def trans_packagebody_declaration {
    val package_body_decl = classOf[PackageBodyDeclaration]
    for(f <- package_body_decl.getDeclaredFields) {
      val defname = f.getName()
      defname match {
        case "namesQl" => 
          Unit
        case "aspectSpecificationsQl" => 
          Unit
        case "bodyDeclarativeItemsQl" =>
          trans_subprogram_declaration
        case "bodyStatementsQl" =>
          Unit
        case o =>
          Unit
      }
    }
    createTypeRename(TypeNameSpace.PackageBodyAspectSpecs, TypeNameSpace.SubProgramAspectSpecs)
    val annotation: Option[String] = None
    val constructors = List(
        List("Packagebody", TypeNameSpace.Uri, TypeNameSpace.VarT, 
            getOptionType(TypeNameSpace.PackageBodyAspectSpecs), getListType(TypeNameSpace.SubProgramT), TypeNameSpace.PackageBodyT))
    createInductiveTypeV2(TypeNameSpace.PackageBodyT, annotation, constructors)
  }  
  
  /**
   * Syntax tree:
   * DeclarationClass /- VariableDeclaration
   *                  |- PackageBodyDeclaration
   *                  |- FunctionBodyDeclaration
   *                |- ProcedureBodyDeclaration /- ParameterSpecificationList /- ParameterSpecification /- DefiningNameList namesQl (var name)
   *                                              |                                                       |- String mode (in, out, in out)
   *                                              |                                                       |- DefinitionClass objectDeclarationViewQ (var type)
   *                                              |                                                       |- ExpressionClass initializationExpressionQ
   *                                            |- ElementList bodyDeclarativeItemsQl (define temperate variables used in procedure body)
   *                                              |- StatementList bodyStatementsQl (commands in procedure boy)
   * 
   */
  def trans_subprogram_declaration {
    val decls = classOf[DeclarationClass]
    for(f <- decls.getDeclaredFields){
      for(a <- f.getDeclaredAnnotations){
        if(a.annotationType == classOf[XmlElements]){
          val xelems = a.asInstanceOf[XmlElements]
          for(elem <- xelems.value()){
            for(m <- elem.getClass.getDeclaredMethods if m.getName == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val cons = mtype.getSimpleName match {
                case "ProcedureBodyDeclaration" =>
                  trans_procedurebodydeclaration
                case "FunctionBodyDeclaration" =>
                  trans_functionbodydeclaration
                case _ =>
                  Unit
              }
            }
          }
          // create a subprogram type for both procedure and functio
          val typeName = TypeNameSpace.SubProgramT
          val constructors = List(
              List("Sproc", TypeNameSpace.Uri, TypeNameSpace.ProcedureBodyT, TypeNameSpace.SubProgramT),
              List("Sfunc", TypeNameSpace.Uri, TypeNameSpace.FunctionBodyT, TypeNameSpace.SubProgramT))
          createInductiveTypeV2(typeName, None, constructors)
        }
      }
    }
  }
  
  
  def trans_variabledeclaration {
    val typeName = TypeNameSpace.Defining_Identifier
    val annotation = Some("Local variables declarations used in the procedure/function body")
    val fields = List(
        createFieldDecl("local_uri", TypeNameSpace.Uri, false),
        createFieldDecl("local_idents", getListType(TypeNameSpace.VarT), false),
        createFieldDecl("local_init", TypeNameSpace.ValT, true))
    createRecordType(typeName, annotation, typeName, fields: _*)
  }
  
  def trans_parameterspecification {
    val typeName = TypeNameSpace.Parameter
    val fields = List(
        createFieldDecl("param_uri", TypeNameSpace.Uri, false),
        createFieldDecl("param_ident", TypeNameSpace.VarT, false),
        createFieldDecl("param_mode", TypeNameSpace.ModeT, false),
        createFieldDecl("param_init", TypeNameSpace.ExpressionT, true))
    createRecordType(typeName, None, typeName, fields: _*)
  }
  
  /**
   * procedure_annotation ::= [global_definition] 
   *                          [dependency_relation] 
   *                  [precondition]
   *                [postcondition]
   */
  def trans_procedureAspectSpecs {
    val typeName = TypeNameSpace.SubProgramAspectSpecs
    val fields = List(
        createFieldDecl("specs_uri", TypeNameSpace.Uri, false),
        createFieldDecl(TypeNameSpace.Pre, TypeNameSpace.Predicate, true),
        createFieldDecl(TypeNameSpace.Post, TypeNameSpace.Predicate, true))
    createRecordType(typeName, None, typeName, fields: _*)
  }
  
  /**
   * ProcedureBodyDeclaration /- ParameterSpecificationList /- ParameterSpecification /- DefiningNameList namesQl (var name)
   *                          |                                                       |- String mode (in, out, in out)
   *                          |                                                       |- DefinitionClass objectDeclarationViewQ (var type)
   *                          |                                                       |- ExpressionClass initializationExpressionQ
   *                          |- ElementList aspectSpecificationsQl (define global, pre, post ...)
   *                        |- ElementList bodyDeclarativeItemsQl (define temperate variables used in procedure body)
   *                          |- StatementList bodyStatementsQl (commands in procedure boy)
   *
   * 
   * Pay attention to the order of defined Coq types that have certain dependence relations
   * those types being depended by other types should be defined preceding them 
   */
  def trans_procedurebodydeclaration {
    val procBody = classOf[ProcedureBodyDeclaration]
    // define the type definition order in Coq
    var orders = List("bodyStatementsQl", "parameterProfileQl", "aspectSpecificationsQl", "bodyDeclarativeItemsQl")
    var seen = Set[String]()
    var fTrans = Map[String, String => Unit ]()
    for(f <- procBody.getDeclaredFields){
      val fieldName = f.getName()
      seen = seen + fieldName
    }
    
    // create the Coq types that procedure body declaration depends on
    for(f <- orders if seen.contains(f)) {
      f match {
        case "bodyStatementsQl" =>
          trans_statementlist  // expression needs to be defined first
        case "parameterProfileQl" =>
          trans_parameterspecification
        case "aspectSpecificationsQl" =>
          trans_procedureAspectSpecs
        case "bodyDeclarativeItemsQl" =>
          trans_variabledeclaration
      }
    }
    // create procedure annotations: Global, Pre, Post, ...
    
    // create the Coq type for procedure body declaration
    val typeName = TypeNameSpace.ProcedureBodyT
    val fields = List(
        createFieldDecl("proc_uri", TypeNameSpace.Uri, false),
        createFieldDecl("proc_name", TypeNameSpace.VarT, false),
        createFieldDecl("proc_specs", TypeNameSpace.SubProgramAspectSpecs, true),
        createFieldDecl("proc_params", getListType(TypeNameSpace.Parameter), true),
        createFieldDecl("proc_defidents", getListType(TypeNameSpace.Defining_Identifier), true),
        createFieldDecl("proc_body", TypeNameSpace.StatementListT, false))
    createRecordType(typeName, None, typeName, fields: _*)
  }
  
  /**
   * FunctionBodyDeclaration /- ParameterSpecificationList parameterProfileQl
   *                         |- ElementClass resultProfileQ
   *                         |- ElementList bodyDeclarativeItemsQl
   *                         |- StatementList bodyStatementsQl
   */
  def trans_functionbodydeclaration {
    val funcBody = classOf[FunctionBodyDeclaration]
    for(f <- funcBody.getDeclaredFields){
      val fieldName = f.getName()
      val retT = fieldName match {
        case "resultProfileQ" => 
          None
//        case "parameterProfileQl" =>
//          xml2coq_parameterspecification
//        case "bodyDeclarativeItemsQl" =>
//          xml2coq_variabledeclaration
//        case "bodyStatementsQl" =>
//          xml2coq_statementlist
        case _ => 
          None
      }
      
    }
    // create the Coq type for function body declaration
    createTypeRename(TypeNameSpace.ReturnType, TypeNameSpace.ValT) 
    val typeName = TypeNameSpace.FunctionBodyT
    val fields = List(
        createFieldDecl("fn_uri", TypeNameSpace.Uri, false),
        createFieldDecl("fn_name", TypeNameSpace.VarT, false),
        createFieldDecl("fn_specs", TypeNameSpace.SubProgramAspectSpecs, true),
        createFieldDecl("fn_retT", TypeNameSpace.ReturnType, false),
        createFieldDecl("fn_params", getListType(TypeNameSpace.Parameter), true),
        createFieldDecl("fn_defidents", getListType(TypeNameSpace.Defining_Identifier), true),
        createFieldDecl("fn_body", TypeNameSpace.StatementListT, false))
    createRecordType(typeName, None, typeName, fields: _*)
  }
  
  /**
   * Syntax of commands:
   * Inductive Com : Type :=
   *  | CSkip : Com
   *  | CAssign : id -> Exp -> Com
   *  | CSeq : Com -> Com -> Com
   *  | CIf : Exp -> Com -> Com -> Com
   *  | CWhile : Exp -> LoopInvariant -> Com -> Com.
   */
  def trans_statementlist {
    val statement = classOf[StatementClass]
    for(f <- statement.getDeclaredFields) { 
      for(a <- f.getDeclaredAnnotations) {
        if(a.annotationType() == classOf[XmlElements]){
          emptyTypeConstructors
          val xelems = a.asInstanceOf[XmlElements]
          for(elem <- xelems.value) {
            for(m <- elem.getClass.getDeclaredMethods if m.getName == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              mtype.getSimpleName() match {
                case "AssignmentStatement" => 
                  trans_expression
                  createAndPushConstructor("Sassign", TypeNameSpace.Uri, TypeNameSpace.VarT, 
                      TypeNameSpace.ExpressionT, TypeNameSpace.StatementListT)
                case "IfStatement" =>
                  createAndPushConstructor("Sifthen", TypeNameSpace.Uri, TypeNameSpace.ExpressionT, 
                      TypeNameSpace.StatementListT, TypeNameSpace.StatementListT)
                case "WhileLoopStatement" =>
                  // option: loop invariant (--# assert predicate) for while loop
                  createTypeRename(TypeNameSpace.Predicate, TypeNameSpace.ExpressionT)
                  createTypeRename(TypeNameSpace.LoopInvariant, getOptionType(TypeNameSpace.Predicate))
                  createAndPushConstructor("Swhile", TypeNameSpace.Uri, TypeNameSpace.ExpressionT, 
                      TypeNameSpace.LoopInvariant, TypeNameSpace.StatementListT, TypeNameSpace.StatementListT)
                case "BlockStatement" =>
                  createAndPushConstructor("Sseq", TypeNameSpace.Uri, TypeNameSpace.StatementListT, 
                      TypeNameSpace.StatementListT, TypeNameSpace.StatementListT)
//                case "AssertPragma" => 
//                  // loop invariant
//                  Some(createConstructor("Assert", TypeNameSpace.ExpressionT, TypeNameSpace.StatementListT))
//                case "NullStatement" =>
//                  createConstructor("CSkip", TypeNameSpace.StatementT)                  
//                case "ForLoopStatement" =>
//                  ""
//                case "CaseStatement" =>
//                  ""
//                case "LoopStatement" =>
//                  ""
                case _ => 
                  Unit
                }
            }
          }
          // write into the Coq file
          createInductiveType(TypeNameSpace.StatementListT, None, getTypeConstructors: _*)
          emptyTypeConstructors
        }
      }
    }
  }
  
  def trans_expression {
    val exp = classOf[ExpressionClass] 
    for (f <- exp.getDeclaredFields) { 
      for(a <- f.getDeclaredAnnotations) {
        if (a.annotationType == classOf[XmlElements]){
          emptyTypeConstructors
          val xelems = a.asInstanceOf[XmlElements]
          val mTrans = Map[String, Class[_] => Unit]("IntegerLiteral" -> transLiteral, "Identifier" -> transIdentifier, 
              "FunctionCall" -> transFunctionCall)
          for(elem <- xelems.value){
            for(m <- elem.getClass.getDeclaredMethods if (m.getName == "type")) {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              var hit = false
              for (e <- mTrans if !hit)
                if (mtype.toString().endsWith(e._1)){
                  e._2(mtype)
                  hit = true
                }
          }
        }
        // write the resulting type into a Coq file
        // 1. sort expression constructors
        
        // 2. generate expression type with these constructors, and write into Coq file
        createInductiveType(TypeNameSpace.ExpressionT, None, getTypeConstructors: _*)
        emptyTypeConstructors
        }
    }
    }
  }
  
  /**
   * | Econst: nat -> expr
   */
  def transLiteral(c: java.lang.Class[_]) = {
//    val index = c.toString().lastIndexOf(".")
//    val head = c.toString().substring(index+1)
//    val bodySmts = 
//      if(c.toString().contains("NullLiteral"))
//        List(TypeNameSpace.ExpressionT)
//      else
//        List(TypeNameSpace.Integer(option), TypeNameSpace.ExpressionT)
    // [1] constant type
    val constCons = List(
        List("Ointconst", TypeNameSpace.Integer(option), TypeNameSpace.Constant))
    createInductiveTypeV2(TypeNameSpace.Constant, None, constCons)
    // [2] constant expression
    val bodyStmts = List(TypeNameSpace.Uri, TypeNameSpace.Constant, TypeNameSpace.ExpressionT)
    createAndPushConstructor("Econst", bodyStmts:_*)
  }
  
  /**
   * Evar: ident -> expr
   */
  def transIdentifier(c: java.lang.Class[_])= {
    val bodySmts = List(TypeNameSpace.Uri, TypeNameSpace.VarT, TypeNameSpace.ExpressionT)
    createAndPushConstructor("Evar", bodySmts: _*)
  }
  
  /**
   * | BinExp: Exp -> Op -> Exp -> Exp
   * | NegExp: Exp -> Exp
   * | PosExp: Exp -> ExP
   * 
   * class FunctionCall /- ExpressionClass prefixQ
   *                    |- AssociationList functionCallParametersQl
   */
  def transFunctionCall(c: java.lang.Class[_]) = {
    val cons = getTypeConstructors
    for(f <- c.getDeclaredFields if f.getName == "prefixQ") {
      val opT = f.getType()
      transOperator(opT)
    }
    
    setTypeConstructors(cons)
    createAndPushConstructor("Ebinop", TypeNameSpace.Uri, TypeNameSpace.BinaryOpT, 
        TypeNameSpace.ExpressionT, TypeNameSpace.ExpressionT, TypeNameSpace.ExpressionT)
    createAndPushConstructor("Eunop", TypeNameSpace.Uri, TypeNameSpace.UnaryOpT, 
        TypeNameSpace.ExpressionT, TypeNameSpace.ExpressionT)
  }
  
  def transOperator(c: java.lang.Class[_]) = {
    for(f <- c.getDeclaredFields) { 
      for(a <- f.getDeclaredAnnotations) { 
        if(a.annotationType() == classOf[XmlElements]) {
          val xelems = a.asInstanceOf[XmlElements]
          val binOps = mlistEmpty[String]
          val unOps = mlistEmpty[String]
          val binopTrans = Map[String, String]("MultiplyOperator" -> "Omul", "DivideOperator" -> "Odiv",  
              // "ModOperator" -> "Omod", "RemOperator" -> "ARem", "ExponentiateOperator" -> "AExpon",
               "PlusOperator" -> "Oadd", "MinusOperator" -> "Osub", // "ConcatenateOperator" -> "Oand", // &
              "AndOperator" -> "Oand", "OrOperator" -> "Oor", "XorOperator" -> "Oxor",
              "EqualOperator" -> "Ceq", "GreaterThanOperator" -> "Cgt", "GreaterThanOrEqualOperator" -> "Cge", 
              "LessThanOperator" -> "Clt", "LessThanOrEqualOperator" -> "Cle", "NotEqualOperator" -> "Cne") 
          val unopTrans = Map[String, String]("UnaryPlusOperator" -> "Oposint", "UnaryMinusOperator" -> "Onegint")
          for(elem <- xelems.value) {
            for(m <- elem.getClass.getDeclaredMethods if m.getName() == "type") { 
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val bop = binopTrans.get(mtype.getSimpleName)
              val uop = unopTrans.get(mtype.getSimpleName) 
              // operator type <Op> is something like: | BGt: Op 
              if(bop.isDefined)
                binOps += createConstructor(bop.get, TypeNameSpace.BinaryOpT)
              else if(uop.isDefined)
                unOps += createConstructor(uop.get, TypeNameSpace.UnaryOpT)
            }
          }
          // [1] sort the constructors
          val sortedUnOpCons = unOps.sortWith(_ < _)
          val sortedBinOpCons = binOps.sortWith(_ < _)
          // [2] construct Operator type and write into the Coq file
          createInductiveType(TypeNameSpace.UnaryOpT, None, sortedUnOpCons: _*) 
          createInductiveType(TypeNameSpace.BinaryOpT, None, sortedBinOpCons: _*) 
        }
      }
    }
  }
  
  /**
   * *********************************************************************
   * *********************************************************************
   */
  
  /**
   * Definition newName := oldName.
   */
  def createTypeRename(newName: String, oldName: String) {
    val result = stg.getInstanceOf("typeRename")
    result.add("newName", newName)
    result.add("oldName", oldName)
    // add it into typeDeclarations
    typeDeclarations += (result.render())
  }
  
  /**
   * Type definitions are different in Coq and OCaml, take id as example
   * In Coq:   Inductive id := | Id: string -> id. (its constructorArgs is <Id, string, id>)
   * In OCaml: type      id = | Id of string       (its constructorArgs is <Id, string>)
   */
  def createConstructor(constructorName: String, constructorArgs: String*) = {
    val result = stg.getInstanceOf("constructor")
    result.add("constructorName", constructorName)
    val typeConstructorArgs = getTypeConstructorElems(constructorArgs: _*)
    if(typeConstructorArgs.length > 0) {
      // In OCaml, the typeConstructorArgs typeExpresion maybe empty
      val args = stg.getInstanceOf("constructorArguments")
      typeConstructorArgs.foreach(arg => 
        args.add("arguments", arg)
      )
      result.add("constructorArgs", args)
    }
    
    // return
    result.render()
  }
  
  def createAndPushConstructor(constructorName: String, constructorArgs: String*) = {
    val result = createConstructor(constructorName, constructorArgs: _*)
    typeConstructors += result
  }  

  def createInductiveType(typeName: String, annotation: Option[String], constructors: String*) {
    // [1] generate expression type with these constructors
    val result = stg.getInstanceOf("typeDeclaration")
    result.add("typeName", typeName)
    if(constructors.length == 1){
      result.add("constructorDecls", getTypeConstructor(constructors.head))
    }else{
      constructors.foreach(cons => 
        result.add("constructorDecls", cons))      
    }
    if(annotation.isDefined)
      result.add("annotation", annotation.get)
    // [2] add it into typeDeclarations
    typeDeclarations += result.render()
  }
  
  def createInductiveTypeV2(typeName: String, annotation: Option[String], constructors: List[List[String]]) {
    // [1] generate expression type with these constructors
    val result = stg.getInstanceOf("typeDeclaration")
    result.add("typeName", typeName)
    if(constructors.length == 1){
      val c = constructors.head
      val cons = createConstructor(c.head, c.tail: _*)
      result.add("constructorDecls", this.getTypeConstructor(cons))      
    }else{
      constructors.foreach(consElems => {
        val constructorName = consElems.head
        val constructorArgs = consElems.tail
        val cons = createConstructor(constructorName, constructorArgs: _*)
        result.add("constructorDecls", cons)
      })      
    }
    
    if(annotation.isDefined)
      result.add("annotation", annotation.get)
    // [2] add it into typeDeclarations
    typeDeclarations += result.render()
  }
  
  def createFieldDecl(fieldName: String, fieldType: String, option: Boolean) = {
    val result = stg.getInstanceOf("fieldDeclaration")
    result.add("fieldName", fieldName)
    if(option)
      result.add("fieldType", getOptionType(fieldType))
    else 
      result.add("fieldType", fieldType)
    result.render()
  }
  
  def createRecordType(recordName: String, annotation: Option[String], constructorName: String, fields: String*) = {
    val result = stg.getInstanceOf("recordDeclaration")
    result.add("recordName", recordName)
    result.add("constructorName", "mk" + constructorName)
    fields.foreach(f => 
      result.add("fields", f)
    )
    if(annotation.isDefined)
      result.add("annotation", annotation.get)    
    typeDeclarations += result.render()
  }
  
  def writeIntoCoqFile(){
    val typeDefs = stg.getInstanceOf("typeDefinitions")
    typeDeclarations.foreach(typeDecl =>
      typeDefs.add("typeDeclarations", typeDecl))
    val fwriter = new FileWriter(new File(outdir, outFileName))
    fwriter.write(typeDefs.render())
    fwriter.close()
  }
  
}

object TypeTranslator{
  def main(args: Array[String]){
    var option: Option[String] = None
    if(args.length > 0) {
      val optValue = args(0)
      if(optValue == "Coq" || optValue == "OCaml") {
         option = Some(optValue)
      }else {
        println("usage: option should be either <Coq> or <OCaml>, the default is <Coq> !")  
        System.exit(1)
      }
    }
    
    val translator = new XMLSchemaTranslator(option);
    translator.typeTranslator
    
    println("      Begin to Translate SPARK into " + translator.option.get + "...")
    println("~ ~ ~ XMLSchema Type Translation End !!! ~ ~ ~")
    //    val url = getClass.getResource("TypeTrans_xml2coq.stg")
  }
}





