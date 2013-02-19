package org.sireum.bakar.jago.module

import org.sireum.pipeline._
import org.sireum.bakar.xml._
import org.sireum.util._
import scala.collection.JavaConversions.asScalaBuffer
import org.sireum.bakar.jago.util.Factory._
import org.sireum.bakar.jago.util.TranslatorUtil
import org.sireum.bakar.jago.util.Factory

/** 
  * The following class will be called reflectively in Bakar2CoqTranslatorModuleCore.  
  */
class BakarTranslatorDef (val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarTranslatorModule {
  // add implementation here
  // Here we implement the translation from SPARK XML AST tree to Coq value
  // - Bakar2CoqTranslatorConfig generate Bakar2CoqTranslatorModuleCore
  // - Bakar2CoqTranslatorModuleCore is a general framework that's common for all the translation project
  // - Bakar2CoqTranslatorImp implements our specific translation from SPARK XML AST tree to Coq, and it's called in Bakar2CoqTranslatorModuleCore
  type BVisitor = Any => Boolean
  
  trait Context {
    var result: String = null
    
    def pushResult(o: String) {
      result = o;
    }
    
    def popResult = {
      val t = result
      result = null
      t
    }
    
    def isEmpty(o : Base) : Boolean = o.isInstanceOf[NotAnElement]
    
    def isUnaryOp(o: Any) = getUnaryOp(o).isDefined
    
    def getUnaryOp(o: Any): scala.Option[String] = {
      if(!o.isInstanceOf[ExpressionClass]) {
        return None
      }
      val x = o.asInstanceOf[ExpressionClass].getExpression().asInstanceOf[Any]
      x match {
        case UnaryMinusOperatorEx(_) => Some("Onegint")
        case UnaryPlusOperatorEx(_)  => Some("Oposint")
        // case NotOperatorEx(_)        => Some("NotExp")
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
        case AndOperatorEx(_)                => Some("Oand")
        case OrOperatorEx(_)                 => Some("Oor")
        case XorOperatorEx                   => Some("Oxor")

        case EqualOperatorEx(_)              => Some("Ceq")
        case GreaterThanOperatorEx(_)        => Some("Cgt")
        case GreaterThanOrEqualOperatorEx(_) => Some("Cge")
        case LessThanOperatorEx(_)           => Some("Clt")
        case LessThanOrEqualOperatorEx(_)    => Some("Cle")
        case NotEqualOperatorEx(_)           => Some("Cne")

        case DivideOperatorEx(_)             => Some("Odiv")
        case MinusOperatorEx(_)              => Some("Osub")
        case MultiplyOperatorEx(_)           => Some("Omul")
        case PlusOperatorEx(_)               => Some("Oadd")
//        case RemOperatorEx(_)                => Some("ARem")
//        case ModOperatorEx                   => Some("AMod")
        case _ =>
          None
      }
    }
  }
  
def packageH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ CompilationUnitEx(
      sloc,
      contextClauseElements,
      unitDeclaration,
      pragmasAfter,
      unitKind,
      unitClass,
      unitOrigin,
      unitFullName,
      defName,
      sourceFile) =>
      if (!contextClauseElements.getContextClauses().isEmpty)
        Console.err.println("Need to handle context clauses")
      // [1] Package Declaration
        
      // [2] Package Body  
      if(unitKind == "A_Package_Body"){
        // Notice: the position of the following command will affect the increasing order of ast number labeled for each ast
        val astnum = factory.buildAstMappingTable(sloc, None)
        v(unitDeclaration)
        val unitDecl = ctx.popResult
        val cu = factory.buildCompilationUnit(astnum, unitDecl)  
        
        // store the program translation results as PipelineJob's properties
        // so the result can be used by the following pipeline modules
        this.results_=(Seq[String](cu))         
      }

      false
    case o @ PackageDeclarationEx(sloc, names, aspectSpec,
      visiblePartDecItems, privatePartDecItems) =>
      // println("packageH: " + o.getClass().getSimpleName())

      false
    case o @ PackageBodyDeclarationEx(sloc, names, aspectSpec,
      bodyDecItems, bodyStatements, bodyExceptionHandlers) =>

      assert(bodyExceptionHandlers.getExceptionHandlers().isEmpty())
      assert(names.getDefiningNames().length == 1)
      val unit_astnum = factory.buildAstMappingTable(sloc, None)
      val pkgbody_astnum = factory.buildAstMappingTable(sloc, None)
      // val pname = names.getDefiningNames.get(0).asInstanceOf[DefiningIdentifier].getDefName()
      val pkgname = names.getDefiningNames.get(0)
      v(pkgname)
      val pkgBodyName = ctx.popResult
      
      val pkgElems = mlistEmpty[String]
      TranslatorUtil.getTypeDeclarations(bodyDecItems)
      
      if (!aspectSpec.getElements().isEmpty())
        Console.err.println("Need to handle package body aspect clauses")
      if (!bodyStatements.getStatements.isEmpty)
        Console.err.println("Need to handle package body statements")

      for (m <- TranslatorUtil.getMethodDeclarations(bodyDecItems)) {
        v(m)
        pkgElems += ctx.popResult
      }
      val pkgBodyAspectSpecs = mlistEmpty[String]
      val pkgBodyDecl = factory.buildPackageBody(pkgbody_astnum, pkgBodyName, pkgBodyAspectSpecs, pkgElems:_*)
      //
      
      val packageUnit = factory.buildUnitDeclaration(unit_astnum, "PackageBodyDecl", pkgBodyDecl)
      ctx.pushResult(packageUnit)

      false
  }

  def methodH(ctx : Context, v : => BVisitor) : VisitorFunction = {
      def handleMethodBody(sloc : SourceLocation,
                           names : DefiningNameList,
                           paramProfile : ParameterSpecificationList,
                           bodyDeclItems : ElementList,
                           bodyStatements : StatementList,
                           resultProfile : Option[ElementClass],
                           aspectSpecs : ElementList,
                           exceptionHandlerList : ExceptionHandlerList,
                           isOverridingDec : Base,
                           isNotOverridingDec : Base) = {

        assert(exceptionHandlerList.getExceptionHandlers().isEmpty())
        assert(ctx.isEmpty(isOverridingDec))
        assert(ctx.isEmpty(isNotOverridingDec))
        
        assert(names.getDefiningNames().length == 1)
        // [1] method name
        // val mname = names.getDefiningNames().get(0).asInstanceOf[DefiningIdentifier].getDefName()
        v(names.getDefiningNames().get(0))
        val mname = ctx.popResult
        // [2] return type
        val returnType : Option[String] = resultProfile match {
          case Some(e) =>
            v(e)
            val ne = ctx.popResult
            Some(ne)
          case None => None
        }
        // [3] method parameters
        val params = mlistEmpty[String]
        for(p <- paramProfile.getParameterSpecifications()) {
          p match {
          case ps @ ParameterSpecificationEx(sloc, pnames, _hasAliased, _hasNullEx,
            objDecView, _initExpr, mode) =>
            // e.g (I : Integer) or (I, J : 
            assert(ctx.isEmpty(_hasAliased.getHasAliased()))
            assert(ctx.isEmpty(_hasNullEx.getHasNullExclusion()))
            assert(ctx.isEmpty(_initExpr.getExpression()))
            // [2-1] parameter type
            val paramType = objDecView.getDefinition() match {
              case id @ IdentifierEx(sloc, refName, ref, type_) =>
                Some(ref)
              case _ =>
                None
            }
            assert(paramType.isDefined)
            // [2-2] parameter initialization
            val initExp: Option[String] = 
              if(ctx.isEmpty(_initExpr)) {
                None
              }else{
                v(_initExpr)
                Some(ctx.popResult)
              }
            // [2-3] parameter names of the same type and mode
            val paramlist = mlistEmpty[String]
            pnames.getDefiningNames().foreach {
              case DefiningIdentifierEx(sloc, defName, theDef, theType) => 
                val pnm = factory.buildId(paramType, theDef, defName)
                paramlist += pnm
              case x =>
                println("Not expecting: " + x)
                assert(false)
            }
            val astnum = factory.buildAstMappingTable(sloc, None)
            val paramDecl = factory.buildParamSpecification(astnum, paramlist, paramType.get, factory.buildMode(mode), initExp)
            params += paramDecl
          case x =>
            println("Not expecting: " + x)
            assert(false)
          }
        }     
        // [4] declared local variables inside the method
        val defingIds = mlistEmpty[String]
        for(declItem <- bodyDeclItems.getElements()) {
          v(declItem)
          defingIds += ctx.popResult
        }
        // [5] method body
        v(bodyStatements)
        val mbody = ctx.popResult

        // [6] method aspect specification, for example, Pre and Post  
        val specs = mlistEmpty[String]
        // [7] return
        MethodClass(mname, returnType, specs, params, defingIds, mbody)
      }

    {
      case o @ ProcedureDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        name, paramProfile, hasAbstract, aspectSpec) =>
        println(o.getClass().getSimpleName())
        true
      case o @ FunctionDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, isNotNullReturn, resultProfile, hasAbstract, aspectSpec) =>
        println(o.getClass().getSimpleName())
        true

      case o @ ProcedureBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, aspectSpec, bodyDecItems, bodyStatements, bodyExceptionHandlers) =>

        val method_astnum = factory.buildAstMappingTable(sloc, None)  
        val procbody_astnum = factory.buildAstMappingTable(sloc, None)  
        val m = handleMethodBody(sloc, names, paramProfile, bodyDecItems,
          bodyStatements, None, aspectSpec, bodyExceptionHandlers,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())
        val procedureBody = factory.buildProcedureBody(procbody_astnum, m.mname, m.aspectSpecs, m.params, m.localIdents, m.mbody)
        val annotation = Some("Procedure")
        
        val result = factory.buildSubProgram(method_astnum, "Sproc", procedureBody, annotation)
        ctx.pushResult(result)

        false
      case o @ FunctionBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, isNotNullReturn, resultProfile, aspectSpec,
        bodyDecItems, bodyStatements, bodyExceptionHandlers) =>

        // TODO: should use: factory.buildAstMappingTable(sloc, ReturnType)          
        val method_astnum = factory.buildAstMappingTable(sloc, None)  
        val fnbody_astnum = factory.buildAstMappingTable(sloc, None)            
        val m = handleMethodBody(sloc, names, paramProfile, bodyDecItems,
          bodyStatements, Some(resultProfile), aspectSpec, bodyExceptionHandlers,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())
        val functionBody = factory.buildFunctionBody(fnbody_astnum, m.mname, m.returnType.get, m.aspectSpecs, m.params, m.localIdents, m.mbody)
        val annotation = Some("Function")
        
        val result = factory.buildSubProgram(method_astnum, "Sfunc", functionBody, annotation)
        ctx.pushResult(result)

        false
    }
  }
  
  def definingIdentifier(ctx: Context, v: => BVisitor): VisitorFunction = { 
    case varDecl @ VariableDeclarationEx(sloc, namesQl, hasAliasedQ, objDeclViewQ, initExpQ, aspectSpecQl) =>
      val theType = util_GetTypeFromObjDeclViewQ(objDeclViewQ)
      val astnum = factory.buildAstMappingTable(sloc, None) 
      val declItems = mlistEmpty[String]
      for(defName <- namesQl.getDefiningNames()){
        v(defName)
        declItems += ctx.popResult
      }
      
      val optionalInitExp = 
        if(ctx.isEmpty(initExpQ.getExpression())){
          None
        }else{
          v(initExpQ.getExpression())
          Some(ctx.popResult)
        }

      ctx.pushResult(factory.buildIdentiferDecl(astnum, declItems, theType.get, optionalInitExp))
      false
  }
  
  def statementH(ctx: Context, v: => BVisitor): VisitorFunction = {
    case o @ StatementListEx(statements) =>
      import scala.collection.JavaConversions._
      val seq: String = unit_trans_seq(statements, v)
      ctx.pushResult(seq) 
      false
    case o @ AssignmentStatementEx(sloc, labelName, assignmentVariableName, assignmentExpression) =>
      val astnum = factory.buildAstMappingTable(sloc, None)
      v(assignmentVariableName)
      val lhs = ctx.popResult.asInstanceOf[String]
      v(assignmentExpression)
      val rhs = ctx.popResult.asInstanceOf[String]
      val rhs_exp = factory.buildIdentifierExpr(sloc, rhs)
      ctx.pushResult(factory.buildAssignStmt(astnum, lhs, rhs_exp))
      false
    case o @ ProcedureCallStatementEx(sloc, labelName, calledName, callStatementParameters, isPrefixNotation) =>
      v(calledName)
      val procName = ctx.popResult
      val params = mlistEmpty[String]
      for(param <- callStatementParameters.getAssociations()) {
        v(param)
        params += ctx.popResult
      }
      ctx.pushResult(factory.buildProcedureCall(procName, params: _*)) 
      false
    case o @ IfStatementEx(sloc, labelNames, statementPaths) =>
      statementPaths.getPaths().foreach {
        case IfPathEx(sloc, condExp, statements) =>
          val astnum = factory.buildAstMappingTable(sloc, None)
          v(condExp)
          val cond = ctx.popResult.asInstanceOf[String]
          v(statements)
          val thenBranch = ctx.popResult.asInstanceOf[String]
          ctx.pushResult(factory.buildIfStmt(astnum, cond, thenBranch))
        case x =>
          println("statementH: IfStatement need to be handled for " + x.getClass().getSimpleName())
      }
      
      false
    case o @ WhileLoopStatementEx(sloc, labelNames, statementIdentifier,
      whileCondition, loopStatements) =>
      val astnum = factory.buildAstMappingTable(sloc, None)
      v(whileCondition)
      val cond = ctx.popResult.asInstanceOf[String]
      v(loopStatements)
      val loopBody = ctx.popResult.asInstanceOf[String]
      // TODO: extract the loop invariant from the While Statement
      val loopInv = factory.buildOptionV(None) 
      ctx.pushResult(factory.buildWhileStmt(astnum, cond, loopInv, loopBody))
      false
//    case o =>
//      println("statementH: need to handle " + o.getClass().getSimpleName())
//      true
  }
  
  def expressionH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ IntegerLiteralEx(sloc, litVal, theType) =>
      // litval could look like 3_500
      val v = litVal.replaceAll("_", "")
      val astnum = factory.buildAstMappingTable(sloc, Some(theType))
      ctx.pushResult(factory.buildConstantExpr(astnum, theType, v))
      false
    case o @ IdentifierEx(sloc, refName, ref, theType) =>
      // identifier can be variable name or package/procedure name, <theType> is null if it's function name
      assert(theType != null)
      ctx.pushResult(factory.buildId(Some(theType), ref, refName))
      false
    case o @ FunctionCallEx(sloc, prefixQ, functionCallParameters, isPrefixCall, isPrefixNotation, theType) =>
      val astnum = factory.buildAstMappingTable(sloc, Some(theType))
      val plist = mlistEmpty[String]
      // import scala.collection.JavaConversions.asScalaBuffer
      // to do implicit conversion between Java collection and scala collection
      // scala.collection.mutable.Buffer <=> java.util.List
      for(param <- functionCallParameters.getAssociations) {
        v(param)
        plist += factory.buildIdentifierExpr(sloc, ctx.popResult)
      }
      
      if(ctx.isBinaryOp(prefixQ)) {
        assert(plist.length == 2)
        val loperand = plist(0)
        val roperand = plist(1)
        val bexp = factory.buildBinaryExpr(astnum, ctx.getBinaryOp(prefixQ).get, loperand, roperand)
        ctx.pushResult(bexp)
      }else if(ctx.isUnaryOp(prefixQ)) {
        assert(plist.length == 1)
        val operand = plist(0)
        val uexp = factory.buildUnaryExpr(astnum, ctx.getUnaryOp(prefixQ).get, operand)
        ctx.pushResult(uexp)
      }else {
        println("expressionH: need to handle Function Call Expression !")
      }
      false
//    case o =>
//      println("expressionH: need to handle: " + o.getClass.getSimpleName)
//      true
  } 
  
  def nameH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ IdentifierEx(sloc, refName, ref, theType) =>
      val theTyp = if(theType == "null") None else Some(theType)
      ctx.pushResult(factory.buildId(theTyp, ref, refName)) 
      false
    case o @ DefiningIdentifierEx(sloc, defName, theDef, theType) =>
      val theTyp = if(theType == "null") None else Some(theType)
      ctx.pushResult(factory.buildId(theTyp, theDef, defName))
      false
//    case o @ SelectedComponentEx(sloc, prefix, selector, theType) =>
//
//      false
    case o =>
      //println("nameH: need to handle: " + o.getClass().getSimpleName())
      true
  }  
  
  def everythingElseH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o if (o != null) =>
      println("everythingElseH " + o.getClass.getSimpleName)
      true
    case null =>
      println("everythingElseH: it is null")
      assert(false)
      false
  }
  
  def util_GetTypeFromObjDeclViewQ(objDeclViewQ: DefinitionClass) = {
    objDeclViewQ.getDefinition() match {
      case sti @ SubtypeIndicationEx(sloc, hasAliasedQ, hasNullExclusionQ, subtypeMarkQ, subtypeConstraintQ) =>
        subtypeMarkQ.getExpression() match {
          case id @ IdentifierEx(sloc, refName, ref, type_) =>
            Some(ref)
          case _ =>
            None
        }
      case _ =>
        None
    }
  }  

  def unit_trans_seq(stmts: MBuffer[Base], v: => BVisitor): String = {
    var result: String = null
    if(!stmts.isEmpty){
      if(stmts.length == 1){
        v(stmts.head)  
        result = ctx.popResult
      }else{
        val seq_astnum = factory.next_astnum
        v(stmts.head)  
        val stmt1 = ctx.popResult
        val stmt2 = unit_trans_seq(stmts.tail, v)
        result = factory.buildSeqStmt(seq_astnum, stmt1, stmt2)        
      }
    }
    result
  }  
  
  def theVisitor: BVisitor = visit
  val ctx = new Context {}
  
  val visit = Visitor.build(
    Visitor.first(
      ivector(
        packageH(ctx, theVisitor),
        methodH(ctx, theVisitor),
        definingIdentifier(ctx, theVisitor),
        statementH(ctx, theVisitor),
        expressionH(ctx, theVisitor),
        nameH(ctx, theVisitor),
        everythingElseH(ctx, theVisitor)
      )))
  
  import org.sireum.option.ProgramTarget
  val t = this.translationType
  assert (t == ProgramTarget.Coq || t == ProgramTarget.Ocaml)
  val factory = new Factory(t)
  // print the test cases
  // var count = 0;
  // var suffix = 0;
  this.parseGnat2XMLresults.foreach {
    case (key, value) => {
      // println("test case " + count + "_" + suffix + ": " + key)
      // suffix = (suffix + 1)%2
      // count = if (suffix == 0) (count + 1) else count  
      visit(value)
    }
  }
}

final case class MethodClass(
    mname: String, 
    returnType: Option[String],
    aspectSpecs: MList[String], 
    params: MList[String],
    localIdents: MList[String],
    mbody: String
)


