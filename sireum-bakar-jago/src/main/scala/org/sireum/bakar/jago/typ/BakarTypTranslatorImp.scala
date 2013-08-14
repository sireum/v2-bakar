package org.sireum.bakar.jago.typ

import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
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
import org.sireum.bakar.jago.util.Factory
import org.sireum.bakar.jago.util.TranslatorUtil

class BakarTypTranslatorModuleDef (val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarTypTranslatorModule {
  class Context {
    val typeDeclarations = mlistEmpty[Any]
    var result : Any = null

    def pushResult(o : Any) {
      result = o
    }

    def popResult = {
      val r = result
      result = null
      r
    }

    def addNewTypeDecl(newTypeDecl : Any) {
      typeDeclarations += newTypeDecl
    }

    def getTypeDecls = {
      typeDeclarations
    }
  }

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

  val ctx = new Context()
  val option = this.jagoTypeTarget
  val stg = getTypeTranslatorSTG(option)
  val factory = new Factory(stg)
  import factory._

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
    val constructors = mlistEmpty[String]
    constructors += buildTypeConstructor(TypeNameSpace.CompilationUnit, "Library_Unit", TypeNameSpace.AstNum,
      TypeNameSpace.UnitDeclaration, TypeNameSpace.TypeTable)
    val cuDecl = buildTypeDeclaration(TypeNameSpace.CompilationUnit, annotation, constructors : _*)
    ctx.addNewTypeDecl(cuDecl)
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
    val constructors = mlistEmpty[String]
    constructors += buildTypeConstructor(TypeNameSpace.UnitDeclaration, "Library_Subprogram", TypeNameSpace.AstNum, TypeNameSpace.SubProgram)
    //List("PackageDeclaration", TypeNameSpace.AstNum, TypeNameSpace.PackageDeclaration, TypeNameSpace.UnitDeclaration), 
    //List("PackageBodyDecl", TypeNameSpace.AstNum, TypeNameSpace.PackageBodyDecl, TypeNameSpace.UnitDeclaration)
    val pkgDecl = buildTypeDeclaration(TypeNameSpace.UnitDeclaration, annotation, constructors : _*)
    ctx.addNewTypeDecl(pkgDecl)
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
          // create a subprogram type for both procedure and function
          val annotation : Option[String] = None
          val constructors = mlistEmpty[String]
          // Notice: "function" is a keyword in OCaml; 
          constructors += buildTypeConstructor(TypeNameSpace.SubProgram, "Procedure", TypeNameSpace.AstNum, TypeNameSpace.ProcedureBody)
          constructors += buildTypeConstructor(TypeNameSpace.SubProgram, "Function", TypeNameSpace.AstNum, TypeNameSpace.FunctionBody)
          //List("PackageDeclaration", TypeNameSpace.AstNum, TypeNameSpace.PackageDeclaration, TypeNameSpace.UnitDeclaration), 
          //List("PackageBodyDecl", TypeNameSpace.AstNum, TypeNameSpace.PackageBodyDecl, TypeNameSpace.UnitDeclaration)
          val subprogramDecl = buildTypeDeclaration(TypeNameSpace.SubProgram, annotation, constructors : _*)
          ctx.addNewTypeDecl(subprogramDecl)
        }
      }
    }
  }

  def trans_object_declaration {
    val typeName = TypeNameSpace.ObjectDeclaration
    val annotation = Some("variables declarations in procedure/function")
    val fields = List(
      buildFieldDecl("declaration_astnum", TypeNameSpace.AstNum),
      //buildFieldDecl("local_idents", buildListType(TypeNameSpace.IdNum)),
      buildFieldDecl("object_name", TypeNameSpace.IdNum),
      buildFieldDecl("object_nominal_subtype", TypeNameSpace.TypeNum),
      buildFieldDecl("initialization_expression", buildOptionType(TypeNameSpace.Expression)))
    val varDecl = buildRecordType(typeName, annotation, fields : _*)
    ctx.addNewTypeDecl(varDecl)
  }

  def trans_parameter_specification {
    val typeName = TypeNameSpace.ParameterSpecification
    val fields = List(
      buildFieldDecl("parameter_astnum", TypeNameSpace.AstNum),
      //buildFieldDecl("param_idents", buildListType(TypeNameSpace.IdNum)),
      buildFieldDecl("parameter_name", TypeNameSpace.IdNum),
      buildFieldDecl("parameter_subtype_mark", TypeNameSpace.TypeNum),
      buildFieldDecl("parameter_mode", TypeNameSpace.ModeT),
      buildFieldDecl("parameter_default_expression", buildOptionType(TypeNameSpace.Expression)))
    val paramDecl = buildRecordType(typeName, None, fields : _*)
    ctx.addNewTypeDecl(paramDecl)
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
      buildFieldDecl("aspect_astnum", TypeNameSpace.AstNum),
      buildFieldDecl("aspect_mark", TypeNameSpace.AspectNum),
      buildFieldDecl("aspect_definition", TypeNameSpace.Expression))
    val procAspectDecl = buildRecordType(typeName, None, fields : _*)
    ctx.addNewTypeDecl(procAspectDecl)
  }

  /**
   * ProcedureBodyDeclaration /- ParameterSpecificationList /- ParameterSpecification /- DefiningNameList namesQl (var name)
   *                          |                                                       |- String mode (in, out, in out)
   *                          |                                                       |- DefinitionClass objectDeclarationViewQ (var type)
   *                          |                                                       |- ExpressionClass initializationExpressionQ
   *                          |- ElementList aspectSpecificationsQl (define global, pre, post ...)
   *                          |- ElementList bodyDeclarativeItemsQl (define temperate variables used in procedure body)
   *                          |- StatementList bodyStatementsQl (commands in procedure boy)
   *
   *
   * Pay attention to the order of defined Coq types that have certain dependence relations
   * those types being depended by other types should be defined preceding them
   */
  def trans_procedurebody_declaration {
    val procBody = classOf[ProcedureBodyDeclaration]
    // define the type definition order in Coq
    // to make the generated language defined in the same order as they are 
    // defined in Ada 2012 RM, ""bodyDeclarativeItemsQl"" is defined first,
    // and then "parameterProfileQl";
    var orders = List("bodyStatementsQl", "bodyDeclarativeItemsQl", "parameterProfileQl", "aspectSpecificationsQl")
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
          trans_statement // expression needs to be defined first
        case "parameterProfileQl" =>
          trans_parameter_specification
        case "aspectSpecificationsQl" =>
          trans_procedure_aspectspecs
        case "bodyDeclarativeItemsQl" =>
          trans_object_declaration
      }
    }
    // create procedure annotations: Global, Pre, Post, ...

    // create the Coq type for procedure body declaration
    val typeName = TypeNameSpace.ProcedureBody
    val fields = List(
      buildFieldDecl("procedure_astnum", TypeNameSpace.AstNum),
      buildFieldDecl("procedure_name", TypeNameSpace.ProcNum),
      buildFieldDecl("procedure_contracts", buildListType(TypeNameSpace.AspectSpecification)),
      buildFieldDecl("procedure_parameter_profile", buildListType(TypeNameSpace.ParameterSpecification)),
      buildFieldDecl("procedure_declarative_part", buildListType(TypeNameSpace.ObjectDeclaration)),
      buildFieldDecl("procedure_statements", TypeNameSpace.Statement))
    val procBodyDecl = buildRecordType(typeName, None, fields : _*)
    ctx.addNewTypeDecl(procBodyDecl)
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
    val annotation = None
    val fields = List(
      buildFieldDecl("function_astnum", TypeNameSpace.AstNum),
      buildFieldDecl("function_name", TypeNameSpace.ProcNum),
      buildFieldDecl("function_result_subtype", TypeNameSpace.Type),
      buildFieldDecl("function_contracts", buildListType(TypeNameSpace.AspectSpecification)),
      buildFieldDecl("function_parameter_profile", buildListType(TypeNameSpace.ParameterSpecification)),
      buildFieldDecl("function_declarative_part", buildListType(TypeNameSpace.ObjectDeclaration)),
      buildFieldDecl("function_statements", TypeNameSpace.Statement))
    val fnBodyDecl = buildRecordType(typeName, annotation, fields : _*)
    ctx.addNewTypeDecl(fnBodyDecl)
  }

  def trans_statement {
    val statement = classOf[StatementClass]
    for (f <- statement.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType() == classOf[XmlElements]) {
          val typeConstructors = mlistEmpty[String]
          val xelems = a.asInstanceOf[XmlElements]
          for (elem <- xelems.value) {
            for (m <- elem.getClass.getDeclaredMethods if m.getName == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val tc = mtype.getSimpleName() match {
                case "AssignmentStatement" =>
                  trans_expression
                  buildTypeConstructor(TypeNameSpace.Statement, "S_Assignment", TypeNameSpace.AstNum,
                    TypeNameSpace.IdNum, TypeNameSpace.Expression)
                case "IfStatement" =>
                  buildTypeConstructor(TypeNameSpace.Statement, "S_If", TypeNameSpace.AstNum,
                    TypeNameSpace.Expression, TypeNameSpace.Statement)
                case "WhileLoopStatement" =>
                  buildTypeConstructor(TypeNameSpace.Statement, "S_While_Loop", TypeNameSpace.AstNum,
                    TypeNameSpace.Expression, TypeNameSpace.Statement)
                case "BlockStatement" =>
                  buildTypeConstructor(TypeNameSpace.Statement, "S_Sequence", TypeNameSpace.AstNum,
                    TypeNameSpace.Statement, TypeNameSpace.Statement)
                case "AssertPragma" =>
                  buildTypeConstructor(TypeNameSpace.Statement, "S_Assert", TypeNameSpace.AstNum, TypeNameSpace.Expression)
                case "ImplementationDefinedPragma" =>
                  // loop invariant is defined through this data structure
                  buildTypeConstructor(TypeNameSpace.Statement, "S_Loop_Invariant", TypeNameSpace.AstNum, TypeNameSpace.Expression)
                case "ReturnStatement" =>
                  buildTypeConstructor(TypeNameSpace.Statement, "S_Return", TypeNameSpace.AstNum, buildOptionType(TypeNameSpace.Expression))
                //                case "NullStatement" =>
                //                  createConstructor("CSkip", TypeNameSpace.StatementT)   
                //                case "ForLoopStatement" =>
                //                  ""
                //                case "CaseStatement" =>
                //                  ""
                //                case "LoopStatement" =>
                //                  ""
                case _ =>
                  ""
              }
              if (tc != "")
                typeConstructors += tc
            }
          }
          val annotation = None
          val stmtDecl = buildTypeDeclaration(TypeNameSpace.Statement, annotation, typeConstructors : _*)
          ctx.addNewTypeDecl(stmtDecl)
        }
      }
    }
    // in order to make the generated language defined in the same order
    // as they are defined in the Ada 2012 RM, we add the mode definition 
    // after the definition of statement;
    val modes = buildModes
    ctx.addNewTypeDecl(modes);
  }

  def trans_expression {
    val exp = classOf[ExpressionClass]
    for (f <- exp.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType == classOf[XmlElements]) {
          val typeConstructors = mlistEmpty[String]
          val xelems = a.asInstanceOf[XmlElements]
          for (elem <- xelems.value) {
            for (m <- elem.getClass.getDeclaredMethods if (m.getName == "type")) {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val tc = mtype.getSimpleName() match {
                case "IntegerLiteral" =>
                  trans_literal
                  buildTypeConstructor(TypeNameSpace.Expression, "E_Literal", TypeNameSpace.AstNum, TypeNameSpace.Literal)
                case "Identifier" =>
                  buildTypeConstructor(TypeNameSpace.Expression, "E_Identifier", TypeNameSpace.AstNum, TypeNameSpace.IdNum)
                case "FunctionCall" =>
                  trans_functioncall
                  val btc = buildTypeConstructor(TypeNameSpace.Expression, "E_Binary_Operation", TypeNameSpace.AstNum,
                    TypeNameSpace.BinaryOp, TypeNameSpace.Expression, TypeNameSpace.Expression)
                  val utc = buildTypeConstructor(TypeNameSpace.Expression, "E_Unary_Operation", TypeNameSpace.AstNum,
                    TypeNameSpace.UnaryOp, TypeNameSpace.Expression)
                  typeConstructors += btc
                  typeConstructors += utc
                  ""
                case _ =>
                  ""
              }
              if (tc != "")
                typeConstructors += tc
            }
          }
          // if needed, we can sort expression constructors   
          val annotation = None
          val exprDecl = buildTypeDeclaration(TypeNameSpace.Expression, annotation, typeConstructors : _*)
          ctx.addNewTypeDecl(exprDecl)

        }
      }
    }
  }

  def trans_literal {
    // constant type
    val annotation = None
    val constructors = mlistEmpty[String]
    constructors += buildTypeConstructor(TypeNameSpace.Literal, "Integer_Literal", TypeNameSpace.Integer(option))
    constructors += buildTypeConstructor(TypeNameSpace.Literal, "Boolean_Literal", TypeNameSpace.Bool)
    val constantDecl = buildTypeDeclaration(TypeNameSpace.Literal, annotation, constructors : _*)
    ctx.addNewTypeDecl(constantDecl)
  }

  /**
   * binary expression is represented with FunctionCall
   * class FunctionCall /- ExpressionClass prefixQ (operator)
   *                    |- AssociationList functionCallParametersQl (operands)
   */
  def trans_functioncall {
    val o = classOf[FunctionCall]
    for (f <- o.getDeclaredFields if f.getName == "prefixQ") {
      val tpe = f.getType
      trans_operator
    }
  }

  def trans_operator {
    val o = classOf[ExpressionClass]
    for (f <- o.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType() == classOf[XmlElements]) {
          val xelems = a.asInstanceOf[XmlElements]
          val binOps = mlistEmpty[String]
          val unOps = mlistEmpty[String]
          val binopTrans = Map[String, String]("PlusOperator" -> "Plus", "MinusOperator" -> "Minus", 
              "MultiplyOperator" -> "Multiply", "DivideOperator" -> "Divide",
            // "ModOperator" -> "Mod", "RemOperator" -> "Rem", "ExponentiateOperator" -> "Exponentiate",
            // "ConcatenateOperator" -> "Concatenate", // &
            "AndOperator" -> "And", "OrOperator" -> "Or", // "XorOperator" -> "Xor",
            "EqualOperator" -> "Equal", "NotEqualOperator" -> "Not_Equal", 
            "GreaterThanOperator" -> "Greater_Than", "GreaterThanOrEqualOperator" -> "Greater_Than_Or_Equal",
            "LessThanOperator" -> "Less_Than", "LessThanOrEqualOperator" -> "Less_Than_Or_Equal")
          val unopTrans = Map[String, String]("UnaryPlusOperator" -> "Unary_Plus", "UnaryMinusOperator" -> "Unary_Minus",
              "NotOperator" -> "Not")
          for (elem <- xelems.value) {
            for (m <- elem.getClass.getDeclaredMethods if m.getName() == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val bop = binopTrans.get(mtype.getSimpleName)
              val uop = unopTrans.get(mtype.getSimpleName)
              // operator type <Op> is something like: | BGt: Op 
              if (bop.isDefined)
                binOps += buildTypeConstructor(TypeNameSpace.BinaryOp, bop.get)
              else if (uop.isDefined)
                unOps += buildTypeConstructor(TypeNameSpace.UnaryOp, uop.get)
            }
          }
          // [1] sort the constructors
          val sortedUnOpCons = unOps.sortWith(_ < _)
          val sortedBinOpCons = binOps.sortWith(_ < _)
          // [2] construct Operator type
          val annotation = None
          val UnaryOpTypeDecl = buildTypeDeclaration(TypeNameSpace.UnaryOp, annotation, sortedUnOpCons : _*)
          val BinOpTypeDecl = buildTypeDeclaration(TypeNameSpace.BinaryOp, annotation, sortedBinOpCons : _*)
          ctx.addNewTypeDecl(UnaryOpTypeDecl)
          ctx.addNewTypeDecl(BinOpTypeDecl)
        }
      }
    }
    // in order to make the generated language defined in the same order
    // as they are defined in the Ada 2012 RM, we add the basic types 
    // (boolean and integer) definition after binary operator;
    val basic_types = buildBasicTypes
    ctx.addNewTypeDecl(basic_types);
  }  

  trans_compilatoin_unit
  val results = buildBakarJagoTypes(ctx.getTypeDecls.asInstanceOf[MList[String]] : _*)
  this.jagoTypeResults = results
}