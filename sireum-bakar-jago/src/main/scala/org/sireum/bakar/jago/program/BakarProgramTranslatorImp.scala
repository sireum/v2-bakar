package org.sireum.bakar.jago.program

import org.sireum.pipeline._
import org.sireum.bakar.xml._
import org.sireum.util._
import scala.collection.JavaConversions.asScalaBuffer
import org.sireum.bakar.jago.util.Factory
import org.sireum.bakar.jago.util.TranslatorUtil
import org.stringtemplate.v4.STGroupFile
import org.sireum.bakar.jago.util.TypeNameSpace

class BakarProgramTranslatorModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarProgramTranslatorModule {

  // add implementation here
  // Here we implement the translation from SPARK XML AST tree to Coq value
  // - Bakar2CoqTranslatorConfig generate Bakar2CoqTranslatorModuleCore
  // - Bakar2CoqTranslatorModuleCore is a general framework that's common for all the translation project
  // - Bakar2CoqTranslatorImp implements our specific translation from SPARK XML AST tree to Coq, and it's called in Bakar2CoqTranslatorModuleCore
  type BVisitor = Any => Boolean

  final case class MethodClass(
      mname : String,
      returnType : Option[String],
      aspectSpecs : MList[String],
      params : MList[String],
      localVars : String,
      mbody : String)  
  
  trait Context {
    val results = mlistEmpty[String]
    var result : Any = null

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
      // println("packageH: " + o.getClass().getSimpleName())

      false
    case o @ PackageBodyDeclarationEx(sloc, names, aspectSpec,
      bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>

//    assert(bodyExceptionHandlers.getExceptionHandlers().isEmpty())
//    assert(names.getDefiningNames().length == 1)
      val pkgbody_astnum = factory.next_astnum
      // val pname = names.getDefiningNames.get(0).asInstanceOf[DefiningIdentifier].getDefName()
      val pkgname = names.getDefiningNames.get(0)
      v(pkgname)
      val pkgBodyName = ctx.popResult.asInstanceOf[String]

      declarativePartH(ctx, v, bodyDecItems)
      val pkgBodyDecl = ctx.popResult
      ctx.pushResult(pkgBodyDecl)

      false
  }
  
  def declarativePartH(ctx : Context, v : => BVisitor, ld: org.sireum.bakar.xml.ElementList) = {
    // declared items, e.g. variables, array/record types, or procedures
   
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
    
    val it = ld.getElements().iterator()
    val declIds = mlistEmpty[String]
    val seqDeclAstNums = mlistEmpty[Int]
    while (it.hasNext()){
      val declItem = it.next()
      if(it.hasNext()) {
        seqDeclAstNums += factory.next_astnum
      }
      val decl_astnum = factory.next_astnum
      v(declItem)
      val declItemAST = ctx.popResult.asInstanceOf[String]
      declIds += factory.buildDeclaration(decl_astnum, declItemAST)
    }
    val declItems = handSeqDeclarations(declIds, seqDeclAstNums)
    ctx.pushResult(declItems)
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
        val mname = ctx.popResult.asInstanceOf[String]
        
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
        declarativePartH(ctx, v, bodyDeclItems)
        val declItems = ctx.popResult.asInstanceOf[String]
        
        // [5] method body
        v(bodyStatements)
        val mbody = ctx.popResult.asInstanceOf[String]

        // [6] method aspect specification, for example, Pre and Post  
        val specs = mlistEmpty[String]
        
        // [7] return
        MethodClass(mname, returnType, specs, params, declItems, mbody)
      }

    {
      case o @ ProcedureDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          name, paramProfile, hasAbstract, aspectSpec, checks) =>
        println("Cannot Handle Procedure Declaration: " + o.getClass().getSimpleName())
        true
      case o @ FunctionDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          names, paramProfile, isNotNullReturn, resultProfile, hasAbstract, aspectSpec, checks) =>
        println("Cannot Handle Procedure Declaration: " +  o.getClass().getSimpleName())
        true

      case o @ ProcedureBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          names, paramProfile, aspectSpec, bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>

        val astnum = factory.next_astnum
        val procbody_astnum = factory.next_astnum
        val m = handleSubprogramBody(sloc, names, paramProfile, bodyDecItems,
          bodyStatements, None, aspectSpec, bodyExceptionHandlers,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())
        val procedureBody = factory.buildProcedureBodyDeclaration(procbody_astnum, m.mname, m.aspectSpecs, m.params, m.localVars, m.mbody)
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
            fnbody_astnum, m.mname, m.returnType.get, m.aspectSpecs, m.params, m.localVars, m.mbody)
        val functionBodyDecl = factory.buildProcedureBodyDeclarationWrapper(astnum, functionBody)
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
      false
    case o @ OrdinaryTypeDeclarationEx(sloc, namesQl, discriminantPartQ, typeDeclarationViewQ, aspectSpecificationsQl, checks) => 
      val astnum = factory.next_astnum
      v(namesQl.getDefiningNames().get(0))
      val typeName = ctx.popResult
      val typeDef = typeDeclarationViewQ.getDefinition()
      v(typeDef)
      val result = 
      typeDef match {
        case RecordTypeDefinitionEx(sloc, hasAbstractQ, hasLimitedQ, recordDefinitionQ, checks) =>
          val fields = ctx.popResult.asInstanceOf[MList[Any]]
          factory.buildRecordTypeDecl(astnum, typeName, fields)
        case ConstrainedArrayDefinitionEx(sloc, discreteSubtypeDefinitionsQl, arrayComponentDefinitionQ, checks) =>
          val elements = ctx.popResult.asInstanceOf[MList[Any]]
          val componentType = elements(0)
          val low = elements(1)
          val upper = elements(2)
          factory.buildArrayTypeDecl(astnum, typeName, componentType, low, upper)
      }
      ctx.pushResult(result)
      false
  }
  
  // array definition and record definition, which are used to declare array / record type
  def definitionH(ctx : Context, v : => BVisitor) : VisitorFunction = {
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
      val range = discreteSubtypeDefinitionsQl.getDefinitions().get(0).asInstanceOf[DiscreteSimpleExpressionRangeAsSubtypeDefinition]
      // TODO: now its lower and upper bound are all literals
      val low = range.getLowerBoundQ().getExpression().asInstanceOf[IntegerLiteral].getLitVal()
      val upper = range.getUpperBoundQ().getExpression().asInstanceOf[IntegerLiteral].getLitVal()
      
      val componentType = arrayComponentDefinitionQ.getElement()
      v(componentType)
      val theType = ctx.popResult.asInstanceOf[String]
      result += theType.toString()
      result += low
      result += upper
      ctx.pushResult(result)
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
//    case varDecl @ VariableDeclarationEx(sloc, namesQl, hasAliasedQ, objDeclViewQ, initExpQ, aspectSpecQl, checks) =>
//      //val theType = util_GetTypeFromObjDeclViewQ(objDeclViewQ)
//      v(objDeclViewQ.getDefinition())
//      val theType = ctx.popResult.asInstanceOf[String]
//      val astnum = factory.next_astnum
//      val declItems = mlistEmpty[String]
//      for (defName <- namesQl.getDefiningNames()) {
//        v(defName)
//        declItems += ctx.popResult.asInstanceOf[String]
//      }
//
//      val optionalInitExp =
//        if (ctx.isEmpty(initExpQ.getExpression())) {
//          None
//        } else {
//          // if the initial expression is a binary or unary expression, 
//          // it's represented as a function call in XML AST;
//          val initExp = nameExprH(v)(initExpQ.getExpression())
//          Some(initExp)
//        }
//
//      ctx.pushResult(factory.buildObjectDecl(astnum, declItems, theType, optionalInitExp))
//      false
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
      // litval could look like 3_500
      val literal = litVal.replaceAll("_", "") 
      val result = factory.buildLiteralExpr(factory.next_astnum, theType, literal, checks)
      ctx.pushResult(result)
      false
    case o @ EnumerationLiteralEx(sloc, refName, ref, theType, checks) =>
      val result = factory.buildLiteralExpr(factory.next_astnum, theType, refName, checks)
      ctx.pushResult(result)
      false
    case o @ IdentifierEx(sloc, refName, ref, theType, checks) =>
      // Identifier object is used to reference to either
      // - variable, parameter, record field, or 
      // - type name, or
      // - package/procedure name
      if (ref.contains("variable") || ref.contains("parameter") || ref.contains("component")) {
        val result = factory.buildIdExpr(factory.next_astnum, theType, refName, ref, checks)
        ctx.pushResult(result) 
      } else if(ref.contains("ordinary_type")) {
        // it's used as a type for a declared variable
        val result = factory.buildRefType(refName, ref)
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
        println("expressionH: need to handle Function Call Expression !")
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
      v(o)
      factory.buildNameExp(astnum, theType, ctx.popResult, null)
    case o @ IndexedComponentEx(sloc, prefixQ, indexExpressionsQl, theType, checks) =>
      val astnum = factory.next_astnum
      v(o)
      factory.buildNameExp(astnum, theType, ctx.popResult, null)
    case o @ SelectedComponentEx(sloc, prefixQ, selectorQ, theType, checks) =>
      val astnum = factory.next_astnum
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

  val t = this.jagoProgramTarget
  assert(t == ProgramTarget.Coq || t == ProgramTarget.Ocaml)

  val stg = getProgramTranslatorSTG(t)
  val factory = new Factory(stg)

  //println(this.parseGnat2XMLresults)

  // for multiple source files, do translation one by one
  this.parseGnat2XMLresults.foreach {
    case (key, value) => {
      visit(value)
    }
  }
  // store the program translation results as PipelineJob's properties
  // so the result can be used by the following pipeline modules  
  this.jagoProgramResults = ctx.getResults.toList
}

