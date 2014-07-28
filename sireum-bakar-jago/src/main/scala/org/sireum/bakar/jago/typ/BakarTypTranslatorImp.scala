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
import org.sireum.bakar.xml.DefinitionClass
import org.sireum.bakar.xml.ParameterSpecification
import org.sireum.bakar.xml.AspectSpecification
import org.sireum.bakar.xml.ComponentDeclaration

class BakarTypTranslatorModuleDef (val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarTypTranslatorModule {
  class Context {
    var typeDeclarations = mlistEmpty[Any]
    var result : Any = null

    def pushResult(o : Any) {
      result = o
    }

    def popResult = {
      val r = result
      result = null
      r
    }
    
    def reset = {
      typeDeclarations = mlistEmpty[Any]
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

  
  def trans_type {
    trans_expression
    trans_statement
    trans_range
    // array/record type declarations
    trans_definition 
    // variable declarations
    trans_object_declaration
    // parameter / aspect specification
    trans_parameter_specification
//  trans_procedure_aspectspecs
    trans_declaration
//  trans_subprogram_declaration
//  trans_package_declaration
//  trans_compilatoin_unit
  }
  
  def trans_compilatoin_unit {
    val cu = classOf[CompilationUnit]
    val constructors = mlistEmpty[String]
    for (f <- cu.getDeclaredFields) {
      val fldname = f.getName()
      fldname match {
        case "unitDeclarationQ" =>
          constructors += buildTypeConstructor(
              TypeNameSpace.CompilationUnit, "Library_Unit_XX", TypeNameSpace.AstNum, TypeNameSpace.UnitDeclaration)
        case _ =>
      }
    }

    val annotation : Option[String] = None
    val cuDecl = buildInductiveType(TypeNameSpace.CompilationUnit, annotation, constructors : _*)
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
                  Unit
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
    constructors += buildTypeConstructor(TypeNameSpace.UnitDeclaration, "Library_Subprogram_XX", TypeNameSpace.AstNum, TypeNameSpace.SubProgram)
    //buildTypeConstructor("PackageDeclaration", TypeNameSpace.AstNum, TypeNameSpace.PackageDeclaration, TypeNameSpace.UnitDeclaration), 
    //buildTypeConstructor("PackageBodyDecl", TypeNameSpace.AstNum, TypeNameSpace.PackageBodyDecl, TypeNameSpace.UnitDeclaration)
    val pkgDecl = buildInductiveType(TypeNameSpace.UnitDeclaration, annotation, constructors : _*)
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
          Unit
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
          val constructors = mlistEmpty[String]
          for (elem <- xelems.value()) {
            for (m <- elem.getClass.getDeclaredMethods if m.getName == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val cons = mtype.getSimpleName match {
                case "ProcedureBodyDeclaration" =>
                  constructors += buildTypeConstructor(TypeNameSpace.SubProgram, "Global_Procedure_XX", TypeNameSpace.AstNum, TypeNameSpace.ProcedureBodyDeclaration)
//              case "FunctionBodyDeclaration" =>
//                // Notice: "function" is a keyword in OCaml; 
//                constructors += buildTypeConstructor(TypeNameSpace.SubProgram, "Global_Function", TypeNameSpace.AstNum, TypeNameSpace.FunctionBodyDeclaration)
                case _ =>
              }
            }
          }
          // create a subprogram type for both procedure and function
          val annotation : Option[String] = None
          val subprogramDecl = buildInductiveType(TypeNameSpace.SubProgram, annotation, constructors : _*)
          ctx.addNewTypeDecl(subprogramDecl)
        }
      }
    }
  }
  
  def trans_declaration {
    val decls = classOf[DeclarationClass]
    for (f <- decls.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType == classOf[XmlElements]) {
          val constructors = mlistEmpty[String]
          constructors += buildTypeConstructor(TypeNameSpace.Declaration, "D_Null_Declaration_XX")
          val xelems = a.asInstanceOf[XmlElements]
          for (elem <- xelems.value()) {
            for (m <- elem.getClass.getDeclaredMethods if m.getName == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val cons = mtype.getSimpleName match {
                case "ComponentDeclaration" =>
                  constructors += buildTypeConstructor(TypeNameSpace.Declaration, "D_Object_Declaration_XX", TypeNameSpace.AstNum, TypeNameSpace.ObjectDeclaration)
                case "ProcedureBodyDeclaration" =>
                  constructors += buildTypeConstructor(TypeNameSpace.Declaration, "D_Procedure_Body_XX", TypeNameSpace.AstNum, TypeNameSpace.ProcedureBodyDeclaration)
                case "OrdinaryTypeDeclaration" =>
                  constructors += buildTypeConstructor(TypeNameSpace.Declaration, "D_Type_Declaration_XX", TypeNameSpace.AstNum, TypeNameSpace.TypeDeclaration)
//              case "FunctionBodyDeclaration" =>
//                trans_functionbody_declaration
                case _ => 
              }
            }
          }
          // add sequence of declarations, which is used for easy proof
          constructors += buildTypeConstructor(TypeNameSpace.Declaration, "D_Seq_Declaration_XX", TypeNameSpace.AstNum, TypeNameSpace.Declaration, TypeNameSpace.Declaration)
          
          trans_procedurebody_declaration
          val procedureBodyDecl = ctx.popResult.toString()
          val withs = mlistEmpty[String]
          withs += procedureBodyDecl
          val annotation = None
          val decls = buildMutuallyInductiveType(TypeNameSpace.Declaration, annotation, constructors, withs)
          ctx.addNewTypeDecl(decls)          
        }
      }
    }
  }  

  def trans_object_declaration {
    val compDecl = classOf[ComponentDeclaration]
    
    val fields = mlistEmpty[String] 
    
    fields += buildFieldDecl("declaration_astnum_xx", TypeNameSpace.AstNum)
    
    for (f <- compDecl.getDeclaredFields) {
      val fieldName = f.getName()
      fieldName match {
        case "namesQl" =>
          fields += buildFieldDecl("object_name_xx", TypeNameSpace.IdNum)
        case "objectDeclarationViewQ" =>
          fields += buildFieldDecl("object_nominal_subtype_xx", TypeNameSpace.Type)
        case "initializationExpressionQ" => 
          fields += buildFieldDecl("initialization_expression_xx", buildOptionType(TypeNameSpace.Expression))
        case _ => 
      }
    }
    
    val typeName = TypeNameSpace.ObjectDeclaration
    val annotation: Option[String] = None
    val varDecl = buildRecordType(typeName, annotation, fields : _*)
    ctx.addNewTypeDecl(varDecl)
  }
  
  def trans_parameter_specification {
    val paramSpec = classOf[ParameterSpecification]
    
    val fields = mlistEmpty[String] 
    
    fields += buildFieldDecl("parameter_astnum_xx", TypeNameSpace.AstNum)
    
    for (f <- paramSpec.getDeclaredFields) {
      val fieldName = f.getName()
      fieldName match {
        case "namesQl" =>
          fields += buildFieldDecl("parameter_name_xx", TypeNameSpace.IdNum)
        case "objectDeclarationViewQ" =>
          fields += buildFieldDecl("parameter_subtype_mark_xx", TypeNameSpace.Type)
//      case "initializationExpressionQ" => 
//        fields += buildFieldDecl("parameter_default_expression_xx", buildOptionType(TypeNameSpace.Expression))
        case "mode" => 
          fields += buildFieldDecl("parameter_mode_xx", TypeNameSpace.ModeT)
        case _ => 
      }
    }
    // put the mode before the type to match SPARK syntax for parameter, e.g. procedure p(x: Out Integer);
//    val flds = mlistEmpty[String]
//    flds += fields(0)
//    flds += fields(1)
//    flds += fields(3)
//    flds += fields(2)
    
    val typeName = TypeNameSpace.ParameterSpecification
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
    val aspectSpec = classOf[AspectSpecification]
    
    val fields = mlistEmpty[String] 
    
    fields += buildFieldDecl("aspect_astnum_xx", TypeNameSpace.AstNum)
    
    for (f <- aspectSpec.getDeclaredFields) {
      val fieldName = f.getName()
      fieldName match {
        case "aspectMarkQ" =>
          fields += buildFieldDecl("aspect_mark_xx", TypeNameSpace.AspectNum)
        case "aspectDefinitionQ" =>
          fields += buildFieldDecl("aspect_definition_xx", TypeNameSpace.Expression)
        case _ =>
      }
    }
    
    val typeName = TypeNameSpace.AspectSpecification
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
    
    val fields = mlistEmpty[String] 
    
    fields += "(" + buildFieldDecl("procedure_astnum_xx", TypeNameSpace.AstNum) + ")"
    
    for (f <- procBody.getDeclaredFields) {
      val fieldName = f.getName()
      val field = 
        fieldName match {
        case "namesQl" =>
          buildFieldDecl("procedure_name_xx", TypeNameSpace.ProcNum)
        case "parameterProfileQl" =>
          buildFieldDecl("procedure_parameter_profile_xx", buildListType(TypeNameSpace.ParameterSpecification))
//      case "aspectSpecificationsQl" => 
//        buildFieldDecl("procedure_aspect_xx", buildListType(TypeNameSpace.AspectSpecification))
        case "bodyDeclarativeItemsQl" => 
          buildFieldDecl("procedure_declarative_part_xx", TypeNameSpace.Declaration)
        case "bodyStatementsQl" => 
          buildFieldDecl("procedure_statements_xx", TypeNameSpace.Statement)
        case _ => ""
      }
      if(field != "")
        fields += "(" + field + ")"
    }
    // create the Coq type for procedure body declaration
    val typeName = TypeNameSpace.ProcedureBodyDeclaration
    val procBodyDecl = buildWithOneConstructorType(typeName, None, "mkprocedure_body_xx", fields : _*)
    ctx.pushResult(procBodyDecl)
  }

  /**
   * FunctionBodyDeclaration /- ParameterSpecificationList parameterProfileQl
   *                         |- ElementClass resultProfileQ
   *                         |- ElementList bodyDeclarativeItemsQl
   *                         |- StatementList bodyStatementsQl
   */
//  def trans_functionbody_declaration {
//    val funcBody = classOf[FunctionBodyDeclaration]
//    for (f <- funcBody.getDeclaredFields) {
//      val fieldName = f.getName()
//      val retT = fieldName match {
//        case "resultProfileQ" =>
//          None
//        //        case "parameterProfileQl" =>
//        //          xml2coq_parameterspecification
//        //        case "bodyDeclarativeItemsQl" =>
//        //          xml2coq_variabledeclaration
//        //        case "bodyStatementsQl" =>
//        //          xml2coq_statementlist
//        case _ =>
//          None
//      }
//
//    }
//    // create the Coq type for function body declaration
//    val typeName = TypeNameSpace.FunctionBody
//    val annotation = None
//    val fields = List(
//      buildFieldDecl("function_astnum", TypeNameSpace.AstNum),
//      buildFieldDecl("function_name", TypeNameSpace.ProcNum),
//      buildFieldDecl("function_result_subtype", TypeNameSpace.Type),
//      buildFieldDecl("function_contracts", buildListType(TypeNameSpace.AspectSpecification)),
//      buildFieldDecl("function_parameter_profile", buildListType(TypeNameSpace.ParameterSpecification)),
//      buildFieldDecl("function_declarative_part", buildListType(TypeNameSpace.ObjectDeclaration)),
//      buildFieldDecl("function_statements", TypeNameSpace.Statement))
//    val fnBodyDecl = buildRecordType(typeName, annotation, fields : _*)
//    ctx.addNewTypeDecl(fnBodyDecl)
//  }
  
  def trans_definition {
    val definition = classOf[DefinitionClass]
    for (f <- definition.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType() == classOf[XmlElements]) {
          val typeConstructors = mlistEmpty[String]
          val xelems = a.asInstanceOf[XmlElements]
          for (elem <- xelems.value) {
            for (m <- elem.getClass.getDeclaredMethods if m.getName == "type") {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              val tc = mtype.getSimpleName() match {
                case "SubtypeIndication" =>
                  buildTypeConstructor(TypeNameSpace.TypeDeclaration, "Subtype_Declaration_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.TypeNum, TypeNameSpace.Type, TypeNameSpace.Range)
                case "DerivedTypeDefinition" =>
                  buildTypeConstructor(TypeNameSpace.TypeDeclaration, "Derived_Type_Declaration_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.TypeNum, TypeNameSpace.Type, TypeNameSpace.Range)
                case "SignedIntegerTypeDefinition" =>
                  buildTypeConstructor(TypeNameSpace.TypeDeclaration, "Integer_Type_Declaration_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.TypeNum, TypeNameSpace.Range)
                case "ConstrainedArrayDefinition" =>
                  buildTypeConstructor(TypeNameSpace.TypeDeclaration, "Array_Type_Declaration_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.TypeNum, TypeNameSpace.Type, TypeNameSpace.Type)
                case "RecordTypeDefinition" =>
                  buildTypeConstructor(TypeNameSpace.TypeDeclaration, "Record_Type_Declaration_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.TypeNum, buildListType(buildProduct(TypeNameSpace.IdNum, TypeNameSpace.Type)))
                case _ =>
                  ""
              }
              if (tc != "")
                typeConstructors += tc
            }
          }
          val annotation = None
          val typeDecl = buildInductiveType(TypeNameSpace.TypeDeclaration, annotation, typeConstructors : _*)
          ctx.addNewTypeDecl(typeDecl)
        }
      }
    }
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
                case "NullStatement" =>
                  buildTypeConstructor(TypeNameSpace.Statement, "S_Null_XX")
                case "AssignmentStatement" =>
                  buildTypeConstructor(TypeNameSpace.Statement, "S_Assignment_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.Name, TypeNameSpace.Expression)
                case "IfStatement" =>
                  buildTypeConstructor(TypeNameSpace.Statement, "S_If_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.Expression, TypeNameSpace.Statement, TypeNameSpace.Statement)
                case "WhileLoopStatement" =>
                  buildTypeConstructor(TypeNameSpace.Statement, "S_While_Loop_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.Expression, TypeNameSpace.Statement)
                case "ProcedureCallStatement" =>
                  buildTypeConstructor(TypeNameSpace.Statement, "S_Procedure_Call_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.AstNum, TypeNameSpace.ProcNum, buildListType(TypeNameSpace.Expression))
             // case "BlockStatement" =>
             //   buildTypeConstructor(TypeNameSpace.Statement, "S_Sequence_XX", 
             //       TypeNameSpace.AstNum, TypeNameSpace.Statement, TypeNameSpace.Statement)
             // case "AssertPragma" =>
             //   buildTypeConstructor(TypeNameSpace.Statement, "S_Assert", TypeNameSpace.AstNum, TypeNameSpace.Expression)
             // case "ImplementationDefinedPragma" =>
                  // loop invariant is defined through this data structure
             //   buildTypeConstructor(TypeNameSpace.Statement, "S_Loop_Invariant", TypeNameSpace.AstNum, TypeNameSpace.Expression)
             // case "ReturnStatement" =>
             //   buildTypeConstructor(TypeNameSpace.Statement, "S_Return", TypeNameSpace.AstNum, buildOptionType(TypeNameSpace.Expression))
             // case "ForLoopStatement" =>
             //   ""
             // case "CaseStatement" =>
             //   ""
             // case "LoopStatement" =>
             //   ""
                case _ =>
                  ""
              }
              if (tc != "")
                typeConstructors += tc
            }
          }
          typeConstructors += buildTypeConstructor(TypeNameSpace.Statement, "S_Sequence_XX", 
              TypeNameSpace.AstNum, TypeNameSpace.Statement, TypeNameSpace.Statement)
          val annotation = None
          val stmtDecl = buildInductiveType(TypeNameSpace.Statement, annotation, typeConstructors : _*)
          ctx.addNewTypeDecl(stmtDecl)
        }
      }
    }
  }

  def trans_expression {
    val exp = classOf[ExpressionClass]
    for (f <- exp.getDeclaredFields) {
      for (a <- f.getDeclaredAnnotations) {
        if (a.annotationType == classOf[XmlElements]) {
          val typeConstructors = mlistEmpty[String]
          
          // (1) Literal and Name
          typeConstructors += buildTypeConstructor(TypeNameSpace.Expression, "E_Literal_XX", TypeNameSpace.AstNum, TypeNameSpace.Literal + TypeNameSpace.Checks)
          typeConstructors += buildTypeConstructor(TypeNameSpace.Expression, "E_Name_XX", TypeNameSpace.AstNum, TypeNameSpace.Name + TypeNameSpace.Checks)
          
          // (2) Binary and Unary Expression
          val xelems = a.asInstanceOf[XmlElements]
          for (elem <- xelems.value) {
            for (m <- elem.getClass.getDeclaredMethods if (m.getName == "type")) {
              val mtype = m.invoke(elem).asInstanceOf[java.lang.Class[_]]
              mtype.getSimpleName() match {
                case "FunctionCall" =>
                  val btc = buildTypeConstructor(TypeNameSpace.Expression, "E_Binary_Operation_XX", TypeNameSpace.AstNum,
                    TypeNameSpace.BinaryOp, TypeNameSpace.Expression, TypeNameSpace.Expression + TypeNameSpace.Checks)
                  val utc = buildTypeConstructor(TypeNameSpace.Expression, "E_Unary_Operation_XX", TypeNameSpace.AstNum,
                    TypeNameSpace.UnaryOp, TypeNameSpace.Expression + TypeNameSpace.Checks)
                  typeConstructors += btc
                  typeConstructors += utc
                case _ => 
              }
            }
          }
          // if needed, we can sort expression constructors  
          trans_name
          val nameDecl = ctx.popResult.toString()
          val withs = mlistEmpty[String]
          withs += nameDecl
          val annotation = None
          val exprDecl = buildMutuallyInductiveType(TypeNameSpace.Expression, annotation, typeConstructors, withs)
          ctx.addNewTypeDecl(exprDecl)
        }
      }
    }
  }
  
  /**
   * name := Identifier | IndexedComponent | SelectedComponent
   **/
  def trans_name {
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
                case "Identifier" =>
                  buildTypeConstructor(TypeNameSpace.Name, "E_Identifier_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.IdNum + TypeNameSpace.Checks)
                case "IndexedComponent" =>
                  buildTypeConstructor(TypeNameSpace.Name, "E_Indexed_Component_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.AstNum, TypeNameSpace.IdNum, TypeNameSpace.Expression + TypeNameSpace.Checks)
                case "SelectedComponent" =>
                  buildTypeConstructor(TypeNameSpace.Name, "E_Selected_Component_XX", 
                      TypeNameSpace.AstNum, TypeNameSpace.AstNum, TypeNameSpace.IdNum, TypeNameSpace.IdNum + TypeNameSpace.Checks)
                case _ =>
                  ""
              }
              if (tc != "")
                typeConstructors += tc
            }
          }
          val annotation = None
          val nameDecl = buildWithType(TypeNameSpace.Name, annotation, typeConstructors : _*)
          ctx.pushResult(nameDecl)
        }
      }
    }
  }  
  
  def trans_range {
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
                case "DiscreteSimpleExpressionRange" =>
                  buildTypeConstructor(TypeNameSpace.Range, "Range_XX", "Z", "Z")
                case _ =>
                  ""
              }
              if (tc != "")
                typeConstructors += tc
            }
          }
          val annotation = None
          val range = buildInductiveType(TypeNameSpace.Range, annotation, typeConstructors : _*)
          ctx.addNewTypeDecl(range)
        }
      }
    }
  }
  
  
  def trans_basics {
    val modes = buildModes
    val basic_types = buildBasicTypes
    ctx.addNewTypeDecl(modes)
    ctx.addNewTypeDecl(basic_types)
    trans_operator
    trans_literal
  }  
  
  /**
   * literal := IntegerLiteral | EnumerationLiteral
   **/
  def trans_literal {
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
                  buildTypeConstructor(TypeNameSpace.Literal, "Integer_Literal", TypeNameSpace.Integer(option))
                case "EnumerationLiteral" =>
                  buildTypeConstructor(TypeNameSpace.Literal, "Boolean_Literal", TypeNameSpace.Bool)
                case _ =>
                  ""
              }
              if (tc != "")
                typeConstructors += tc
            }
          }
          val annotation = None
          val constantDecl = buildInductiveType(TypeNameSpace.Literal, annotation, typeConstructors : _*)
          ctx.addNewTypeDecl(constantDecl)
        }
      }
    }
  }

  /**
   * binary expression is represented with FunctionCall
   * class FunctionCall /- ExpressionClass prefixQ (operator)
   *                    |- AssociationList functionCallParametersQl (operands)
   **/
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
          // (1) sort the constructors
          // val sortedUnOpCons = unOps.sortWith(_ < _)
          // val sortedBinOpCons = binOps.sortWith(_ < _)
          
          // (2) construct Operator type
          val annotation = None
          val UnaryOpTypeDecl = buildInductiveType(TypeNameSpace.UnaryOp, annotation, unOps : _*)
          val BinOpTypeDecl = buildInductiveType(TypeNameSpace.BinaryOp, annotation, binOps : _*)
          ctx.addNewTypeDecl(UnaryOpTypeDecl)
          ctx.addNewTypeDecl(BinOpTypeDecl)
        }
      }
    }
  }  

  // basic AST elements for the language
  trans_basics
  val basic_ast = buildBasicAstTypes(ctx.getTypeDecls.asInstanceOf[MList[String]] : _*)
  
  // language subset
  ctx.reset
  trans_type
  val ast = buildAstTypes(ctx.getTypeDecls.asInstanceOf[MList[String]] : _*)
  this.jagoTypeResults = basic_ast + '\n' + '\n' + ast
}