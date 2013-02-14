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
      
      val unitUri = null;
      val unitName = unitFullName
      val unitLocation = factory.buildLocation(sloc.getLine, sloc.getCol, sloc.getEndline, sloc.getEndcol)
      v(unitDeclaration)
      val unitDecl = ctx.popResult
      val cu = factory.buildCompilationUnit(unitUri, unitName, unitDecl, unitLocation)  
        
      // store the program translation results as PipelineJob's properties
      // so the result can be used by the following pipeline modules
      this.results_=(Seq[String](cu)) 

      false
    case o @ PackageDeclarationEx(sloc, names, aspectSpec,
      visiblePartDecItems, privatePartDecItems) =>
      // println("packageH: " + o.getClass().getSimpleName())

      false
    case o @ PackageBodyDeclarationEx(sloc, names, aspectSpec,
      bodyDecItems, bodyStatements, bodyExceptionHandlers) =>

      assert(bodyExceptionHandlers.getExceptionHandlers().isEmpty())

      assert(names.getDefiningNames().length == 1)
      // val pname = names.getDefiningNames.get(0).asInstanceOf[DefiningIdentifier].getDefName()
      val pkgname = names.getDefiningNames.get(0)
      
      val pkgElems = mlistEmpty[String]
      TranslatorUtil.getTypeDeclarations(bodyDecItems)
      
      if (!aspectSpec.getElements().isEmpty())
        Console.err.println("Need to handle package body aspect clauses")

      if (!bodyStatements.getStatements.isEmpty)
        Console.err.println("Need to handle package body statements")

      for (m <- TranslatorUtil.getMethodDeclarations(bodyDecItems)) {
        v(m)
        val pm = ctx.popResult
        pkgElems += pm
      }
      pkgElems += "nil"
      val pkgBodyAspectSpecs: Option[String] = None
      v(pkgname)
      val pkg = factory.buildPackageBody(ctx.popResult, pkgBodyAspectSpecs, pkgElems:_*)
      ctx.pushResult(pkg)

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
        // [2] method parameters
        val params = mlistEmpty[String]
        for(p <- paramProfile.getParameterSpecifications()) {
          p match {
          case ps @ ParameterSpecificationEx(sloc, pnames, _hasAliased, _hasNullEx,
            objDecView, _initExpr, mode) =>
            // e.g (I : Integer) or (I, J : 
            assert(ctx.isEmpty(_hasAliased.getHasAliased()))
            assert(ctx.isEmpty(_hasNullEx.getHasNullExclusion()))
            assert(ctx.isEmpty(_initExpr.getExpression()))
            
            val theType = objDecView.getDefinition() match {
              case id @ IdentifierEx(sloc, refName, ref, type_) =>
                Some(refName)
              case _ =>
                None
            }
            assert(theType.isDefined)
            
            val initExp: Option[String] = 
              if(ctx.isEmpty(_initExpr)) {
                None
              }else{
                v(_initExpr)
                Some(ctx.popResult)
              }
            
            pnames.getDefiningNames().foreach {
              case pname : DefiningIdentifier =>
                val name_uri = pname.getDef()
                val name = pname.getDefName()
                val pnm = factory.buildId(theType.get, name_uri, name)
                val paramDecl = factory.buildParameter(pnm, factory.buildMode(mode), initExp)
                params += paramDecl
              case x =>
                println("Not expecting: " + x)
                assert(false)
            }
          case x =>
            println("Not expecting: " + x)
            assert(false)
                    
          }
        }     
        // list of parameters separated by "::" in Coq should be tailed with "nil"
        if(!params.isEmpty)
          params += "nil"
        // [3] declared local variables inside the method
        val defingIds = mlistEmpty[String]
        for(declItem <- bodyDeclItems.getElements()) {
          v(declItem)
          defingIds += ctx.popResult
        }
        if(!defingIds.isEmpty)
          defingIds += "nil"
        // [4] method body
        v(bodyStatements)
        val mbody = ctx.popResult
        // [5] return type
        val returnType : Option[String] = resultProfile match {
          case Some(e) =>
            v(e)
            val ne = ctx.popResult
            Some(ne)
          case None => None
        }
        // [6] method aspect specification, for example, Pre and Post  
        val specs = None
        // [7] return
        MethodClass(mname, specs, params, defingIds, mbody, returnType)
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

        val m = handleMethodBody(sloc, names, paramProfile, bodyDecItems,
          bodyStatements, None, aspectSpec, bodyExceptionHandlers,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())
        val procedureBody = factory.buildProcedureBody(m.mname, m.aspectSpecs, m.params, m.definingIdents, m.mbody)
        val result = factory.buildSubProgram("Sproc", procedureBody, "Procedure")
        ctx.pushResult(result)

        false
      case o @ FunctionBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, isNotNullReturn, resultProfile, aspectSpec,
        bodyDecItems, bodyStatements, bodyExceptionHandlers) =>

        val m = handleMethodBody(sloc, names, paramProfile, bodyDecItems,
          bodyStatements, Some(resultProfile), aspectSpec, bodyExceptionHandlers,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())
        val functionBody = factory.buildFunctionBody(m.mname, m.aspectSpecs, m.returnType.get, m.params, m.definingIdents, m.mbody)
        val result = factory.buildSubProgram("Sfunc", functionBody, "Function")
        ctx.pushResult(result)

        false
    }
  }
  
  def definingIdentifier(ctx: Context, v: => BVisitor): VisitorFunction = { 
    case varDecl @ VariableDeclarationEx(sloc, namesQl, hasAliasedQ, objDeclViewQ, initExpQ, aspectSpecQl) =>
      val declItems = mlistEmpty[String]
      for(defName <- namesQl.getDefiningNames()){
        v(defName)
        declItems += ctx.popResult
      }
      declItems += "nil"
      
      val optionalInitExp = 
        if (ctx.isEmpty(initExpQ.getExpression())){
          None
        } else {
          v(initExpQ.getExpression())
          Some(ctx.popResult)
        }
          
      ctx.pushResult(factory.buildIdentiferDecl(null, declItems, optionalInitExp))
      false
  }
  
  def statementH(ctx: Context, v: => BVisitor): VisitorFunction = {
    case o @ StatementListEx(statements) =>
      val stmts = mlistEmpty[String]
      for(stmt <- statements) {
        v(stmt)
        stmts += ctx.popResult
      }
      val seq: String = factory.buildSeqStmt(stmts: _*)
      ctx.pushResult(seq) 
      false
    case o @ AssignmentStatementEx(sloc, labelName, assignmentVariableName, assignmentExpression) =>
      v(assignmentVariableName)
      val lhs = ctx.popResult.asInstanceOf[String]
      v(assignmentExpression)
      val rhs = ctx.popResult.asInstanceOf[String]
      ctx.pushResult(factory.buildAssignStmt(lhs, factory.buildIdentifierExpr(rhs)))
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
          v(condExp)
          val cond = ctx.popResult.asInstanceOf[String]
          v(statements)
          val thenBranch = ctx.popResult.asInstanceOf[String]
          ctx.pushResult(factory.buildIfStmt(cond, thenBranch))
        case x =>
          println("statementH: IfStatement need to be handled for " + x.getClass().getSimpleName())
      }
      
      false
    case o @ WhileLoopStatementEx(sloc, labelNames, statementIdentifier,
      whileCondition, loopStatements) =>
      v(whileCondition)
      val cond = ctx.popResult.asInstanceOf[String]
      v(loopStatements)
      val loopBody = ctx.popResult.asInstanceOf[String]
      // TODO: extract the loop invariant from the While Statement
      val loopInv = factory.buildOptionV(None) 
      ctx.pushResult(factory.buildWhileStmt(cond, loopInv, loopBody))
      false
//    case o =>
//      println("statementH: need to handle " + o.getClass().getSimpleName())
//      true
  }
  
  def expressionH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ IntegerLiteralEx(sloc, litVal, theType) =>
      // litval could look like 3_500
      val v = litVal.replaceAll("_", "")
      ctx.pushResult(factory.buildConstantExpr(theType, v))
      false
    case o @ IdentifierEx(sloc, refName, ref, theType) =>
      // identifier can be variable name or package/procedure name, <theType> is null if it's function name
      ctx.pushResult(factory.buildId(theType, ref, refName))
      false
    case o @ FunctionCallEx(sloc, prefixQ, functionCallParameters, isPrefixCall, isPrefixNotation, theType) =>
      val plist = mlistEmpty[String]
      // import scala.collection.JavaConversions.asScalaBuffer
      // to do implicit conversion between Java collection and scala collection
      // scala.collection.mutable.Buffer <=> java.util.List
      for(param <- functionCallParameters.getAssociations) {
        v(param)
        plist += ctx.popResult.asInstanceOf[String]
      }
      
      if(ctx.isBinaryOp(prefixQ)) {
        assert(plist.length == 2)
        val bexp = factory.buildBinaryExpr(ctx.getBinaryOp(prefixQ).get, factory.buildIdentifierExpr(plist(0)), factory.buildIdentifierExpr(plist(1)))
        ctx.pushResult(bexp)
      }else if(ctx.isUnaryOp(prefixQ)) {
        assert(plist.length == 1)
        val uexp = factory.buildUnaryExpr(ctx.getUnaryOp(prefixQ).get, factory.buildIdentifierExpr(plist(0)))
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
      ctx.pushResult(factory.buildId(theType, ref, refName))
      false
    case o @ DefiningIdentifierEx(sloc, defName, theDef, theType) =>
      ctx.pushResult(factory.buildId(theType, theDef, defName))
      false
//    case o @ SelectedComponentEx(sloc, prefix, selector, theType) =>
//
//      false
    case o =>
//      println("nameH: need to handle: " + o.getClass().getSimpleName())
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
    aspectSpecs: Option[String], 
    params: MList[String],
    definingIdents: MList[String],
    mbody: String,
    returnType: Option[String]
)


