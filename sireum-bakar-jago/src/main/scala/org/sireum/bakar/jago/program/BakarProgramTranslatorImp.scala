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
        case AndOperatorEx(_)                => Some("Oand")
        case OrOperatorEx(_)                 => Some("Oor")
        case XorOperatorEx                   => Some("Oxor")

        case EqualOperatorEx(_)              => Some("Ceq")
        case NotEqualOperatorEx(_)           => Some("Cne")
        case GreaterThanOperatorEx(_)        => Some("Cgt")
        case GreaterThanOrEqualOperatorEx(_) => Some("Cge")
        case LessThanOperatorEx(_)           => Some("Clt")
        case LessThanOrEqualOperatorEx(_)    => Some("Cle")

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
      // Compilation unit can be either (1)Package Body/Declaration or (2)Procedure/Function Body
      // Notice: the position of the following command will affect the increasing order of ast number labeled for each ast
      val cu_astnum = factory.next_astnum
      val unit_astnum = factory.next_astnum
      v(unitDeclaration)
      val bodyDecl = ctx.popResult
      val unitDecl = factory.buildUnitDeclaration(unit_astnum, "UnitDecl", bodyDecl.asInstanceOf[String])
      val cu = factory.buildCompilationUnit(cu_astnum, unitDecl)
      ctx.addToResults(cu)

      false
    case o @ PackageDeclarationEx(sloc, names, aspectSpec,
      visiblePartDecItems, privatePartDecItems) =>
      // println("packageH: " + o.getClass().getSimpleName())

      false
    case o @ PackageBodyDeclarationEx(sloc, names, aspectSpec,
      bodyDecItems, bodyStatements, bodyExceptionHandlers) =>

      assert(bodyExceptionHandlers.getExceptionHandlers().isEmpty())
      assert(names.getDefiningNames().length == 1)
      val pkgbody_astnum = factory.next_astnum
      // val pname = names.getDefiningNames.get(0).asInstanceOf[DefiningIdentifier].getDefName()
      val pkgname = names.getDefiningNames.get(0)
      v(pkgname)
      val pkgBodyName = ctx.popResult.asInstanceOf[String]

      val pkgElems = mlistEmpty[String]
      TranslatorUtil.getTypeDeclarations(bodyDecItems)

      if (!aspectSpec.getElements().isEmpty())
        Console.err.println("Need to handle package body aspect clauses")
      if (!bodyStatements.getStatements.isEmpty)
        Console.err.println("Need to handle package body statements")

      for (m <- TranslatorUtil.getMethodDeclarations(bodyDecItems)) {
        v(m)
        pkgElems += ctx.popResult.asInstanceOf[String]
      }
      val pkgBodyAspectSpecs = mlistEmpty[String]
      val pkgBodyDecl = factory.buildPackageBody(pkgbody_astnum, pkgBodyName, pkgBodyAspectSpecs, pkgElems : _*)
      //
      //val packageUnit = factory.buildUnitDeclaration(unit_astnum, "PackageBodyDecl", pkgBodyDecl)
      //val packageUnit = factory.buildUnitDeclaration(unit_astnum, "UnitDecl", pkgBodyDecl)
      ctx.pushResult(pkgBodyDecl)

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
        val mname = ctx.popResult.asInstanceOf[String]
        // [2] return type
        val returnType : Option[String] = resultProfile match {
          case Some(e) =>
            v(e)
            val r = ctx.popResult.asInstanceOf[Identifier]
            Some(TranslatorUtil.getReturnType(r.getRefName()))
          case None => None
        }
        // [3] method parameters
        val params = mlistEmpty[String]
        for (p <- paramProfile.getParameterSpecifications()) {
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
              val initExp : Option[String] =
                if (ctx.isEmpty(_initExpr)) {
                  None
                } else {
                  v(_initExpr)
                  Some(ctx.popResult.asInstanceOf[String])
                }
              // [2-3] parameter names of the same type and mode
              val paramlist = mlistEmpty[String]
              pnames.getDefiningNames().foreach {
                case DefiningIdentifierEx(sloc, defName, theDef, theType) =>
                  val pnm = factory.buildId(paramType, defName, theDef)
                  paramlist += pnm
                case x =>
                  println("Not expecting: " + x)
                  assert(false)
              }
              val paramDecl = factory.buildParamSpecification(factory.next_astnum, paramlist, paramType.get, factory.buildMode(mode), initExp)
              params += paramDecl
            case x =>
              println("Not expecting: " + x)
              assert(false)
          }
        }
        // [4] declared local variables inside the method
        val defingIds = mlistEmpty[String]
        for (declItem <- bodyDeclItems.getElements()) {
          v(declItem)
          defingIds += ctx.popResult.asInstanceOf[String]
        }
        // [5] method body
        v(bodyStatements)
        val mbody = ctx.popResult.asInstanceOf[String]

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

        val method_astnum = factory.next_astnum
        val procbody_astnum = factory.next_astnum
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
        val method_astnum = factory.next_astnum
        val fnbody_astnum = factory.next_astnum
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

  /**
   * ProcedureBodyDeclaration /- body_declarative_items_ql: List[VariableDeclaration]
   */
  def definingIdentifier(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case varDecl @ VariableDeclarationEx(sloc, namesQl, hasAliasedQ, objDeclViewQ, initExpQ, aspectSpecQl) =>
      //val theType = util_GetTypeFromObjDeclViewQ(objDeclViewQ)
      v(objDeclViewQ.getDefinition())
      val typ = ctx.popResult.asInstanceOf[Identifier]
      val theType = Some(typ.getRef)
      val astnum = factory.next_astnum
      val declItems = mlistEmpty[String]
      for (defName <- namesQl.getDefiningNames()) {
        v(defName)
        declItems += ctx.popResult.asInstanceOf[String]
      }

      val optionalInitExp =
        if (ctx.isEmpty(initExpQ.getExpression())) {
          None
        } else {
          v(initExpQ.getExpression())
          Some(getExpressionStr(ctx.popResult))
        }

      ctx.pushResult(factory.buildIdentiferDecl(astnum, declItems, theType.get, optionalInitExp))
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
    case o @ AssignmentStatementEx(sloc, labelName, assignmentVariableName, assignmentExpression) =>
      val astnum = factory.next_astnum
      v(assignmentVariableName)
      val l = ctx.popResult.asInstanceOf[Identifier]
      val lhs = factory.buildId(Some(l.getType), l.getRefName, l.getRef)
      //val lhs = ctx.popResult.asInstanceOf[Identifier].getRefName()
      v(assignmentExpression)
      val rhs = getExpressionStr(ctx.popResult)
      ctx.pushResult(factory.buildAssignStmt(astnum, lhs, rhs))
      false
    case o @ IfStatementEx(sloc, labelNames, statementPaths) =>
      statementPaths.getPaths().foreach {
        case IfPathEx(sloc, condExp, statements) =>
          val astnum = factory.next_astnum
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
      val astnum = factory.next_astnum
      v(whileCondition)
      val cond = ctx.popResult.asInstanceOf[String]
      v(loopStatements)
      val loopBody = ctx.popResult.asInstanceOf[String]
      ctx.pushResult(factory.buildWhileStmt(astnum, cond, loopBody))
      false
    case o @ ImplementationDefinedPragmaEx(sloc, pragmaArgumentAssociationsQl, pragmaName) =>
      // ImplementationDefinedPragma: defines the user supplied loop invariant, which is an element of StatementList
      pragmaName match {
        case "Loop_Invariant" =>
          val astnum = factory.next_astnum
          v(pragmaArgumentAssociationsQl)
          //TODO: now consider while loop with only one loop invariant
          val hd = ctx.popResult.asInstanceOf[MList[Any]].head
          val loopInvariantExp = hd.asInstanceOf[String]
          ctx.pushResult(factory.buildLoopInvariantStmt(astnum, loopInvariantExp))
          false
        case _ =>
          println("statementH: other pragmas need to be handled !")
      }
      false
    case o @ ReturnStatementEx(sloc, labelNames, returnExp) =>
      assert(labelNames == null || labelNames.getDefiningNames().isEmpty())
      val astnum = factory.next_astnum
      v(returnExp)
      val re = getExpressionStr(ctx.popResult)
      ctx.pushResult(factory.buildReturnStmt(astnum, Some(re)))

      false
    //    case o @ ProcedureCallStatementEx(sloc, labelName, calledName, callStatementParameters, isPrefixNotation) =>
    //      v(calledName)
    //      val procName = ctx.popResult.asInstanceOf[String]
    //      val params = mlistEmpty[String]
    //      for (param <- callStatementParameters.getAssociations()) {
    //        v(param)
    //        params += ctx.popResult.asInstanceOf[String]
    //      }
    //      ctx.pushResult(factory.buildProcedureCall(procName, params : _*))
    //      false
    //    case o =>
    //      println("statementH: need to handle " + o.getClass().getSimpleName())
    //      true
  }

  def expressionH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ IntegerLiteralEx(sloc, litVal, theType) =>
      ctx.pushResult(o)
      false
    case o @ EnumerationLiteralEx(sloc, refName, ref, theType) =>
      ctx.pushResult(o)
      false
    case o @ IdentifierEx(sloc, refName, ref, theType) =>
      ctx.pushResult(o)
      false
    case o @ FunctionCallEx(sloc, prefixQ, functionCallParameters, isPrefixCall, isPrefixNotation, theType) =>
      val astnum = factory.next_astnum
      val plist = mlistEmpty[String]
      // import scala.collection.JavaConversions.asScalaBuffer
      // to do implicit conversion between Java collection and scala collection
      // scala.collection.mutable.Buffer <=> java.util.List
      for (param <- functionCallParameters.getAssociations) {
        v(param)
        plist += getExpressionStr(ctx.popResult)
      }

      if (ctx.isBinaryOp(prefixQ)) {
        assert(plist.length == 2)
        val loperand = plist(0)
        val roperand = plist(1)
        val bexp = factory.buildBinaryExpr(astnum, theType, ctx.getBinaryOp(prefixQ).get, loperand, roperand)
        ctx.pushResult(bexp)
      } else if (ctx.isUnaryOp(prefixQ)) {
        assert(plist.length == 1)
        val operand = plist(0)
        val uexp = factory.buildUnaryExpr(astnum, theType, ctx.getUnaryOp(prefixQ).get, operand)
        ctx.pushResult(uexp)
      } else {
        println("expressionH: need to handle Function Call Expression !")
      }
      false
    //    case o =>
    //      println("expressionH: need to handle: " + o.getClass.getSimpleName)
    //      true
  }

  def nameH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ DefiningIdentifierEx(sloc, defName, theDef, theType) =>
      val theTyp = if (theType == "null") None else Some(theType)
      ctx.pushResult(factory.buildId(theTyp, defName, theDef))
      false
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
    case o @ PragmaArgumentAssociationEx(sloc, formalParameter, actualParameter) =>
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

  def getExpressionStr(e : Any) : String = {
    e match {
      case o @ IntegerLiteralEx(sloc, litVal, theType) =>
        val value = litVal.replaceAll("_", "") // litval could look like 3_500
        factory.buildConstantExpr(factory.next_astnum, theType, value)
      case o @ EnumerationLiteralEx(sloc, refName, ref, theType) =>
        factory.buildConstantExpr(factory.next_astnum, theType, refName)
      case o @ IdentifierEx(sloc, refName, ref, theType) =>
        // identifier can be variable name or package/procedure name, <theType> is null if it's function name
        factory.buildIdExpr(factory.next_astnum, theType, refName, ref)
      case _ =>
        e.asInstanceOf[String]
    }
  }

  def theVisitor : BVisitor = visit
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

final case class MethodClass(
  mname : String,
  returnType : Option[String],
  aspectSpecs : MList[String],
  params : MList[String],
  localIdents : MList[String],
  mbody : String)