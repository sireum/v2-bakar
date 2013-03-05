package org.sireum.bakar.compiler.module

import org.sireum.bakar.xml._
import org.sireum.pilar.ast._
import org.sireum.pipeline._
import org.sireum.util._
import scala.collection.JavaConversions.asScalaBuffer
import java.io.File

class BakarTranslatorModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarTranslatorModule {

  type BVisitor = Any => Boolean

  trait Context {
    var genThreeAddress = true
    val TEMP_VAR_PREFIX = "_t"
    val LOCATION_PREFIX = "l"

    var models = mlistEmpty[Model]

    var unhandledSet = msetEmpty[String]

    var countLocation = 0
    var stackLocationList = mstackEmpty[MList[LocationDecl]]
    def pushLocationList = {
      val locs = mlistEmpty[LocationDecl]; stackLocationList.push(locs); locs
    }
    def popLocationList = this.stackLocationList.pop
    def pushLocation(l : LocationDecl) = {
      stackLocationList.top += l
      l
    }

    var result : Any = null;
    def pushResult(o : Any) {
      //assert(result == null);
      result = o
    }
    def popResult = {
      //assert(result != null)
      val t = result
      result = null
      t
    }

    def isEmpty(o : Base) : Boolean = o.isInstanceOf[NotAnElement]

    def isUnaryOp(o : Any) = getUnaryOp(o).isDefined
    def getUnaryOp(o : Any) : scala.Option[UnaryOp] = {
      if (!o.isInstanceOf[ExpressionClass]) {
        return None
      }
      val x = o.asInstanceOf[ExpressionClass].getExpression().asInstanceOf[Any]

      x match {
        case UnaryMinusOperatorEx(_) => Some(PilarAstUtil.MINUS_UNOP)
        case UnaryPlusOperatorEx(_)  => Some(PilarAstUtil.PLUS_UNOP)
        case NotOperatorEx(_)        => Some(PilarAstUtil.NOT_UNOP)
        case _                       => None
      }
    }

    def isBinaryOp(o : Any) = getBinaryOp(o).isDefined
    def getBinaryOp(o : Any) : scala.Option[BinaryOp] = {
      if (!o.isInstanceOf[ExpressionClass]) {
        return None
      }
      val x = o.asInstanceOf[ExpressionClass].getExpression().asInstanceOf[Any]

      x match {
        case AndOperatorEx(_)                => Some(PilarAstUtil.LOGICAL_AND_BINOP)
        case OrOperatorEx(_)                 => Some(PilarAstUtil.LOGICAL_OR_BINOP)

        case EqualOperatorEx(_)              => Some(PilarAstUtil.EQ_BINOP)
        case GreaterThanOperatorEx(_)        => Some(PilarAstUtil.GT_BINOP)
        case GreaterThanOrEqualOperatorEx(_) => Some(PilarAstUtil.GE_BINOP)
        case LessThanOperatorEx(_)           => Some(PilarAstUtil.LT_BINOP)
        case LessThanOrEqualOperatorEx(_)    => Some(PilarAstUtil.LE_BINOP)
        case NotEqualOperatorEx(_)           => Some(PilarAstUtil.NE_BINOP)

        case DivideOperatorEx(_)             => Some(PilarAstUtil.DIV_BINOP)
        case MinusOperatorEx(_)              => Some(PilarAstUtil.SUB_BINOP)
        case MultiplyOperatorEx(_)           => Some(PilarAstUtil.MUL_BINOP)
        case PlusOperatorEx(_)               => Some(PilarAstUtil.PLUS_UNOP)
        case RemOperatorEx(_)                => Some(PilarAstUtil.REM_BINOP)

        case XorOperatorEx =>
          println("Don't know how to handle bin op " + o)
          None
        case ModOperatorEx =>
          println("Don't know how to handle bin op " + o)
          None

        case _ =>
          None
      }
    }

    var locals : MList[LocalVarDecl] = null
    def localsInit = {
      assert(locals == null)
      locals = mlistEmpty[LocalVarDecl]
    }
    def localsPush(l : LocalVarDecl) = {
      assert(locals != null)
      locals += l
    }
    def localsPop = {
      val r = locals
      locals = null
      r
    }

    var countTempVar = 0
    def createPushTempVar : NameExp = {
      countTempVar += 1
      val name = TEMP_VAR_PREFIX + countTempVar
      localsPush(LocalVarDecl(None, NameDefinition(name), TranslatorUtil.emptyAnnot))
      NameExp(NameUser(name))
    }

    def newLocLabel = { countLocation += 1; NameDefinition(this.LOCATION_PREFIX + countLocation) }

    def createEmptyLocation(locName : NameDefinition, annots : ISeq[Annotation] = TranslatorUtil.emptyAnnot) = {
      EmptyLocation(Some(locName), annots)
    }

    def createLocation(locName : NameDefinition, a : Action, annots : ISeq[Annotation] = TranslatorUtil.emptyAnnot) = {
      ActionLocation(Some(locName), annots, a)
    }

    def createPushLocation(a : Action, annots : ISeq[Annotation]) : LocationDecl = {
      createPushLocation(newLocLabel, a, annots)
    }

    def createPushLocation(locName : NameDefinition, a : Action, annots : ISeq[Annotation] = TranslatorUtil.emptyAnnot) : LocationDecl = {
      val loc = createLocation(locName, a, annots)
      pushLocation(loc)
      loc
    }

    def createJumpLocation(j : Jump) = JumpLocation(Some(newLocLabel), TranslatorUtil.emptyAnnot, j)

    def createGotoJumpLocation(target : NameUser, annots : ISeq[Annotation]) =
      createJumpLocation(GotoJump(annots, target))

    def createPushAssignmentLocation(lhs : Exp, rhs : Exp, annots : ISeq[Annotation]) = {
      createPushLocation(createAssignment(lhs, rhs, annots), TranslatorUtil.emptyAnnot)
    }

    def createAssignment(lhs : Exp, rhs : Exp, annots : ISeq[Annotation]) = {
      AssignAction(annots, lhs, ":=", rhs)
    }

    def assignToTemp(e : Exp) : NameExp = {
      val tempVar = createPushTempVar
      createPushLocation(createAssignment(tempVar, e, TranslatorUtil.emptyAnnot), TranslatorUtil.emptyAnnot)
      tempVar
    }

    def handleUnaryExp(sloc : SourceLocation,
                       op : UnaryOp, exp : Exp, theType : String) : Exp = {
      handleExp(addProperty(URIS.TYPE_URI, theType, UnaryExp(op, exp)))
    }

    def handleBE(sloc : SourceLocation,
                 op : BinaryOp, lhs : Exp, rhs : Exp, theType : String) : Exp = {
      handleExp(addProperty(URIS.TYPE_URI, theType, BinaryExp(op, lhs, rhs)))
    }

    def handleBE(v : => BVisitor, sloc : SourceLocation,
                 op : BinaryOp, lhs : ExpressionClass, rhs : ExpressionClass, theType : String) : Exp = {
      v(lhs)
      val plhs = popResult.asInstanceOf[Exp]
      v(rhs)
      val prhs = popResult.asInstanceOf[Exp]

      handleBE(sloc, op, plhs, prhs, theType)
    }

    def handleExp(e : Exp) : Exp = {
      if (this.genThreeAddress)
        assignToTemp(e)
      else
        e
    }

    def addProperty[T <: PropertyProvider](key : String, value : Any, pp : T) : T = {
      if (value == null || value == "") {
        println("null/empty value for %s from %s".format(key, pp))
      } else {
        pp.setProperty(key, value)
      }
      pp
    }
  }

  implicit def nd2nu(nd : NameDefinition) = NameUser(nd.name)

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

      v(unitDeclaration)

      ctx.popResult match {
        case p : PackageDecl =>
          ctx.models += Model(Some(sourceFile), ivectorEmpty[Annotation], ivector(p))
        case x =>
          println("Expecting a PackageDecl, received " + x)
      }

      false
    case o @ PackageDeclarationEx(sloc, names, aspectSpec,
      visiblePartDecItems, privatePartDecItems) =>
      println(o.getClass().getSimpleName())

      assert(names.getDefiningNames.length == 1)
      val di = names.getDefiningNames.get(0).asInstanceOf[DefiningIdentifier]
      val pname = NameDefinition(di.getDefName)

      if (!aspectSpec.getElements().isEmpty())
        Console.err.println("Need to handle package spec aspect clauses: " + pname)

      for (x <- visiblePartDecItems.getDeclarativeItems()) {
        //v(x)
        Console.err.println("Need to handle package spec public declarative items: " + pname)
      }

      for (x <- privatePartDecItems.getDeclarativeItems()) {
        //v(x)
        Console.err.println("Need to handle package spec private declarative items: " + pname)
      }

      false
    case o @ PackageBodyDeclarationEx(sloc, names, aspectSpec,
      bodyDecItems, bodyStatements, bodyExceptionHandlers) =>

      assert(bodyExceptionHandlers.getExceptionHandlers().isEmpty())

      assert(names.getDefiningNames().length == 1)
      val di = names.getDefiningNames.get(0).asInstanceOf[DefiningIdentifier]
      val pname = NameDefinition(di.getDefName())

      val packElems = mlistEmpty[PackageElement]
      TranslatorUtil.getTypeDeclarations(bodyDecItems)

      if (!aspectSpec.getElements().isEmpty())
        Console.err.println("Need to handle package body aspect clauses")

      if (!bodyStatements.getStatements.isEmpty)
        Console.err.println("Need to handle package body statements")

      if (!TranslatorUtil.getConstantDeclarations(bodyDecItems).isEmpty)
        Console.err.println("Need to handle package body consts")

      if (!TranslatorUtil.getGlobalDeclarations(bodyDecItems).isEmpty)
        Console.err.println("Need to handle package body globals")

      for (m <- TranslatorUtil.getMethodDeclarations(bodyDecItems)) {
        v(m)
        val pm = ctx.popResult
        packElems += pm.asInstanceOf[ProcedureDecl]
      }

      val pack = PackageDecl(Some(pname), TranslatorUtil.emptyAnnot, packElems.toList)
      ctx.pushResult(pack)

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

        assert(aspectSpecs.getElements().isEmpty)
        assert(exceptionHandlerList.getExceptionHandlers().isEmpty())
        assert(ctx.isEmpty(isOverridingDec))
        assert(ctx.isEmpty(isNotOverridingDec))

        assert(names.getDefiningNames().length == 1)
        val mname = NameDefinition(names.getDefiningNames().get(0).asInstanceOf[DefiningIdentifier].getDefName())

        val params = mlistEmpty[ParamDecl]
        paramProfile.getParameterSpecifications().foreach {
          case ps @ ParameterSpecificationEx(sloc, pnames, _hasAliased, _hasNullEx,
            objDecView, _initExpr, mode) =>
            // e.g (I : Integer) or (I, J : 
            assert(ctx.isEmpty(_hasAliased.getHasAliased()))
            assert(ctx.isEmpty(_hasNullEx.getHasNullExclusion()))
            assert(ctx.isEmpty(_initExpr.getExpression()))

            v(objDecView.getDefinition)
            val odv = ctx.popResult.asInstanceOf[NameExp]

            pnames.getDefiningNames().foreach {
              case pname : DefiningIdentifier =>
                val name = NameDefinition(pname.getDefName())
                val typeSpec = Some(NamedTypeSpec(odv.name, ivectorEmpty[TypeSpec]))
                params += ParamDecl(typeSpec, name, TranslatorUtil.emptyAnnot)
              case x =>
                println("Not expecting: " + x)
                assert(false)
            }
          case x =>
            println("Not expecting: " + x)
            assert(false)
        }

        ctx.localsInit
        bodyDeclItems.getElements().foreach {
          case vd @ VariableDeclarationEx(sloc, names, hasAliased,
            objDecView, initExpr, aspectSpec) =>
            assert(ctx.isEmpty(hasAliased.getHasAliased()))
            assert(ctx.isEmpty(initExpr.getExpression()))

            v(objDecView)
            val odv = ctx.popResult.asInstanceOf[NameExp]
            val typeSpec = Some(NamedTypeSpec(odv.name, ivectorEmpty[TypeSpec]))

            names.getDefiningNames().foreach {
              case di : DefiningIdentifier =>
                val name = NameDefinition(di.getDefName())
                ctx.localsPush(LocalVarDecl(typeSpec, name, TranslatorUtil.emptyAnnot))
              case x =>
                println("Not expecting: " + x)
                assert(false)
            }
          case x =>
            Console.err.println("Not expecting:" + x)
            assert(false)
        }

        ctx.pushLocationList
        v(bodyStatements)
        val body = ImplementedBody(ctx.localsPop.toList, ctx.popLocationList.toList, ivectorEmpty[CatchClause])

        val returnType : Option[TypeSpec] = resultProfile match {
          case Some(e) =>
            v(e)
            val ne = ctx.popResult.asInstanceOf[NameExp]
            val nts = NamedTypeSpec(ne.name, ivectorEmpty[TypeSpec])
            ne.propertyMap.foreach { case (key, value) => nts.setProperty(key, value) }
            Some(nts)
          case None => {
            // ada procedure so add an empty return to the body
            ctx.pushLocation(JumpLocation(Some(ctx.newLocLabel), TranslatorUtil.emptyAnnot,
              ReturnJump(TranslatorUtil.emptyAnnot, None)))
            None
          }
        }

        val typeVars = ivectorEmpty[(NameDefinition, ISeq[Annotation])]
        val varArity = false
        ProcedureDecl(mname, TranslatorUtil.emptyAnnot, typeVars, params.toList,
          returnType, varArity, body)
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
        ctx.pushResult(m)

        false
      case o @ FunctionBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, isNotNullReturn, resultProfile, aspectSpec,
        bodyDecItems, bodyStatements, bodyExceptionHandlers) =>

        assert(ctx.isEmpty(isNotNullReturn.getIsNotNullReturn()))

        val m = handleMethodBody(sloc, names, paramProfile, bodyDecItems,
          bodyStatements, Some(resultProfile), aspectSpec, bodyExceptionHandlers,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())
        ctx.pushResult(m)

        false
    }
  }

  def nameH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ IdentifierEx(sloc, refName, ref, theType) =>
      val ret = ctx.addProperty(URIS.TYPE_URI, theType, NameExp(
        ctx.addProperty(URIS.REF_URI, ref, NameUser(refName))))
      ctx.pushResult(ret)
      false
    case o @ DefiningIdentifierEx(sloc, defName, theDef, theType) =>
      val ret = ctx.addProperty(URIS.TYPE_URI, theType, NameExp(
        ctx.addProperty(URIS.REF_URI, theDef, NameUser(defName))))
      ctx.pushResult(ret)
      false
    case o @ SelectedComponentEx(sloc, prefix, selector, theType) =>

      v(prefix.getExpression())
      val p = ctx.popResult.asInstanceOf[Exp]

      val sel = selector.getExpression().asInstanceOf[Identifier]

      // TODO: need to type prefix to determine if this is a 
      // AccessExp, field lookup, etc...
      var ret : Option[Exp] = None
      p match {
        case NameExp(ns) =>
          ret = Some(NameExp(NameUser(ns.name + "::" + sel.getRefName())))
        case x : IndexingExp =>
          ret = Some(AccessExp(x, NameUser(sel.getRefName())))
        case q =>
          println("what to do with " + q)
          assert(false)
      }
      assert(ret.isDefined)

      ctx.pushResult(ret.get)
      false
    case o @ (
      NameClassEx(_) |
      DefiningNameClassEx(_) |
      DefiningExpandedNameEx(_)
      ) =>
      println("nameH: need to handle: " + o.getClass().getSimpleName())
      true
  }

  def statementH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ AssignmentStatementEx(sloc, labelName, assignmentVariableName, assignmentExpression) =>

      v(assignmentVariableName)
      val lhs = ctx.popResult.asInstanceOf[Exp]

      v(assignmentExpression)
      val rhs = ctx.popResult.asInstanceOf[Exp]

      ctx.createPushAssignmentLocation(lhs, rhs, TranslatorUtil.emptyAnnot)
      false
    case o @ IfStatementEx(sloc, labelNames, statementPaths) =>
      val isSingle = statementPaths.getPaths.size == 1
      val endLoc = ctx.newLocLabel
      var gotoLoc = if (isSingle) endLoc else ctx.newLocLabel

        def render(sloc : SourceLocation, condExp : ExpressionClass, statements : StatementList, isIfElse : Boolean) = {
          if (isIfElse) {
            // #<gotoLoc>.
            ctx.pushLocation(ctx.createEmptyLocation(gotoLoc, TranslatorUtil.emptyAnnot))
            gotoLoc = ctx.newLocLabel
          }

          v(condExp)

          // #l0. if(!resultVar) then goto <nextSlot>;
          val ne = UnaryExp(PilarAstUtil.NOT_UNOP, ctx.popResult.asInstanceOf[NameExp])
          val itj = IfThenJump(ne, TranslatorUtil.emptyAnnot, gotoLoc)
          val ij = IfJump(TranslatorUtil.emptyAnnot, ivector(itj), None)
          val jl = JumpLocation(Some(ctx.newLocLabel), TranslatorUtil.emptyAnnot, ij)
          ctx.pushLocation(jl)

          // ... eval body statements
          v(statements)

          if (!isSingle) {
            // # goto endLoc;
            val gl = ctx.createGotoJumpLocation(endLoc, TranslatorUtil.emptyAnnot)
            ctx.pushLocation(gl)
          }
        }

      statementPaths.getPaths().foreach {
        case IfPathEx(sloc, condExp, statements) =>
          render(sloc, condExp, statements, false)
        case ElsifPathEx(sloc, condExp, statements) =>
          render(sloc, condExp, statements, true)
        case ElsePathEx(sloc, statements) =>
          // #<gotoLoc>.
          ctx.pushLocation(ctx.createEmptyLocation(gotoLoc, TranslatorUtil.emptyAnnot))

          v(statements)

        case x =>
          throw new RuntimeException("Not expecting " + x)
      }

      ctx.pushLocation(ctx.createEmptyLocation(endLoc))

      false
    case o @ CaseStatementEx(sloc, labelnames, caseExpression, statementPaths) =>
      println(o.getClass().getSimpleName())
      true
    case o @ LoopStatementEx(sloc, labelNames, statementIdentifier, loopStatements) =>
      println(o.getClass().getSimpleName())
      true
    case o @ WhileLoopStatementEx(sloc, labelNames, statementIdentifier,
      whileCondition, loopStatements) =>
      println(o.getClass().getSimpleName())

      val loopEndLabel = ctx.newLocLabel

      // #loopStart.
      val loopStart = ctx.pushLocation(ctx.createEmptyLocation(ctx.newLocLabel))

      v(whileCondition)

      // # if (!loopCond) goto endLocLabel;
      val ne = UnaryExp(PilarAstUtil.NOT_UNOP, ctx.popResult.asInstanceOf[NameExp])
      val itj = IfThenJump(ne, TranslatorUtil.emptyAnnot, loopEndLabel)
      val ij = IfJump(TranslatorUtil.emptyAnnot, ivector(itj), None)
      val jl = JumpLocation(Some(ctx.newLocLabel), TranslatorUtil.emptyAnnot, ij)
      ctx.pushLocation(jl)

      v(loopStatements)

      // # goto loopStart
      val gl = ctx.pushLocation(ctx.createGotoJumpLocation(loopStart.name.get, TranslatorUtil.emptyAnnot))

      ctx.pushLocation(ctx.createEmptyLocation(loopEndLabel))

      false
    case o @ ForLoopStatementEx(sloc, labelnames, statementIdentifier,
      forLoopParameterSpecification, loopStatements) =>
      println(o.getClass().getSimpleName())
      true
    case o @ ReturnStatementEx(sloc, labelNames, returnExp) =>
      assert(labelNames == null || labelNames.getDefiningNames().isEmpty())

      v(returnExp)

      val rj = ReturnJump(TranslatorUtil.emptyAnnot, Some(ctx.popResult.asInstanceOf[Exp]))
      val jl = JumpLocation(Some(ctx.newLocLabel), TranslatorUtil.emptyAnnot, rj)

      ctx.pushLocation(jl)
      false
    case o @ (NullStatementEx(_) |
      BlockStatementEx(_) |
      BlockStatementEx(_) |
      GotoStatementEx(_) |
      ProcedureCallStatementEx(_) |
      AcceptStatementEx(_) |
      ExtendedReturnStatementEx(_) |
      EntryCallStatementEx(_) |
      RequeueStatementEx(_) |
      RequeueStatementWithAbortEx(_) |
      DelayUntilStatementEx(_) |
      DelayRelativeStatementEx(_) |
      TerminateAlternativeStatementEx(_) |
      SelectiveAcceptStatementEx(_) |
      TimedEntryCallStatementEx(_) |
      ConditionalEntryCallStatementEx(_) |
      AsynchronousSelectStatementEx(_) |
      AbortStatementEx(_) |
      RaiseStatementEx(_) |
      CodeStatementEx(_)
      ) =>
      println("statementH: need to handle " + o.getClass().getSimpleName())
      true
  }

  def expressionH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ FunctionCallEx(sloc, prefix, functionCallParameters, isPrefixCall, isPrefixNotation, theType) =>
      import collection.JavaConversions._

      if (!ctx.isEmpty(isPrefixCall.getIsPrefixCall()))
        Console.err.println("Need to handle prefix calls")

      if (!ctx.isEmpty(isPrefixNotation.getIsPrefixNotation()))
        Console.err.println("Need to handle prefix notation")

      val plist = mlistEmpty[Exp]
      for (a <- functionCallParameters.getAssociations) {
        // TODO: these maybe associations in which case the arg order may not 
        //       match the declared formal param order
        v(a)
        plist += ctx.popResult.asInstanceOf[Exp]
      }

      if (ctx.isBinaryOp(prefix)) {
        assert(plist.length == 2)
        ctx.pushResult(ctx.handleBE(sloc, ctx.getBinaryOp(prefix).get, plist(0), plist(1), theType))
      } else if (ctx.isUnaryOp(prefix)) {
        assert(plist.length == 1)
        ctx.pushResult(ctx.handleUnaryExp(sloc, ctx.getUnaryOp(prefix).get, plist(0), theType))
      } else {
        v(prefix)
        val mname = ctx.popResult.asInstanceOf[Exp]
        val ce = CallExp(mname, TupleExp(plist.toList))
        ctx.pushResult(ctx.handleExp(ce))
      }

      false
    case IntegerLiteralEx(sloc, litVal, theType) =>
      val v = litVal.replaceAll("_", "")
      ctx.pushResult(LiteralExp(LiteralType.INTEGER, BigInt(v), v + "ii"))
      false
    case o @ EnumerationLiteralEx(sloc, refName, ref, typ) =>
      if (typ == StandardURIs.boolURI) {
        val v = refName.toLowerCase() == "true"
        ctx.pushResult(LiteralExp(LiteralType.BOOLEAN, v, refName.toLowerCase()))
      } else {
        Console.err.println("Not handling enumeration lit %s %s".format(typ, refName))
      }
      false
    case o @ AndThenShortCircuitEx(sloc, lhs, rhs, theType) =>
      ctx.pushResult(
        ctx.handleBE(v, sloc, PilarAstUtil.LOGICAL_AND_BINOP, lhs, rhs, theType))
      false
    case o @ OrElseShortCircuitEx(sloc, lhs, rhs, theType) =>
      ctx.pushResult(
        ctx.handleBE(v, sloc, PilarAstUtil.LOGICAL_OR_BINOP, lhs, rhs, theType))
      false
    case o @ IfExpressionEx(_) =>
      println("expressionH: need to handle: " + o.getClass.getSimpleName)
      true
    case o @ IndexedComponentEx(sloc, prefix, indexExp, theType) =>
      v(prefix)
      val pprefix = ctx.popResult.asInstanceOf[Exp]

      val indices = mlistEmpty[Exp]
      indexExp.getExpressions().foreach { e =>
        v(e)
        indices += ctx.popResult.asInstanceOf[Exp]
      }

      val ie = IndexingExp(pprefix, indices.toList)
      ctx.pushResult(ie)
      false

    case o @ (
      RealLiteralEx(_) |
      //ExpressionClassEx(_) |
      ExpressionListEx(_) |
      DiscreteSimpleExpressionRangeEx(_) |
      StringLiteralEx(_) |
      CharacterLiteralEx(_) |
      FunctionCallEx(_) |
      NullLiteralEx(_) |
      QualifiedExpressionEx(_) |
      ForAllQuantifiedExpressionEx(_) |
      ForSomeQuantifiedExpressionEx(_)
      ) =>
      println("expressionH: need to handle: " + o.getClass.getSimpleName)
      true
  }

  def contractsH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ AssertPragmaEx(sloc, pragmaArgumentAssociations, pragmaName) =>
      for (a <- pragmaArgumentAssociations.getAssociations()) {
        v(a)
        val r = ctx.popResult.asInstanceOf[NameExp]
        val aa = AssertAction(TranslatorUtil.emptyAnnot, r, None)
        ctx.createPushLocation(aa, TranslatorUtil.emptyAnnot)
      }
      false
  }

  def everythingElseH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o if (o != null) =>
      ctx.unhandledSet += o.getClass.getSimpleName()
      true
    case null =>
      println("everythingElseH: it is null")
      assert(false)
      false
  }

  def theVisitor : BVisitor = b
  val ctx = new Context {
    this.stackLocationList.push(mlistEmpty[LocationDecl])
  }

  val b = Visitor.build(
    Visitor.first(
      ivector(
        packageH(ctx, theVisitor),
        methodH(ctx, theVisitor),
        statementH(ctx, theVisitor),
        expressionH(ctx, theVisitor),
        contractsH(ctx, theVisitor),
        nameH(ctx, theVisitor),
        everythingElseH(ctx, theVisitor)
      )))

  this.parseGnat2XMLresults.foreach {
    case (key, value) => {
      b(value)
    }
  }

  println("Not handling: " + ctx.unhandledSet.toList.sorted)

  this.models_=(ctx.models.toList)
}
