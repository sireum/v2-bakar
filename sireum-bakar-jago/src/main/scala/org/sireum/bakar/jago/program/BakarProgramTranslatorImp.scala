package org.sireum.bakar.jago.program

import org.sireum.pipeline._
import org.sireum.bakar.xml._
import org.sireum.util._
import scala.collection.JavaConversions.asScalaBuffer
import org.sireum.bakar.jago.util.Factory
import org.sireum.bakar.jago.util.TranslatorUtil
import org.stringtemplate.v4.STGroupFile
import org.sireum.bakar.jago.util.TypeNameSpace
import org.sireum.bakar.xml.SourceLocation

class BakarProgramTranslatorModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarProgramTranslatorModule {

  // add implementation here
  // Here we implement the translation from SPARK XML AST tree to Coq value
  // - Bakar2CoqTranslatorConfig generate Bakar2CoqTranslatorModuleCore
  // - Bakar2CoqTranslatorModuleCore is a general framework that's common for all the translation project
  // - Bakar2CoqTranslatorImp implements our specific translation from SPARK XML AST tree to Coq, and it's called in Bakar2CoqTranslatorModuleCore
  type BVisitor = Any => Boolean

  final case class SubprogramClass(
      subprogramName : String,
      returnType : Option[String],
      aspectSpecs : MList[String],
      params : MList[String],
      localVars : String,
      subprogramBody : String)
        
  class SymbolTable {
//  Record symboltable := mkSymbolTable{
//    vars: list (idnum * (mode * type));
//    procs: list (procnum * (level * proc_decl));
//    types: list (typenum * type_decl);
//    exps: list (astnum * type)
//  }.
    
    // natural number is used to represent identifier, in order to make 
    // it readable, we annotate each natural number with its identifier 
    // string, that's why we use string as key for the following maps
    val var_type_map = mmapEmpty[String, (String, String)]
    val proc_decl_map = mmapEmpty[String, (Integer, String)]
    val type_decl_map = mmapEmpty[String, String]
    val exp_type_map = mmapEmpty[Int, String]

    // it's a help map from the unique reference name (either declared type or variable name)
    // to its Coq type, e.g. R: RecordT: ada://variable/Test+1:11/R+14:4 -> (Record_Type (1 (*R*)))
    // it will be used to build exp_type_map, as xml ast includes type reference name to denote
    // the type of the ast node, we can use ref_name_map to map the type reference name to Coq type;
    val ref_name_map = scala.collection.mutable.Map(
        "ada://ordinary_type/Standard-1:1/Integer-1:1" -> "Integer", 
        "universal integer" -> "Integer",
        "ada://ordinary_type/Standard-1:1/Boolean-1:1" -> "Boolean")
        
    // map back from ast node to source location
    val sloc_map = mmapEmpty[Int, SourceLocation]
        
    def getVarTypeMap = var_type_map
    def getProcDeclMap = proc_decl_map
    def getTypeDeclMap = type_decl_map
    def getExpTypeMap = exp_type_map
    def getSlocMap = sloc_map
    
    def insertVarType(x: String, mode: String, theType: String) = {
      var_type_map += (x -> (mode, theType))
    }
    
    def getVarType(x: String) = var_type_map.get(x)
    
    def insertProcedureDecl(procedureId: String, procedureDecl: String, level: Integer = 0) {
      proc_decl_map += (procedureId -> (level, procedureDecl))
    }
    
    def getProcedureDecl(procedureId: String) = {
       proc_decl_map.get(procedureId) match {
         case Some ((n, p)) => (Some (p))
         case None          => None
       }
    }
    
    def insertTypeDecl(typeId: String, typeDecl: String) = {
      type_decl_map += (typeId -> typeDecl)
    }
    
    def getTypeDecl(typeId: String) = type_decl_map.get(typeId)
    
    def insertExpType(expAstNum: Int, typeRefName: String) {
      val typeIdNum = this.getRefName(typeRefName)
      assert(typeIdNum.isDefined)
      exp_type_map += (expAstNum -> typeIdNum.get)
    }
    
    def getExpType(expAstNum: Int) = exp_type_map.get(expAstNum)
    
    /** Coq type refName can be: 
     * Inductive type: Type :=
     *   | Boolean
     *   | Integer 
     *   | Subtype (t: typenum) 
     *   | Derived_Type (t: typenum) 
     *   | Integer_Type (t: typenum) 
     *   | Array_Type (t: typenum) 
     *   | Record_Type (t: typenum).
     */
    def insertRefName(ref: String, refName: String) = {
      // e.g. R: RecordT;
      // ada://variable/Test+1:11/R+14:4 -> (Record_Type (1 (*R*)))
      ref_name_map += (ref -> refName)
    }
    
    def getRefName(refName: String) = ref_name_map.get(refName)
    
    def insertSloc(astnum: Int, sloc: SourceLocation) = {
      sloc_map += (astnum -> sloc)
    }
    
    def getSloc(astnum: Int) = sloc_map.get(astnum)
    
  }
  
  trait Context {
    val results = mlistEmpty[String]
    var result : Any = null
    val symboltable = new SymbolTable

    def pushResult(o : Any) {
      result = o;
    }

    def popResult = {
      val t = result
      result = null
      t
    }

    def addToResults(o : String) {
      results += o
    }

    def getResults = results

    def isEmpty(o : Base) : Boolean = o.isInstanceOf[NotAnElement]

    def isUnaryOp(o : Any) = getUnaryOp(o).isDefined

    def getUnaryOp(o : Any) : scala.Option[String] = {
      if (!o.isInstanceOf[ExpressionClass]) {
        return None
      }
      val x = o.asInstanceOf[ExpressionClass].getExpression().asInstanceOf[Any]
      x match {
        case UnaryMinusOperatorEx(_) => Some("Onegint")
        case UnaryPlusOperatorEx(_)  => Some("Oposint")
        case NotOperatorEx(_)        => Some("Onot")
        case _                       => None
      }
    }

    def isBinaryOp(o : Any) = getBinaryOp(o).isDefined

    def getBinaryOp(o : Any) : scala.Option[String] = {
      if (!o.isInstanceOf[ExpressionClass]) {
        return None
      }
      val x = o.asInstanceOf[ExpressionClass].getExpression().asInstanceOf[Any]
      x match {
        case AndOperatorEx(_)                => Some("And")
        case OrOperatorEx(_)                 => Some("Or")
//      case XorOperatorEx                   => Some("Xor")

        case EqualOperatorEx(_)              => Some("Equal")
        case NotEqualOperatorEx(_)           => Some("Not_Equal")
        case GreaterThanOperatorEx(_)        => Some("Greater_Than")
        case GreaterThanOrEqualOperatorEx(_) => Some("Greater_Than_Or_Equal")
        case LessThanOperatorEx(_)           => Some("Less_Than")
        case LessThanOrEqualOperatorEx(_)    => Some("Less_Than_Or_Equal")

        case DivideOperatorEx(_)             => Some("Divide")
        case MinusOperatorEx(_)              => Some("Minus")
        case MultiplyOperatorEx(_)           => Some("Multiply")
        case PlusOperatorEx(_)               => Some("Plus")
//      case RemOperatorEx(_)                => Some("Rem")
//      case ModOperatorEx                   => Some("Mod")
        case _                               => None
      }
    }
  }

  def packageDeclarationH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ CompilationUnitEx(sloc, contextClauseElements, unitDeclaration, pragmasAfter,
        unitKind, unitClass, unitOrigin, unitFullName, defName, sourceFile, checks) =>
//    if (!contextClauseElements.getContextClauses().isEmpty)
//      Console.err.println("Need to handle context clauses")
      
      // Compilation unit can be either (1) Package Body/Declaration or (2) Procedure/Function Body
      val unitDeclAstNum = factory.next_astnum  
      v(unitDeclaration)
      val result = ctx.popResult.asInstanceOf[String]
      val unitDecl = 
        if(result != null &&
            result.startsWith("(mkprocedure_body")) {
          factory.buildProcedureBodyDeclarationWrapper(unitDeclAstNum, result)
        }else {
          result
        }
      // store the result
      if(unitDecl != null){
        ctx.addToResults(unitDecl)
      }

      false
    case o @ PackageDeclarationEx(sloc, names, aspectSpec,
      visiblePartDecItems, privatePartDecItems, checks) =>
      val visibleDecItems = visiblePartDecItems.getDeclarativeItems()
      declarativePartH(ctx, v, visibleDecItems)
      val visibleDecl = ctx.popResult
      ctx.pushResult(visibleDecl)
      
      val privateDecItems = visiblePartDecItems.getDeclarativeItems()
      declarativePartH(ctx, v, privateDecItems)
      val privateDecl = ctx.popResult
      ctx.pushResult(privateDecl)      

      false
    case o @ PackageBodyDeclarationEx(sloc, names, aspectSpec,
      bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>
//    assert(bodyExceptionHandlers.getExceptionHandlers().isEmpty())
//    assert(names.getDefiningNames().length == 1)
      
      val pkgbody_astnum = factory.next_astnum
      val pkgname = names.getDefiningNames.get(0)
      v(pkgname)
      val pkgBodyName = ctx.popResult
      
      declarativePartH(ctx, v, bodyDecItems.getElements)
      val pkgBodyDecl = ctx.popResult
      ctx.pushResult(pkgBodyDecl)

      false
  }
  
  def declarativePartH(ctx : Context, v : => BVisitor, decItems: java.util.List[org.sireum.bakar.xml.Base]) = {
    // declared items, e.g. variables, array/record types, or procedures
    val it = decItems.iterator()
    val declIds = mlistEmpty[String]
    val seqDeclAstNums = mlistEmpty[Int]
    // in ".ads" file, we just ignore procedure/function declarations;
    while (it.hasNext()){
      val declItem = it.next()
      if(it.hasNext())
        seqDeclAstNums += factory.next_astnum

      val decl_astnum = factory.next_astnum
      v(declItem)
      val declItemAST = ctx.popResult.asInstanceOf[String]
      declIds += factory.buildDeclaration(decl_astnum, declItemAST)
    }
    val declItems = handSeqDeclarations(declIds, seqDeclAstNums)
    ctx.pushResult(declItems)
  }
  
  def handSeqDeclarations(declIds: MList[String], seqDeclAstNums: MList[Int]): String = {
    if(declIds.isEmpty)
      return "D_Null_Declaration_XX"
        
    if (declIds.length == 1)
      return declIds.head
      
    val astnum = seqDeclAstNums.head
    val d1 = declIds.head
    val d2 = handSeqDeclarations(declIds.tail, seqDeclAstNums.tail)
    val seqDecls = factory.buildSeqDeclaration(astnum, d1, d2)
    seqDecls
    
  }  

  def subprogramDeclarationH(ctx : Context, v : => BVisitor) : VisitorFunction = {
      def handleSubprogramBody(sloc : org.sireum.bakar.xml.SourceLocation,
                           names : DefiningNameList,
                           paramProfile : ParameterSpecificationList,
                           bodyDeclItems : ElementList,
                           bodyStatements : StatementList,
                           resultProfile : Option[ElementClass],
                           aspectSpecs : ElementList,
                           exceptionHandlerList : ExceptionHandlerList,
                           isOverridingDec : Base,
                           isNotOverridingDec : Base) = {

//      assert(exceptionHandlerList.getExceptionHandlers().isEmpty())
//      assert(ctx.isEmpty(isOverridingDec))
//      assert(ctx.isEmpty(isNotOverridingDec))
        
        // [1] subprogram name
        // assert(names.getDefiningNames().length == 1)
        v(names.getDefiningNames().get(0))
        val subprogramName = ctx.popResult.asInstanceOf[String]
        
        // [2] return type only for function
        val returnType : Option[String] = 
          resultProfile match {
            case Some(e) => Some("not support function now !")
            case None    => None
          }
        // TODO: now only consider procedure
        assert(returnType == None)
        
        // [3] subprogram parameters
        val params = mlistEmpty[String]
        for (p <- paramProfile.getParameterSpecifications()) {
          v(p)
          params += ctx.popResult.asInstanceOf[String]
        }
        
        // [4] declared local objects, e.g. variables, array/record types, or nested procedures
        declarativePartH(ctx, v, bodyDeclItems.getElements)
        val declItems = ctx.popResult.asInstanceOf[String]
        
        // [5] subprogram body
        v(bodyStatements)
        val subprogramBody = ctx.popResult.asInstanceOf[String]

        // [6] subprogram aspect specification, for example, Pre and Post  
        val specs = mlistEmpty[String]
        
        // [7] return
        SubprogramClass(subprogramName, returnType, specs, params, declItems, subprogramBody)
      }

    {
      case o @ ProcedureDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          name, paramProfile, hasAbstract, aspectSpec, checks) =>
        val procedureDecl = "Does Not Support Procedure Declaration: " + o.getClass().getSimpleName()
        ctx.pushResult(procedureDecl)
        false
        
      case o @ FunctionDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          names, paramProfile, isNotNullReturn, resultProfile, hasAbstract, aspectSpec, checks) =>
        val functionDecl = "Does Not Support Function Declaration: " +  o.getClass().getSimpleName()
        ctx.pushResult(functionDecl)
        false

      case o @ ProcedureBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          names, paramProfile, aspectSpec, bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>

        val astnum = factory.next_astnum
        val procbody_astnum = factory.next_astnum
        val m = handleSubprogramBody(sloc, names, paramProfile, bodyDecItems,
          bodyStatements, None, aspectSpec, bodyExceptionHandlers,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())
        val procedureBody = factory.buildProcedureBodyDeclaration(procbody_astnum, m.subprogramName, m.params, m.localVars, m.subprogramBody)
        // add to symbol table
        ctx.symboltable.insertProcedureDecl(m.subprogramName, procedureBody)
        
        ctx.pushResult(procedureBody)
        false
      case o @ FunctionBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          names, paramProfile, isNotNullReturn, resultProfile, aspectSpec,
          bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>

        val astnum = factory.next_astnum
        val fnbody_astnum = factory.next_astnum
        val m = handleSubprogramBody(sloc, names, paramProfile, bodyDecItems,
          bodyStatements, Some(resultProfile), aspectSpec, bodyExceptionHandlers,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())
        val functionBody = factory.buildFunctionBodyDeclaration(
            fnbody_astnum, m.subprogramName, m.returnType.get, m.params, m.localVars, m.subprogramBody)
        val functionBodyDecl = factory.buildProcedureBodyDeclarationWrapper(astnum, functionBody)
        // add to symbol table
        ctx.symboltable.insertProcedureDecl(m.subprogramName, functionBodyDecl)
        
        ctx.pushResult(functionBodyDecl)
        false
    }
  }
  
  // variable declaration, type declaration, procedure declaration and package declaration,
  // the last two declarations are translated separately;
  def otherDeclarationH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ VariableDeclarationEx(sloc, namesQl, hasAliasedQ, objDeclViewQ, initExpQ, aspectSpecQl, checks) =>
      val astnum = factory.next_astnum
      
      v(objDeclViewQ.getDefinition())
      val theType = ctx.popResult
      
      assert(namesQl.getDefiningNames().length == 1)
      v(namesQl.getDefiningNames().get(0))
      val x = ctx.popResult

      val optionalInitExp =
        if (ctx.isEmpty(initExpQ.getExpression())) {
          None
        } else {
          // if the initial expression is a binary or unary expression, 
          // it's represented as a function call in XML AST;
          val initExp = nameExprH(v)(initExpQ.getExpression())
          Some(initExp)
        }
      
      val result = factory.buildObjectDecl(astnum, x, theType, optionalInitExp)
      ctx.pushResult(result)
      
      // add to symbol table
      // ctx.symboltable.insertExpType(expAstNum, theType)
      
      false
    case o @ OrdinaryTypeDeclarationEx(sloc, namesQl, discriminantPartQ, typeDeclarationViewQ, aspectSpecificationsQl, checks) => 
      val astnum = factory.next_astnum
      v(namesQl.getDefiningNames().get(0))
      val typeName = ctx.popResult.asInstanceOf[String]
      val typeRef = namesQl.getDefiningNames().get(0).asInstanceOf[DefiningIdentifier].getDef()
      val typeDef = typeDeclarationViewQ.getDefinition()
      v(typeDef)
      val result = 
      typeDef match {
        case SignedIntegerTypeDefinitionEx(sloc, integerConstraintQ, checks) =>
          // e.g. type T is range 0 .. 10;
          val r = ctx.popResult.asInstanceOf[MList[Any]]
          val low = r(0)
          val upper = r(1)
          factory.buildIntegerTypeDecl(astnum, typeName, low, upper)
        case DerivedTypeDefinitionEx(sloc, hasAbstractQ, hasLimitedQ, parentSubtypeIndicationQ, checks) =>
          // e.g. type T1 is new Integer range 1 .. 10;
          val r = ctx.popResult.asInstanceOf[MList[Any]]
          val parentTypeName = r(0)
          val low = r(1)
          val upper = r(2)
          factory.buildDerivedTypeDecl(astnum, typeName, parentTypeName, low, upper)
        case RecordTypeDefinitionEx(sloc, hasAbstractQ, hasLimitedQ, recordDefinitionQ, checks) =>
          val fields = ctx.popResult.asInstanceOf[MList[Any]]
          factory.buildRecordTypeDecl(astnum, typeName, fields)
        case ConstrainedArrayDefinitionEx(sloc, discreteSubtypeDefinitionsQl, arrayComponentDefinitionQ, checks) =>
          val elements = ctx.popResult.asInstanceOf[MList[Any]]
          val componentType = elements(0)
          val indexSubtypeMark = elements(1)
          factory.buildArrayTypeDecl(astnum, typeName, componentType, indexSubtypeMark)
        case _ =>
          System.out.println("TODO: to deal with other OrdinaryTypeDeclaration !")
          "TODO: to deal with other OrdinaryTypeDeclaration !"
      }
      // add to symbol table: type name -> type declaration, type reference -> type reference name
      // e.g. type T is range 0 .. 10;
      // type name: T is represented by a natural number: (1 (*T*))
      // type reference: ada://ordinary_type/Binary_Search+1:11/T+3:9
      // type reference name: Integer_Type (1 (*T*))
      ctx.symboltable.insertTypeDecl(typeName, result)
      val typeRefName = factory.buildRefTypeMark(typeName, result)
      ctx.symboltable.insertRefName(typeRef, typeRefName)
      
      ctx.pushResult(result)
      false
    case o @ SubtypeDeclarationEx(sloc, namesQl, typeDeclarationViewQ, aspectSpecificationsQl, checks) =>
      val astnum = factory.next_astnum
      v(namesQl.getDefiningNames().get(0))
      val typeName = ctx.popResult.asInstanceOf[String]
      val typeRef = namesQl.getDefiningNames().get(0).asInstanceOf[DefiningIdentifier].getDef()
      val typeDef = typeDeclarationViewQ.getDefinition()
      v(typeDef)
      val result = 
      typeDef match {
        case SubtypeIndicationEx(sloc, hasAliasedQ, hasNullExclusionQ, subtypeMarkQ, subtypeConstraintQ, checks) =>
          // e.g. subtype T3 is Integer range 1 .. 10;
          val r = ctx.popResult.asInstanceOf[MList[Any]]
          val parentTypeName = r(0)
          val low = r(1)
          val upper = r(2)
          factory.buildSubtypeDecl(astnum, typeName, parentTypeName, low, upper)
        case _ =>
          System.out.println("TODO: to deal with other SubtypeDeclaration !")
          "TODO: to deal with other SubtypeDeclaration !"
      }
      // add to symbol table: subtype name -> subtype declaration, type reference -> type reference name
      ctx.symboltable.insertTypeDecl(typeName, result)
      val typeRefName = factory.buildRefTypeMark(typeName, result)
      ctx.symboltable.insertRefName(typeRef, typeRefName)
      
      ctx.pushResult(result)
      false
  }
  
  // array definition and record definition, which are used to declare array / record type
  def definitionH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ SignedIntegerTypeDefinitionEx(sloc, integerConstraintQ, checks) =>
      // e.g. type T is range 0 .. 10;
      val result = mlistEmpty[String]
      val range = integerConstraintQ.getRangeConstraint().asInstanceOf[SimpleExpressionRange]
      val low = range.getLowerBoundQ().getExpression().asInstanceOf[IntegerLiteral].getLitVal()
      val upper = range.getUpperBoundQ().getExpression().asInstanceOf[IntegerLiteral].getLitVal()
      result += low
      result += upper
      ctx.pushResult(result)
      false
    case o @ DerivedTypeDefinitionEx(sloc, hasAbstractQ, hasLimitedQ, parentSubtypeIndicationQ, checks) =>
      // e.g. type T1 is new Integer range 1 .. 10;
      val result = mlistEmpty[String]
      val subtypeIndication = parentSubtypeIndicationQ.getElement().asInstanceOf[SubtypeIndication]
      v(subtypeIndication.getSubtypeMarkQ().getExpression())
      val parent_subtype_mark = ctx.popResult
      val range = subtypeIndication.getSubtypeConstraintQ().getConstraint().asInstanceOf[SimpleExpressionRange]
      val low = range.getLowerBoundQ().getExpression().asInstanceOf[IntegerLiteral].getLitVal()
      val upper = range.getUpperBoundQ().getExpression().asInstanceOf[IntegerLiteral].getLitVal()
      result += parent_subtype_mark.asInstanceOf[String]
      result += low
      result += upper
      ctx.pushResult(result)
      false
    case o @ RecordTypeDefinitionEx(sloc, hasAbstractQ, hasLimitedQ, recordDefinitionQ, checks) =>
      val astnum = factory.next_astnum
      val fields = mlistEmpty[String]
      val record_def = recordDefinitionQ.getDefinition().asInstanceOf[RecordDefinition]
      val record_components = record_def.getRecordComponentsQl().getRecordComponents()
      for(record_component <- record_components){
        val component_decl = record_component.asInstanceOf[ComponentDeclaration]
        // DefiningIdentifier
        v(component_decl.getNamesQl().getDefiningNames().get(0))
        val name = ctx.popResult
        v(component_decl.getObjectDeclarationViewQ().getDefinition())
        val theType = ctx.popResult
        val field = factory.buildFieldDecl(name, theType)
        fields += field
      }
      // ctx.pushResult(factory.buildList(fields))
      ctx.pushResult(fields)
      false
    case o @ ConstrainedArrayDefinitionEx(sloc, discreteSubtypeDefinitionsQl, arrayComponentDefinitionQ, checks) =>
      val result = mlistEmpty[String]
      // TODO: to extend to nested array or multi-dimensional array
      // index type mark, e.g. type T is range 0 .. 10; type ArrayT is array(T) of Integer;
      val index_subtype_indication = discreteSubtypeDefinitionsQl.getDefinitions().get(0).asInstanceOf[DiscreteSubtypeIndicationAsSubtypeDefinition]
      // the following is for array of the form: type ArrayT is array (0 .. 10) of Integer;
      // val range = discreteSubtypeDefinitionsQl.getDefinitions().get(0).asInstanceOf[DiscreteSimpleExpressionRangeAsSubtypeDefinition]
      
      v(index_subtype_indication.getSubtypeMarkQ().getExpression())
      val index_subtype_mark = ctx.popResult.asInstanceOf[String]
            
      val componentTypeDef = arrayComponentDefinitionQ.getElement()
      v(componentTypeDef)
      val componentType = ctx.popResult.asInstanceOf[String]
      result += index_subtype_mark
      result += componentType
      ctx.pushResult(result)
      false
    case SubtypeIndicationEx(sloc, hasAliasedQ, hasNullExclusionQ, subtypeMarkQ, subtypeConstraintQ, checks) =>
      // subtype_indication is used to define subtype, e.g. subtype T3 is Integer range 1 .. 10, but it also
      // used to represent standard type or other user defined types, e.g. Integer, Boolean, where subtypeConstraintQ
      // is null, to declare variables;
      v(subtypeMarkQ.getExpression())
      val parent_subtype_mark = ctx.popResult.asInstanceOf[String]
      subtypeConstraintQ.getConstraint() match {
        case o @ SimpleExpressionRangeEx(sloc, lowerBoundQ, upperBoundQ, checks) =>
          val result = mlistEmpty[String]
          val low = lowerBoundQ.getExpression().asInstanceOf[IntegerLiteral].getLitVal()
          val upper = upperBoundQ.getExpression().asInstanceOf[IntegerLiteral].getLitVal()
          result += parent_subtype_mark
          result += low
          result += upper
          ctx.pushResult(result)
        case o @ NotAnElementEx(sloc) =>
          ctx.pushResult(parent_subtype_mark)
      }
      false
  }
  
  
  // translate the parameters of the procedures
  def parameterSpecificationH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ ParameterSpecificationEx(sloc, namesQl, hasAliasedQ, hasNullExclusionQ, objectDeclarationViewQ, initializationExpressionQ, mode, checks) =>
      assert(ctx.isEmpty(hasAliasedQ.getHasAliased()))
      assert(ctx.isEmpty(hasNullExclusionQ.getHasNullExclusion()))
      assert(ctx.isEmpty(initializationExpressionQ.getExpression()))

      val astnum = factory.next_astnum
      
      // (1) parameter type
      v(objectDeclarationViewQ.getDefinition())
      val paramType = ctx.popResult    
      
      // (2) parameter name
      assert(namesQl.getDefiningNames().length == 1)
      v(namesQl.getDefiningNames().get(0))
      val paramName = ctx.popResult
      
      // (3) parameter mode
      val paramMode = factory.buildMode(mode)
      
      val result = factory.buildParamSpecification(astnum, paramName, paramType, paramMode)
      ctx.pushResult(result) 
      false
  }

  /**
   * ProcedureBodyDeclaration /- body_declarative_items_ql: List[VariableDeclaration]
   */
  def definingIdentifierH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ DefiningIdentifierEx(sloc, defName, theDef, theType, checks) =>
      val result = factory.buildId(defName, theDef)
      ctx.pushResult(result)
      false
  }

  def statementH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ StatementListEx(statements) =>
      def buildSeq(stmts : java.util.List[Base]) : String = {
          assert(stmts.length > 0)
          val result =
            if (stmts.length == 1) {
              // for function, consider return statement
              v(stmts.head)
              ctx.popResult.asInstanceOf[String]
            } else {
              val seq_astnum = factory.next_astnum
              v(stmts.head)
              val stmt1 = ctx.popResult.asInstanceOf[String]
              val stmt2 = buildSeq(stmts.subList(1, stmts.length))
              factory.buildSeqStmt(seq_astnum, stmt1, stmt2)
            }
          result
        }
      val seq = buildSeq(statements)
      ctx.pushResult(seq)
      false
    case o @ AssignmentStatementEx(sloc, labelName, assignmentVariableName, assignmentExpression, checks) =>
      val astnum = factory.next_astnum
      v(assignmentVariableName.getExpression())
      val lhs = ctx.popResult
      val rhs = nameExprH(v)(assignmentExpression.getExpression())
      ctx.pushResult(factory.buildAssignStmt(astnum, lhs, rhs))
      false
    case o @ IfStatementEx(sloc, labelNames, statementPaths, checks) =>
      val astnum = factory.next_astnum
      var cond: Any = null
      var trueBranch: Any = null
      var falseBranch: Any = null
      statementPaths.getPaths().foreach {
        case IfPathEx(sloc, condExp, statements, checks) =>
          cond = nameExprH(v)(condExp.getExpression())
          v(statements)
          trueBranch = ctx.popResult
        case ElsePathEx(sloc, sequenceOfStatementsQl, checks) =>
          v(sequenceOfStatementsQl)
          falseBranch = ctx.popResult
        case x =>
          println("statementH: IfStatement need to be handled for " + x.getClass().getSimpleName())
      }
      val result = factory.buildIfStmt(astnum, cond, trueBranch, falseBranch)
      ctx.pushResult(result)
      false
    case o @ WhileLoopStatementEx(sloc, labelNames, statementIdentifier, whileCondition, loopStatements, checks) =>
      val astnum = factory.next_astnum
      val cond = nameExprH(v)(whileCondition.getExpression())
      v(loopStatements)
      val loopBody = ctx.popResult
      ctx.pushResult(factory.buildWhileStmt(astnum, cond, loopBody))
      false
    case o @ ProcedureCallStatementEx(sloc, labelName, calledName, callStatementParameters, isPrefixNotation, checks) =>
      val astnum = factory.next_astnum
      val p_astnum = factory.next_astnum
      val args = mlistEmpty[Any]
      v(calledName.getExpression())
      val p = ctx.popResult
      for (arg <- callStatementParameters.getAssociations()) {
        val e = arg.asInstanceOf[ParameterAssociation].getActualParameterQ().getExpression()
        args += nameExprH(v)(e)
      }
      val result = factory.buildProcedureCall(astnum, p_astnum, p, args)
      ctx.pushResult(result)
      false      
//    case o @ ImplementationDefinedPragmaEx(sloc, pragmaArgumentAssociationsQl, pragmaName, checks) =>
//      // ImplementationDefinedPragma: defines the user supplied loop invariant, which is an element of StatementList
//      pragmaName match {
//        case "Loop_Invariant" =>
//          val astnum = factory.next_astnum
//          v(pragmaArgumentAssociationsQl)
//          //TODO: now consider while loop with only one loop invariant
//          val hd = ctx.popResult.asInstanceOf[MList[Any]].head
//          val loopInvariantExp = hd.asInstanceOf[String]
//          ctx.pushResult(factory.buildLoopInvariantStmt(astnum, loopInvariantExp))
//          false
//        case _ =>
//          println("statementH: other pragmas need to be handled !")
//      }
//      false
//    case o @ ReturnStatementEx(sloc, labelNames, returnExp, checks) =>
//      assert(labelNames == null || labelNames.getDefiningNames().isEmpty())
//      val astnum = factory.next_astnum
//      v(returnExp)
//      // val re = getExpressionStr(ctx.popResult)
//      // TODO: 
//      val re = ctx.popResult.asInstanceOf[String]
//      ctx.pushResult(factory.buildReturnStmt(astnum, Some(re)))
//      false
//      case o =>
//        println("statementH: need to handle " + o.getClass().getSimpleName())
//        true
  }
  
  def expressionH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ IntegerLiteralEx(sloc, litVal, theType, checks) =>
      val astnum = factory.next_astnum
      // add to symbol table: expression ast number -> type id number
      ctx.symboltable.insertExpType(astnum, theType)
      ctx.symboltable.insertSloc(astnum, sloc)
      // litval could look like 3_500
      val literal = litVal.replaceAll("_", "") 
      val result = factory.buildLiteralExpr(astnum, theType, literal, checks)
      ctx.pushResult(result)
      false
    case o @ EnumerationLiteralEx(sloc, refName, ref, theType, checks) =>
      val astnum = factory.next_astnum
      // add to symbol table: expression ast number -> type id number
      ctx.symboltable.insertExpType(astnum, theType)
      ctx.symboltable.insertSloc(astnum, sloc)
      val result = factory.buildLiteralExpr(astnum, theType, refName, checks)
      ctx.pushResult(result)
      false
    case o @ IdentifierEx(sloc, refName, ref, theType, checks) =>
      // Identifier object is used to reference to either
      // - variable, parameter, record field, or 
      // - type name, or subtype / derived type name
      // - package/procedure name
      if (ref.contains("variable") || ref.contains("parameter") || ref.contains("component")) {
        val astnum = factory.next_astnum
        // add to symbol table: expression ast number -> type id number
        ctx.symboltable.insertExpType(astnum, theType)
        ctx.symboltable.insertSloc(astnum, sloc)
        val result = factory.buildIdExpr(astnum, theType, refName, ref, checks)
        ctx.pushResult(result) 
      } else if(ref.contains("ordinary_type") || ref.contains("subtype")) {
        // it's used as a type for a declared variable, or used as a parent type for 
        // declaring subtype and derived type; it can be standard integer, boolean type
        // or declared array / record / subtype;
        val result = 
        refName.toLowerCase() match {
          case "integer" => "Integer"
          case "boolean" => "Boolean"
          case _         => 
            val refTypeName = factory.buildId(refName, ref)
            val refTypeDecl = ctx.symboltable.getTypeDecl(refTypeName)
            assert(refTypeDecl.isDefined)
            factory.buildRefTypeMark(refTypeName, refTypeDecl.get)
        }
        ctx.pushResult(result)
      } else if(ref.contains("procedure")) {
        // it's used as a procedure call
        val result = factory.buildId(refName, ref)
        ctx.pushResult(result)
      } else {
        // TODO: to deal with other kind of identifier
        // - ref.contains("package_body")
        // - ...
        val result = "TODO: to deal with other kind of identifier !"
        ctx.pushResult(result)
      }
      false
    case o @ IndexedComponentEx(sloc, prefixQ, indexExpressionsQl, theType, checks) =>
      // prefixQ: ExpressionClass
      // indexExpressionsQl: ExpessionList
      val astnum = factory.next_astnum
      val x_astnum = factory.next_astnum
      // add to symbol table: expression ast number -> type id number
      ctx.symboltable.insertExpType(astnum, theType)
      ctx.symboltable.insertSloc(astnum, sloc)
      v(prefixQ)
      val x = ctx.popResult.asInstanceOf[org.stringtemplate.v4.ST].getAttribute("id").toString()
      // TODO: to extendit to nested array, now only consider one dimensional array
      assert(indexExpressionsQl.getExpressions().size() == 1)
      val index = indexExpressionsQl.getExpressions().get(0)
      val e = nameExprH(v)(index)
      val result = factory.buildIndexedComponent(astnum, x_astnum, x, e, checks)
      ctx.pushResult(result)
      false
    case o @ SelectedComponentEx(sloc, prefixQ, selectorQ, theType, checks) =>
      // prefixQ: ExpressionClass
      // selectorQ: ExpressionClass
      val astnum = factory.next_astnum
      val x_astnum = factory.next_astnum 
      // add to symbol table: expression ast number -> type id number
      ctx.symboltable.insertExpType(astnum, theType)
      ctx.symboltable.insertSloc(astnum, sloc)
      // TODO: to extend it to nested record
      v(prefixQ)
      val x = ctx.popResult.asInstanceOf[org.stringtemplate.v4.ST].getAttribute("id").toString()
      v(selectorQ)
      val f = ctx.popResult.asInstanceOf[org.stringtemplate.v4.ST].getAttribute("id").toString()
      val result = factory.buildSelectedComponent(astnum, x_astnum, x.toString, f, checks)
      ctx.pushResult(result)
      false
    case o @ FunctionCallEx(sloc, prefixQ, functionCallParameters, isPrefixCall, isPrefixNotation, theType, checks) =>
      val astnum = factory.next_astnum
      // add to symbol table: expression ast number -> type id number
      ctx.symboltable.insertExpType(astnum, theType)
      ctx.symboltable.insertSloc(astnum, sloc)
      // import scala.collection.JavaConversions.asScalaBuffer
      // to do implicit conversion between Java collection and scala collection
      // scala.collection.mutable.Buffer <=> java.util.List
      if (ctx.isBinaryOp(prefixQ)) {
        assert(functionCallParameters.getAssociations().length == 2)
        val e1 = functionCallParameters.getAssociations()(0).asInstanceOf[ParameterAssociation].getActualParameterQ().getExpression()
        val e2 = functionCallParameters.getAssociations()(1).asInstanceOf[ParameterAssociation].getActualParameterQ().getExpression()
        val loperand = nameExprH(v)(e1)
        val roperand = nameExprH(v)(e2)
        val bexp = factory.buildBinaryExpr(astnum, theType, ctx.getBinaryOp(prefixQ).get, loperand, roperand, checks)
        ctx.pushResult(bexp)
      } else if (ctx.isUnaryOp(prefixQ)) {
        assert(functionCallParameters.getAssociations().length == 1)
        val e = functionCallParameters.getAssociations()(0).asInstanceOf[ParameterAssociation].getActualParameterQ().getExpression()
        val operand = nameExprH(v)(e)
        val uexp = factory.buildUnaryExpr(astnum, theType, ctx.getUnaryOp(prefixQ).get, operand, checks)
        ctx.pushResult(uexp)
      } else {
        println("expressionH: need to handle other Function Call Expression !")
      }
      false
//  case o =>
//    println("expressionH: need to handle: " + o.getClass.getSimpleName)
//    true
  }
  
  // name expression used as right hand expression
  def nameExprH(v : => BVisitor) : Any --> String = {
    case o @ IdentifierEx(sloc, refName, ref, theType, checks) =>
      val astnum = factory.next_astnum
      // add to symbol table: expression ast number -> type id number
      ctx.symboltable.insertExpType(astnum, theType)
      ctx.symboltable.insertSloc(astnum, sloc)
      v(o)
      factory.buildNameExp(astnum, theType, ctx.popResult, null)
    case o @ IndexedComponentEx(sloc, prefixQ, indexExpressionsQl, theType, checks) =>
      val astnum = factory.next_astnum
      // add to symbol table: expression ast number -> type id number
      ctx.symboltable.insertExpType(astnum, theType)
      ctx.symboltable.insertSloc(astnum, sloc)
      v(o)
      factory.buildNameExp(astnum, theType, ctx.popResult, null)
    case o @ SelectedComponentEx(sloc, prefixQ, selectorQ, theType, checks) =>
      val astnum = factory.next_astnum
      // add to symbol table: expression ast number -> type id number
      ctx.symboltable.insertExpType(astnum, theType)
      ctx.symboltable.insertSloc(astnum, sloc)
      v(o)
      factory.buildNameExp(astnum, theType, ctx.popResult, null)
    case o =>
      v(o)
      ctx.popResult.asInstanceOf[String]
  }

  def associationListH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ AssociationListEx(associations) =>
      val result = mlistEmpty[Any]
      for (association <- associations) {
        v(association)
        result += ctx.popResult
      }
      ctx.pushResult(result)
      false
  }

  def pragmaArgumentAssociationH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ PragmaArgumentAssociationEx(sloc, formalParameter, actualParameter, checks) =>
      v(actualParameter)
      false
  }

  def everythingElseH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o if (o != null) =>
      //println("everythingElseH " + o.getClass.getSimpleName)
      true
    case null =>
      println("everythingElseH: it is null")
      assert(false)
      false
  }

  def theVisitor : BVisitor = visit
  val ctx = new Context {}

  val visit = Visitor.build(
    Visitor.first(
      ivector(
        packageDeclarationH(ctx, theVisitor),
        subprogramDeclarationH(ctx, theVisitor),
        otherDeclarationH(ctx, theVisitor),
        definitionH(ctx, theVisitor),
        definingIdentifierH(ctx, theVisitor),
        parameterSpecificationH(ctx, theVisitor),
        statementH(ctx, theVisitor),
        expressionH(ctx, theVisitor),
        associationListH(ctx, theVisitor),
        pragmaArgumentAssociationH(ctx, theVisitor),
        everythingElseH(ctx, theVisitor)
      )))

  import org.sireum.option.ProgramTarget
  def getProgramTranslatorSTG(o : ProgramTarget.Type) = {
    (o : @unchecked) match {
      case ProgramTarget.Ocaml =>
        new STGroupFile(getClass.getResource(TypeNameSpace.ProgramTransTemplate_OCaml), "UTF-8", '$', '$')
      case ProgramTarget.Coq =>
        new STGroupFile(getClass.getResource(TypeNameSpace.ProgramTransTemplate_Coq), "UTF-8", '$', '$')
    }
  }
  
  def buildSymbolTable(st: SymbolTable, stg: STGroupFile): String = {
    val result = stg.getInstanceOf("symbolTable")
    
    val vars = st.getVarTypeMap
    val procs = st.getProcDeclMap
    val types = st.getTypeDeclMap
    val exps = st.getExpTypeMap
    val slocs = st.getSlocMap
    
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
      val sloc = factory.buildSourceLocation(x._2.getLine, x._2.getCol, x._2.getEndline, x._2.getEndcol)
      sloc_element.add("x", x._1).add("y", sloc)
      result.add("slocs", sloc_element)
    }    
    
    result.render()
  }
  
  val COQ_AST_ID = "Coq_AST_Tree_XX"
  val SYMBOL_TABLE_ID = "Symbol_Table_XX"  

  val t = this.jagoProgramTarget
  assert(t == ProgramTarget.Coq || t == ProgramTarget.Ocaml)

  val stg = getProgramTranslatorSTG(t)
  val factory = new Factory(stg)


  // for multiple source files, do translation one by one  
  
  // now only allow one .ads file and one .adb file, otherwise there will be
  // name conflicts, as the spark subset we have formalized in Coq is still
  // quite small, and in order to be accepted by Coq type check, we put together
  // declared items in .ads and .adb together connected with constructor: D_Seq_Declaration;
  // and .ads file should be analyzed first, otherwise the identifiers used 
  // in .adb may not be found;
  val seqDeclAstNums = mlistEmpty[Int]
  seqDeclAstNums += factory.next_astnum
  this.parseGnat2XMLresults.foreach{
    case (key, value) if (key.endsWith(".ads")) =>
      visit(value)
    case _ =>
  }

  this.parseGnat2XMLresults.foreach{
    case (key, value) if (key.endsWith(".adb")) =>
      visit(value)
    case _ =>
  }
  
  val coq_ast_tree = factory.buildDefinition(COQ_AST_ID, this.handSeqDeclarations(ctx.results, seqDeclAstNums))
  val symbol_table = factory.buildDefinition(SYMBOL_TABLE_ID, buildSymbolTable(ctx.symboltable, stg))
  
  val ret = mlistEmpty[String]
  ret += coq_ast_tree
  ret += symbol_table
  
  // store the program translation results as PipelineJob's properties
  // so the result can be used by the following pipeline modules  
  this.jagoProgramResults = ret.toList
}

