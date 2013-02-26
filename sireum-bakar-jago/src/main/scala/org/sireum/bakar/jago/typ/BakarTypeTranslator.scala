package org.sireum.bakar.jago.typ

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
import org.sireum.option.TypeTarget
import org.sireum.option.SireumBakarTypeMode
import java.net.URI

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
class BakarTypeTranslator(o : SireumBakarTypeMode) {
  def getTypeTranslatorSTG(o : TypeTarget.Type) = {
    (o : @unchecked) match {
      case TypeTarget.Coq =>
        // val url = getClass.getResource("TypeTrans_xml2coq.stg")
        // STGroupFile (URL url, String encoding, char delimiterStartChar, char delimiterStopChar)
        new STGroupFile(getClass.getResource(TypeNameSpace.TypeTransTemplate_Coq), "UTF-8", '$', '$')
      case TypeTarget.Ocaml =>
        new STGroupFile(getClass.getResource(TypeNameSpace.TypeTransTemplate_OCaml), "UTF-8", '$', '$')
    }
  }
  
  val option = o.typ
  val stg = getTypeTranslatorSTG(option)

  val typeDeclarations = mlistEmpty[String]
  val typeConstructors = mlistEmpty[String]

  def emptyTypeConstructors {
    typeConstructors.clear
  }

  def getTypeConstructors = {
    typeConstructors
  }

  def setTypeConstructors(constructors : MList[String]) {
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
  def getTypeConstructorElems(typeConstructorElems : String*) = {
    (option : @unchecked) match {
      case TypeTarget.Coq =>
        typeConstructorElems
      case TypeTarget.Ocaml =>
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
  def getTypeConstructor(cons : String) = {
    (option : @unchecked) match {
      case TypeTarget.Coq =>
        cons
      case TypeTarget.Ocaml =>
        if (cons.contains("*")) {
          cons
        } else {
          val t = cons.split(" of ")
          t.apply(1) // drop the constructor head
        }
    }
  }

  /**
   * In Coq, "option bool" should be written with "bool option" in OCaml
   */
  def getOptionType(theType : String) = {
    val result = stg.getInstanceOf("optionType")
    result.add("theType", theType)
    result.render()
  }

  def getListType(elemType : String) = {
    val result = stg.getInstanceOf("listType")
    result.add("elemType", elemType)
    result.render()
  }

  def typeTranslator {
    trans_compilatoin_unit
    writeIntoTargetTypeFile
  }

  def trans_compilatoin_unit {
    val cu = classOf[CompilationUnit]
    for (f <- cu.getDeclaredFields) {
      val fldname = f.getName()
      fldname match {
        case "unitDeclarationQ" =>
          trans_package_declaration
        case _ =>
          Unit
      }
    }

    val annotation : Option[String] = None
    val constructors = List(
      List("CompilationUnit", TypeNameSpace.AstNum, TypeNameSpace.UnitDeclaration,
        TypeNameSpace.TypeTable, TypeNameSpace.CompilationUnit))
    this.createInductiveTypeV2(TypeNameSpace.CompilationUnit, annotation, constructors)
  }

  def trans_package_declaration {
    val decls = classOf[DeclarationClass]
    for (f <- decls.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType == classOf[XmlElements]) {
          val xelems = a.asInstanceOf[XmlElements]
          for (elem <- xelems.value()) {
            for (m <- elem.getClass.getDeclaredMethods if m.getName == "type") {
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
    //val annotation: Option[String] = Some("compilation unit can be either package_declaration or package_body_declaration")
    val annotation : Option[String] = None
    val constructors = List(
      //List("PackageDeclaration", TypeNameSpace.AstNum, TypeNameSpace.PackageDeclaration, TypeNameSpace.UnitDeclaration), 
      //List("PackageBodyDecl", TypeNameSpace.AstNum, TypeNameSpace.PackageBodyDecl, TypeNameSpace.UnitDeclaration)
      List("UnitDecl", TypeNameSpace.AstNum, TypeNameSpace.SubProgram, TypeNameSpace.UnitDeclaration)
    )
    createInductiveTypeV2(TypeNameSpace.UnitDeclaration, annotation, constructors)
  }

  def trans_packagebody_declaration {
    val package_body_decl = classOf[PackageBodyDeclaration]
    for (f <- package_body_decl.getDeclaredFields) {
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
    /*
    val annotation: Option[String] = None
    val constructors = List(
        List("PackageBody", TypeNameSpace.AstNum, TypeNameSpace.PkgNum, getOptionType(getListType(TypeNameSpace.AspectSpecification)), 
            getListType(TypeNameSpace.SubProgram), TypeNameSpace.PackageBodyDecl))
    createInductiveTypeV2(TypeNameSpace.PackageBodyDecl, annotation, constructors)
    */
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
    for (f <- decls.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType == classOf[XmlElements]) {
          val xelems = a.asInstanceOf[XmlElements]
          for (elem <- xelems.value()) {
            for (m <- elem.getClass.getDeclaredMethods if m.getName == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val cons = mtype.getSimpleName match {
                case "ProcedureBodyDeclaration" =>
                  trans_procedurebody_declaration
                case "FunctionBodyDeclaration" =>
                  trans_functionbody_declaration
                case _ =>
                  Unit
              }
            }
          }
          // create a subprogram type for both procedure and functio
          val typeName = TypeNameSpace.SubProgram
          val constructors = List(
            List("Sproc", TypeNameSpace.AstNum, TypeNameSpace.ProcedureBody, TypeNameSpace.SubProgram),
            List("Sfunc", TypeNameSpace.AstNum, TypeNameSpace.FunctionBody, TypeNameSpace.SubProgram))
          createInductiveTypeV2(typeName, None, constructors)
        }
      }
    }
  }

  def trans_variable_declaration {
    val typeName = TypeNameSpace.LocalVariableDeclaration
    val annotation = Some("Local variables declarations used in the procedure/function body")
    val fields = List(
      createFieldDecl("local_astnum", TypeNameSpace.AstNum, false),
      createFieldDecl("local_idents", getListType(TypeNameSpace.IdNum), false),
      createFieldDecl("local_typenum", TypeNameSpace.TypeNum, false),
      createFieldDecl("local_init", TypeNameSpace.Expression, true))
    createRecordType(typeName, annotation, typeName, fields : _*)
  }

  def trans_parameter_specification {
    val typeName = TypeNameSpace.ParameterSpecification
    val fields = List(
      createFieldDecl("param_astnum", TypeNameSpace.AstNum, false),
      createFieldDecl("param_idents", getListType(TypeNameSpace.IdNum), false),
      createFieldDecl("param_typenum", TypeNameSpace.TypeNum, false),
      createFieldDecl("param_mode", TypeNameSpace.ModeT, false),
      createFieldDecl("param_init", TypeNameSpace.Expression, true))
    createRecordType(typeName, None, typeName, fields : _*)
  }

  /**
   * procedure_annotation ::= [global_definition]
   *                          [dependency_relation]
   *                          [precondition]
   *                          [postcondition]
   */
  def trans_procedure_aspectspecs {
    val typeName = TypeNameSpace.AspectSpecification
    val fields = List(
      createFieldDecl("aspect_astnum", TypeNameSpace.AstNum, false),
      createFieldDecl("aspect_mark", TypeNameSpace.AspectNum, false),
      createFieldDecl("aspect_definition", TypeNameSpace.Expression, false))
    createRecordType(typeName, None, typeName, fields : _*)
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
  def trans_procedurebody_declaration {
    val procBody = classOf[ProcedureBodyDeclaration]
    // define the type definition order in Coq
    var orders = List("bodyStatementsQl", "parameterProfileQl", "aspectSpecificationsQl", "bodyDeclarativeItemsQl")
    var seen = Set[String]()
    var fTrans = Map[String, String => Unit]()
    for (f <- procBody.getDeclaredFields) {
      val fieldName = f.getName()
      seen = seen + fieldName
    }

    // create the Coq types that procedure body declaration depends on
    for (f <- orders if seen.contains(f)) {
      f match {
        case "bodyStatementsQl" =>
          trans_statementlist // expression needs to be defined first
        case "parameterProfileQl" =>
          trans_parameter_specification
        case "aspectSpecificationsQl" =>
          trans_procedure_aspectspecs
        case "bodyDeclarativeItemsQl" =>
          trans_variable_declaration
      }
    }
    // create procedure annotations: Global, Pre, Post, ...

    // create the Coq type for procedure body declaration
    val typeName = TypeNameSpace.ProcedureBody
    val fields = List(
      createFieldDecl("proc_astnum", TypeNameSpace.AstNum, false),
      createFieldDecl("proc_name", TypeNameSpace.ProcNum, false),
      createFieldDecl("proc_specs", getListType(TypeNameSpace.AspectSpecification), true),
      createFieldDecl("proc_params", getListType(TypeNameSpace.ParameterSpecification), true),
      createFieldDecl("proc_loc_idents", getListType(TypeNameSpace.LocalVariableDeclaration), true),
      createFieldDecl("proc_body", TypeNameSpace.StatementList, false))
    createRecordType(typeName, None, typeName, fields : _*)
  }

  /**
   * FunctionBodyDeclaration /- ParameterSpecificationList parameterProfileQl
   *                         |- ElementClass resultProfileQ
   *                         |- ElementList bodyDeclarativeItemsQl
   *                         |- StatementList bodyStatementsQl
   */
  def trans_functionbody_declaration {
    val funcBody = classOf[FunctionBodyDeclaration]
    for (f <- funcBody.getDeclaredFields) {
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
    val typeName = TypeNameSpace.FunctionBody
    val fields = List(
      createFieldDecl("fn_astnum", TypeNameSpace.AstNum, false),
      createFieldDecl("fn_name", TypeNameSpace.ProcNum, false),
      createFieldDecl("fn_ret_type", TypeNameSpace.Type, false),
      createFieldDecl("fn_specs", getListType(TypeNameSpace.AspectSpecification), true),
      createFieldDecl("fn_params", getListType(TypeNameSpace.ParameterSpecification), true),
      createFieldDecl("fn_loc_idents", getListType(TypeNameSpace.LocalVariableDeclaration), true),
      createFieldDecl("fn_body", TypeNameSpace.StatementList, false))
    createRecordType(typeName, None, typeName, fields : _*)
  }

  def trans_statementlist {
    val statement = classOf[StatementClass]
    for (f <- statement.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType() == classOf[XmlElements]) {
          emptyTypeConstructors
          val xelems = a.asInstanceOf[XmlElements]
          for (elem <- xelems.value) {
            for (m <- elem.getClass.getDeclaredMethods if m.getName == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              mtype.getSimpleName() match {
                case "AssignmentStatement" =>
                  trans_expression
                  createAndPushConstructor("Sassign", TypeNameSpace.AstNum, TypeNameSpace.IdNum,
                    TypeNameSpace.Expression, TypeNameSpace.StatementList)
                case "IfStatement" =>
                  createAndPushConstructor("Sifthen", TypeNameSpace.AstNum, TypeNameSpace.Expression,
                    TypeNameSpace.StatementList, TypeNameSpace.StatementList)
                case "WhileLoopStatement" =>
                  // option: loop invariant (--# assert predicate) for while loop
                  // createTypeRename(TypeNameSpace.Predicate, TypeNameSpace.Expression)
                  // createTypeRename(TypeNameSpace.LoopInvariant, getOptionType(TypeNameSpace.Predicate))
                  createAndPushConstructor("Swhile", TypeNameSpace.AstNum, TypeNameSpace.Expression, //TypeNameSpace.LoopInvariant, 
                    TypeNameSpace.StatementList, TypeNameSpace.StatementList)
                case "BlockStatement" =>
                  createAndPushConstructor("Sseq", TypeNameSpace.AstNum, TypeNameSpace.StatementList,
                    TypeNameSpace.StatementList, TypeNameSpace.StatementList)
                case "AssertPragma" =>
                  // assert and loop invariant
                  createAndPushConstructor("Sassert", TypeNameSpace.AstNum, TypeNameSpace.Expression, TypeNameSpace.StatementList)
                  createAndPushConstructor("Sloopinvariant", TypeNameSpace.AstNum, TypeNameSpace.Expression, TypeNameSpace.StatementList)
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
          createInductiveType(TypeNameSpace.StatementList, None, getTypeConstructors : _*)
          emptyTypeConstructors
        }
      }
    }
  }

  def trans_expression {
    val exp = classOf[ExpressionClass]
    for (f <- exp.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType == classOf[XmlElements]) {
          emptyTypeConstructors
          val xelems = a.asInstanceOf[XmlElements]
          val mTrans = Map[String, Class[_] => Unit]("IntegerLiteral" -> trans_literal, "Identifier" -> trans_identifier,
            "FunctionCall" -> trans_functioncall)
          for (elem <- xelems.value) {
            for (m <- elem.getClass.getDeclaredMethods if (m.getName == "type")) {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              var hit = false
              for (e <- mTrans if !hit)
                if (mtype.toString().endsWith(e._1)) {
                  e._2(mtype)
                  hit = true
                }
            }
          }
          // write the resulting type into a Coq file
          // 1. sort expression constructors

          // 2. generate expression type with these constructors, and write into Coq file
          createInductiveType(TypeNameSpace.Expression, None, getTypeConstructors : _*)
          emptyTypeConstructors
        }
      }
    }
  }

  /**
   * | Econst: nat -> expr
   */
  def trans_literal(c : java.lang.Class[_]) = {
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
    val bodyStmts = List(TypeNameSpace.AstNum, TypeNameSpace.Constant, TypeNameSpace.Expression)
    createAndPushConstructor("Econst", bodyStmts : _*)
  }

  /**
   * Evar: ident -> expr
   */
  def trans_identifier(c : java.lang.Class[_]) = {
    val bodySmts = List(TypeNameSpace.AstNum, TypeNameSpace.IdNum, TypeNameSpace.Expression)
    createAndPushConstructor("Evar", bodySmts : _*)
  }

  /**
   * | BinExp: Exp -> Op -> Exp -> Exp
   * | NegExp: Exp -> Exp
   * | PosExp: Exp -> ExP
   *
   * class FunctionCall /- ExpressionClass prefixQ
   *                    |- AssociationList functionCallParametersQl
   */
  def trans_functioncall(c : java.lang.Class[_]) = {
    val cons = getTypeConstructors
    for (f <- c.getDeclaredFields if f.getName == "prefixQ") {
      val opT = f.getType()
      trans_operator(opT)
    }

    setTypeConstructors(cons)
    createAndPushConstructor("Ebinop", TypeNameSpace.AstNum, TypeNameSpace.BinaryOp,
      TypeNameSpace.Expression, TypeNameSpace.Expression, TypeNameSpace.Expression)
    createAndPushConstructor("Eunop", TypeNameSpace.AstNum, TypeNameSpace.UnaryOp,
      TypeNameSpace.Expression, TypeNameSpace.Expression)
  }

  def trans_operator(c : java.lang.Class[_]) = {
    for (f <- c.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType() == classOf[XmlElements]) {
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
          for (elem <- xelems.value) {
            for (m <- elem.getClass.getDeclaredMethods if m.getName() == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val bop = binopTrans.get(mtype.getSimpleName)
              val uop = unopTrans.get(mtype.getSimpleName)
              // operator type <Op> is something like: | BGt: Op 
              if (bop.isDefined)
                binOps += createConstructor(bop.get, TypeNameSpace.BinaryOp)
              else if (uop.isDefined)
                unOps += createConstructor(uop.get, TypeNameSpace.UnaryOp)
            }
          }
          // [1] sort the constructors
          val sortedUnOpCons = unOps.sortWith(_ < _)
          val sortedBinOpCons = binOps.sortWith(_ < _)
          // [2] construct Operator type and write into the Coq file
          createInductiveType(TypeNameSpace.UnaryOp, None, sortedUnOpCons : _*)
          createInductiveType(TypeNameSpace.BinaryOp, None, sortedBinOpCons : _*)
        }
      }
    }
  }

  /**
   * Definition newName := oldName.
   */
  def createTypeRename(newName : String, oldName : String) {
    val result = stg.getInstanceOf("typeRename")
    result.add("newName", newName)
    result.add("oldName", oldName)
    typeDeclarations += (result.render())
  }

  /**
   * Type definitions are different in Coq and OCaml, take id as example
   * In Coq:   Inductive id := | Id: string -> id. (its constructorArgs is <Id, string, id>)
   * In OCaml: type      id = | Id of string       (its constructorArgs is <Id, string>)
   */
  def createConstructor(constructorName : String, constructorArgs : String*) = {
    val result = stg.getInstanceOf("constructor")
    result.add("constructorName", constructorName)
    val typeConstructorArgs = getTypeConstructorElems(constructorArgs : _*)
    typeConstructorArgs.foreach(e => result.add("constructorArgs", e))
    // return
    result.render()
  }

  def createAndPushConstructor(constructorName : String, constructorArgs : String*) = {
    val result = createConstructor(constructorName, constructorArgs : _*)
    typeConstructors += result
  }

  def createInductiveType(typeName : String, annotation : Option[String], constructors : String*) {
    // [1] generate expression type with these constructors
    val result = stg.getInstanceOf("typeDeclaration")
    result.add("typeName", typeName)
    if (constructors.length == 1) {
      // ocmal type extracted from coq type will be optimized
      result.add("constructorDecls", getTypeConstructor(constructors.head))
    } else {
      constructors.foreach(cons => result.add("constructorDecls", cons))
    }
    if (annotation.isDefined)
      result.add("annotation", annotation.get)
    // [2] add it into typeDeclarations
    typeDeclarations += result.render()
  }

  def createInductiveTypeV2(typeName : String, annotation : Option[String], constructors : List[List[String]]) {
    // [1] generate expression type with these constructors
    val result = stg.getInstanceOf("typeDeclaration")
    result.add("typeName", typeName)
    if (constructors.length == 1) {
      // ocmal type extracted from coq type will be optimized
      val c = constructors.head
      val cons = createConstructor(c.head, c.tail : _*)
      result.add("constructorDecls", getTypeConstructor(cons))
    } else {
      constructors.foreach(consElems => {
        val constructorName = consElems.head
        val constructorArgs = consElems.tail
        val cons = createConstructor(constructorName, constructorArgs : _*)
        result.add("constructorDecls", cons)
      })
    }
    if (annotation.isDefined)
      result.add("annotation", annotation.get)
    // [2] add it into typeDeclarations
    typeDeclarations += result.render()
  }

  def createFieldDecl(fieldName : String, fieldType : String, option : Boolean) = {
    val result = stg.getInstanceOf("fieldDeclaration")
    result.add("fieldName", fieldName)
    option match {
      case true  => result.add("fieldType", getOptionType(fieldType))
      case false => result.add("fieldType", fieldType)
    }
    result.render()
  }

  def createRecordType(recordName : String, annotation : Option[String], constructorName : String, fields : String*) = {
    val result = stg.getInstanceOf("recordDeclaration")
    result.add("recordName", recordName)
    result.add("constructorName", "mk" + constructorName)
    fields.foreach(f => result.add("fields", f))
    if (annotation.isDefined)
      result.add("annotation", annotation.get)
    typeDeclarations += result.render()
  }

  def writeIntoTargetTypeFile() {
    val typeDefs = stg.getInstanceOf("typeDefinitions")
    typeDeclarations.foreach(typeDecl =>
      typeDefs.add("typeDeclarations", typeDecl))

    // val fwriter = new FileWriter(new File(o.outFile, outFileName))
    val fwriter = new FileWriter(new File(new URI(o.outFile)))
    fwriter.write(typeDefs.render())
    fwriter.close()
    println("wrote: " + o.outFile)
    // println(typeDefs.render())
  }
}

object TypeTranslator {
  def run(mode : SireumBakarTypeMode) {
    val translator = new BakarTypeTranslator(mode);
    translator.typeTranslator
    println("\n      Type Translation: SPARK --> " + mode.typ.toString.dropRight(1) + " !\n")

  }

  def main(args : Array[String]) {
    val mode = SireumBakarTypeMode()
    run(mode)
  }
}

