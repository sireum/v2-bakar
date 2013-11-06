package org.sireum.bakar.compiler.module

import scala.collection.JavaConversions.asScalaBuffer

import org.sireum.bakar.symbol.BakarSymbol.pd2pi
import org.sireum.bakar.symbol.BakarSymbol.proc2procInfo
import org.sireum.bakar.symbol.ComponentDef
import org.sireum.bakar.symbol.ConstrainedArrayDef
import org.sireum.bakar.symbol.Constraint
import org.sireum.bakar.symbol.EnumerationTypeDef
import org.sireum.bakar.symbol.RecordTypeDef
import org.sireum.bakar.symbol.SignedIntegerTypeDef
import org.sireum.bakar.symbol.SimpleRangeConstraint
import org.sireum.bakar.symbol.SubTypeDecl
import org.sireum.bakar.symbol.TypeDef
import org.sireum.bakar.xml.AbortStatementEx
import org.sireum.bakar.xml.AcceptStatementEx
import org.sireum.bakar.xml.AndOperatorEx
import org.sireum.bakar.xml.AndThenShortCircuitEx
import org.sireum.bakar.xml.ArrayComponentAssociationEx
import org.sireum.bakar.xml.AspectSpecificationEx
import org.sireum.bakar.xml.AssertPragmaEx
import org.sireum.bakar.xml.AssignmentStatementEx
import org.sireum.bakar.xml.AsynchronousSelectStatementEx
import org.sireum.bakar.xml.Base
import org.sireum.bakar.xml.BlockStatementEx
import org.sireum.bakar.xml.CaseStatementEx
import org.sireum.bakar.xml.CharacterLiteralEx
import org.sireum.bakar.xml.CodeStatementEx
import org.sireum.bakar.xml.CompilationUnit
import org.sireum.bakar.xml.CompilationUnitEx
import org.sireum.bakar.xml.ComponentDeclarationEx
import org.sireum.bakar.xml.ComponentDefinitionEx
import org.sireum.bakar.xml.ConditionalEntryCallStatementEx
import org.sireum.bakar.xml.ConstrainedArrayDefinitionEx
import org.sireum.bakar.xml.DefiningEnumerationLiteralEx
import org.sireum.bakar.xml.DefiningExpandedNameEx
import org.sireum.bakar.xml.DefiningIdentifier
import org.sireum.bakar.xml.DefiningIdentifierEx
import org.sireum.bakar.xml.DefiningNameClassEx
import org.sireum.bakar.xml.DefiningNameList
import org.sireum.bakar.xml.DefinitionClass
import org.sireum.bakar.xml.DelayRelativeStatementEx
import org.sireum.bakar.xml.DelayUntilStatementEx
import org.sireum.bakar.xml.DiscreteSimpleExpressionRangeEx
import org.sireum.bakar.xml.DiscreteSubtypeIndicationAsSubtypeDefinitionEx
import org.sireum.bakar.xml.DivideOperatorEx
import org.sireum.bakar.xml.ElementClass
import org.sireum.bakar.xml.ElementList
import org.sireum.bakar.xml.ElsePathEx
import org.sireum.bakar.xml.ElsifPathEx
import org.sireum.bakar.xml.EntryCallStatementEx
import org.sireum.bakar.xml.EnumerationLiteralEx
import org.sireum.bakar.xml.EnumerationLiteralSpecificationEx
import org.sireum.bakar.xml.EnumerationTypeDefinitionEx
import org.sireum.bakar.xml.EqualOperatorEx
import org.sireum.bakar.xml.ExitStatementEx
import org.sireum.bakar.xml.ExpressionClass
import org.sireum.bakar.xml.ExpressionClassEx
import org.sireum.bakar.xml.ExpressionListEx
import org.sireum.bakar.xml.ExtendedReturnStatementEx
import org.sireum.bakar.xml.FirstAttributeEx
import org.sireum.bakar.xml.ForAllQuantifiedExpressionEx
import org.sireum.bakar.xml.ForLoopStatementEx
import org.sireum.bakar.xml.ForSomeQuantifiedExpressionEx
import org.sireum.bakar.xml.FunctionBodyDeclarationEx
import org.sireum.bakar.xml.FunctionCallEx
import org.sireum.bakar.xml.FunctionDeclarationEx
import org.sireum.bakar.xml.GotoStatementEx
import org.sireum.bakar.xml.GreaterThanOperatorEx
import org.sireum.bakar.xml.GreaterThanOrEqualOperatorEx
import org.sireum.bakar.xml.Identifier
import org.sireum.bakar.xml.IdentifierEx
import org.sireum.bakar.xml.IfExpressionEx
import org.sireum.bakar.xml.IfPathEx
import org.sireum.bakar.xml.IfStatementEx
import org.sireum.bakar.xml.ImplementationDefinedPragmaEx
import org.sireum.bakar.xml.IndexedComponentEx
import org.sireum.bakar.xml.IntegerLiteralEx
import org.sireum.bakar.xml.IntegerNumberDeclarationEx
import org.sireum.bakar.xml.LastAttributeEx
import org.sireum.bakar.xml.LessThanOperatorEx
import org.sireum.bakar.xml.LessThanOrEqualOperatorEx
import org.sireum.bakar.xml.LoopParameterSpecificationEx
import org.sireum.bakar.xml.LoopStatementEx
import org.sireum.bakar.xml.MinusOperatorEx
import org.sireum.bakar.xml.ModOperatorEx
import org.sireum.bakar.xml.ModularTypeDefinitionEx
import org.sireum.bakar.xml.MultiplyOperatorEx
import org.sireum.bakar.xml.NamedArrayAggregateEx
import org.sireum.bakar.xml.NameClassEx
import org.sireum.bakar.xml.NotAnElement
import org.sireum.bakar.xml.NotEqualOperatorEx
import org.sireum.bakar.xml.NotOperatorEx
import org.sireum.bakar.xml.NullLiteralEx
import org.sireum.bakar.xml.NullStatementEx
import org.sireum.bakar.xml.OrElseShortCircuitEx
import org.sireum.bakar.xml.OrOperatorEx
import org.sireum.bakar.xml.OrdinaryTypeDeclarationEx
import org.sireum.bakar.xml.PackageBodyDeclarationEx
import org.sireum.bakar.xml.PackageDeclarationEx
import org.sireum.bakar.xml.ParameterSpecificationEx
import org.sireum.bakar.xml.ParameterSpecificationList
import org.sireum.bakar.xml.ParenthesizedExpression
import org.sireum.bakar.xml.PlusOperatorEx
import org.sireum.bakar.xml.PositionalArrayAggregateEx
import org.sireum.bakar.xml.ProcedureBodyDeclarationEx
import org.sireum.bakar.xml.ProcedureCallStatementEx
import org.sireum.bakar.xml.ProcedureDeclarationEx
import org.sireum.bakar.xml.QualifiedExpressionEx
import org.sireum.bakar.xml.RaiseStatementEx
import org.sireum.bakar.xml.RangeAttributeReferenceEx
import org.sireum.bakar.xml.RealLiteralEx
import org.sireum.bakar.xml.RealNumberDeclarationEx
import org.sireum.bakar.xml.RecordAggregateEx
import org.sireum.bakar.xml.RecordComponentAssociationEx
import org.sireum.bakar.xml.RecordDefinitionEx
import org.sireum.bakar.xml.RecordTypeDefinitionEx
import org.sireum.bakar.xml.RemOperatorEx
import org.sireum.bakar.xml.RequeueStatementEx
import org.sireum.bakar.xml.RequeueStatementWithAbortEx
import org.sireum.bakar.xml.ReturnStatementEx
import org.sireum.bakar.xml.SelectedComponentEx
import org.sireum.bakar.xml.SelectiveAcceptStatementEx
import org.sireum.bakar.xml.SignedIntegerTypeDefinitionEx
import org.sireum.bakar.xml.SimpleExpressionRangeEx
import org.sireum.bakar.xml.SourceLocation
import org.sireum.bakar.xml.StatementList
import org.sireum.bakar.xml.StringLiteralEx
import org.sireum.bakar.xml.SubtypeDeclarationEx
import org.sireum.bakar.xml.SubtypeIndicationEx
import org.sireum.bakar.xml.TerminateAlternativeStatementEx
import org.sireum.bakar.xml.TimedEntryCallStatementEx
import org.sireum.bakar.xml.UnaryMinusOperatorEx
import org.sireum.bakar.xml.UnaryPlusOperatorEx
import org.sireum.bakar.xml.VariableDeclarationEx
import org.sireum.bakar.xml.WhileLoopStatementEx
import org.sireum.bakar.xml.XorOperatorEx
import org.sireum.pilar.ast.AccessExp
import org.sireum.pilar.ast.Action
import org.sireum.pilar.ast.ActionLocation
import org.sireum.pilar.ast.Annotation
import org.sireum.pilar.ast.AssertAction
import org.sireum.pilar.ast.AssignAction
import org.sireum.pilar.ast.AssumeAction
import org.sireum.pilar.ast.AttributeDecl
import org.sireum.pilar.ast.BinaryExp
import org.sireum.pilar.ast.BinaryOp
import org.sireum.pilar.ast.CallExp
import org.sireum.pilar.ast.CallJump
import org.sireum.pilar.ast.CastExp
import org.sireum.pilar.ast.ConstDecl
import org.sireum.pilar.ast.ConstElement
import org.sireum.pilar.ast.EmptyBody
import org.sireum.pilar.ast.EmptyLocation
import org.sireum.pilar.ast.Exp
import org.sireum.pilar.ast.ExtendClause
import org.sireum.pilar.ast.GlobalVarDecl
import org.sireum.pilar.ast.GotoJump
import org.sireum.pilar.ast.IfJump
import org.sireum.pilar.ast.IfThenJump
import org.sireum.pilar.ast.ImplementedBody
import org.sireum.pilar.ast.IndexingExp
import org.sireum.pilar.ast.Jump
import org.sireum.pilar.ast.JumpLocation
import org.sireum.pilar.ast.LiteralExp
import org.sireum.pilar.ast.LiteralType
import org.sireum.pilar.ast.LocalVarDecl
import org.sireum.pilar.ast.LocationDecl
import org.sireum.pilar.ast.Model
import org.sireum.pilar.ast.NameDefinition
import org.sireum.pilar.ast.NameExp
import org.sireum.pilar.ast.NameUser
import org.sireum.pilar.ast.NamedTypeSpec
import org.sireum.pilar.ast.PackageDecl
import org.sireum.pilar.ast.PackageElement
import org.sireum.pilar.ast.ParamDecl
import org.sireum.pilar.ast.PilarAstNode
import org.sireum.pilar.ast.PilarAstUtil
import org.sireum.pilar.ast.ProcedureDecl
import org.sireum.pilar.ast.RecordDecl
import org.sireum.pilar.ast.ReturnJump
import org.sireum.pilar.ast.TupleExp
import org.sireum.pilar.ast.TypeAliasDecl
import org.sireum.pilar.ast.TypeExp
import org.sireum.pilar.ast.TypeSpec
import org.sireum.pilar.ast.UnaryExp
import org.sireum.pilar.ast.UnaryOp
import org.sireum.pipeline.Input
import org.sireum.pipeline.Output
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.util.BeginEndLineColumnLocation
import org.sireum.util.Exec
import org.sireum.util.FileLineColumnLocation.pp2flcl
import org.sireum.util.FileResourceUri
import org.sireum.util.IMap
import org.sireum.util.ISeq
import org.sireum.util.Location
import org.sireum.util.MList
import org.sireum.util.PropertyProvider
import org.sireum.util.ResourceUri
import org.sireum.util.SourceLocation.pp2sl
import org.sireum.util.Visitor
import org.sireum.util.VisitorFunction
import org.sireum.util.ilistEmpty
import org.sireum.util.isetEmpty
import org.sireum.util.ivector
import org.sireum.util.ivectorEmpty
import org.sireum.util.mlinkedMapEmpty
import org.sireum.util.mlistEmpty
import org.sireum.util.mmapEmpty
import org.sireum.util.msetEmpty
import org.sireum.util.mstackEmpty

class BakarTranslatorModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarTranslatorModule {

  type BVisitor = Any => Boolean

  val DEBUG = false

  object CTX extends Enumeration {
    type CTX = Value
    val PACKAGE, METHOD = Value
  }

  trait Context {
    val LOCATION_PREFIX = "l"

    var regression = false

    var fileUri : String = null

    var models = mlistEmpty[Model]

    var unhandledSet = msetEmpty[String]

    var countLocation = 0
    var stackLocationList = mstackEmpty[MList[LocationDecl]]
    def pushLocationList = {
      val locs = mlistEmpty[LocationDecl]
      stackLocationList.push(locs)
      locs
    }
    def popLocationList = this.stackLocationList.pop
    def pushLocation(l : LocationDecl) = {
      stackLocationList.top += l
      l
    }

    val contextStack = mstackEmpty[(CTX.Value, String)]
    def pushContext(s : (CTX.Value, String)) = contextStack.push(s)
    def popContext = contextStack.pop

    val exitLocations = mstackEmpty[LocationDecl]
    def pushExitLocation(s : LocationDecl) = exitLocations.push(s)
    def popExitLocation = exitLocations.pop
    def peekExitLocation = exitLocations.top

    var resultStack : PilarAstNode = null;
    def pushResult[T <: PilarAstNode](o : T, sloc : SourceLocation) {
      addSourceLoc(o, sloc)
      resultStack = o
    }
    def popResult = {
      //assert(result != null)
      val t = resultStack
      resultStack = null
      t
    }

    val DUMMY_RET = EmptyBody()
    def getDummyReturnValue[T](r : PilarAstNode) : T = r("ret")
    def setDummyReturn(p : Any) : PilarAstNode = {
      DUMMY_RET("ret") = p
      DUMMY_RET
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

    val globalUriMap = mmapEmpty[ResourceUri, ResourceUri]
    val globalNameMap = mmapEmpty[ResourceUri, String]

    var tempVarCounter = 0
    def genTempVar(typeName : String, typeUri : ResourceUri) = {
      val tempVarPrefix = "_tcomp"
      val name = tempVarPrefix + tempVarCounter
      tempVarCounter += 1
      val path = (this.contextStack.map(_._2)).toList :+ name
      val uri = VariableURIs.tempVarPrefix + path.mkString("/")

      val nts = Some(NamedTypeSpec(URIS.addResourceUri(NameUser(typeName), typeUri), ilistEmpty))
      val lname = URIS.addResourceUri(NameDefinition(name), uri)
      val lvd = LocalVarDecl(nts, lname, ilistEmpty)
      this.localsPush(lvd)

      val ret = NameExp(URIS.addResourceUri(NameUser(name), uri))
      ret(URIS.TYPE_URI) = typeUri
      ret
    }

    def processingPackage = this.contextStack.head._1 == CTX.PACKAGE

    def purifyPath(s : FileResourceUri) = {
      if (!regression) s
      else s.substring(s.lastIndexOf("/") + 1)
    }

    def handleLoc(s : SourceLocation) : Location =
      new BeginEndLineColumnLocation {
        var lineBegin = s.getLine
        var columnBegin = s.getCol
        var lineEnd = s.getEndline
        var columnEnd = s.getEndcol
      }

    def addSourceLoc[T <: PilarAstNode](o : T, sloc : SourceLocation) : T = {
      o match {
        case x : PropertyProvider =>
          import org.sireum.util.SourceLocation._
          x at (purifyPath(this.fileUri), sloc.getLine, sloc.getCol(), sloc.getEndline(), sloc.getEndcol())
        case _ =>
      }
      o
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
          if (DEBUG) println("Don't know how to handle bin op " + o)
          None
        case ModOperatorEx =>
          if (DEBUG) println("Don't know how to handle bin op " + o)
          None

        case _ =>
          None
      }
    }

    /**
     * assumes <code>s</code> will ensure the locations label's uri is unique
     */
    def newLocLabel(s : String) : NameDefinition = {
      countLocation += 1
      val simpName = this.LOCATION_PREFIX + countLocation
      val urlName = simpName + "_" + s
      this.addResourceUri(NameDefinition(simpName), urlName)
    }

    def newLocLabel(s : SourceLocation) : NameDefinition =
      newLocLabel(s.getLine + "." + s.getCol + "_" + s.getEndline + "." + s.getEndcol)

    def createEmptyLocation(locName : NameDefinition, annots : ISeq[Annotation] = ivectorEmpty) = {
      EmptyLocation(Some(locName), annots)
    }

    def createLocation(locName : NameDefinition, a : Action, annots : ISeq[Annotation] = ivectorEmpty) = {
      ActionLocation(Some(locName), annots, a)
    }

    def createPushLocation(a : Action, annots : ISeq[Annotation], s : SourceLocation) : LocationDecl = {
      createPushLocation(newLocLabel(s), a, annots)
    }

    def createPushLocation(locName : NameDefinition, a : Action, annots : ISeq[Annotation] = ivectorEmpty) : LocationDecl = {
      val loc = createLocation(locName, a, annots)
      pushLocation(loc)
      loc
    }

    def createJumpLocation(j : Jump, s : SourceLocation) =
      JumpLocation(Some(newLocLabel(s)), ivectorEmpty, j)

    def createGotoJumpLocation(target : NameUser, annots : ISeq[Annotation], s : SourceLocation) =
      createJumpLocation(GotoJump(annots, target), s)

    def createPushAssignmentLocation(lhs : Exp, rhs : Exp, annots : ISeq[Annotation], s : SourceLocation) = {
      createPushLocation(createAssignment(lhs, rhs, annots), ivectorEmpty, s)
    }

    def createAssignment(lhs : Exp, rhs : Exp, annots : ISeq[Annotation]) = {
      AssignAction(annots, lhs, ":=", rhs)
    }

    def handleUnaryExp(sloc : SourceLocation,
                       op : UnaryOp, exp : Exp, theType : String) : Exp = {
      addSourceLoc(handleExp(addProperty(URIS.TYPE_URI, theType, UnaryExp(op, exp))), sloc)
    }

    def handleBE(sloc : SourceLocation,
                 op : BinaryOp, lhs : Exp, rhs : Exp, theType : String) : Exp = {
      addSourceLoc(handleExp(addProperty(URIS.TYPE_URI, theType, BinaryExp(op, lhs, rhs))), sloc)
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
      //if (this.genThreeAddress)
      //  assignToTemp(e)
      //else
      e
    }

    def addProperty[T <: PropertyProvider](key : String, value : Any, pp : T) : T = {
      if (value == null || value == "") {
        if (DEBUG) println("null/empty value for %s from %s".format(key, pp))
      } else {
        pp.setProperty(key, value)
      }
      pp
    }

    def handleTypeDefinition(o : DefinitionClass, v : => BVisitor) : TypeDef = {
      o.getDefinition match {
        case etd @ EnumerationTypeDefinitionEx(sloc1, enumLiteralDecls, checks) =>
          var elems = ivectorEmpty[(String, ResourceUri)]
          enumLiteralDecls.getDeclarations.foreach {
            case els @ EnumerationLiteralSpecificationEx(sloc2, names, checks) =>
              names.getDefiningNames.foreach {
                case DefiningEnumerationLiteralEx(sloc3, defName, defUri, typ, checks) =>
                  elems +:= (defName, defUri)
              }
            case _ => throw new RuntimeException("Unexpected")
          }
          return EnumerationTypeDef("", elems)

        /** INTEGER TYPES **/
        case std @ SignedIntegerTypeDefinitionEx(sloc1, integerConstraint, checks) =>
          integerConstraint.getRangeConstraint match {
            case SimpleExpressionRangeEx(sloc2, lb, hb, checks) =>
              v(lb)
              val lowBound = ctx.popResult.asInstanceOf[Exp]

              v(hb)
              val highBound = ctx.popResult.asInstanceOf[Exp]

              return SignedIntegerTypeDef("", Some(lowBound), Some(highBound))
            case _ => throw new RuntimeException("Unexpected")
          }
        case mtd @ ModularTypeDefinitionEx(sloc, modStaticExpr, checks) =>

        /** REAL TYPES **/
        //case fpd @ FloatingPointDefinitionEx(_) =>
        //case ofpd @ OrdinaryFixedPointDefinitionEx(_) =>
        //case dfpd @ DecimalFixedPointDefinitionEx(_) =>

        /** ARRAY TYPE **/
        //case uad @ UnconstrainedArrayDefinitionEx(_) =>
        case cad @ ConstrainedArrayDefinitionEx(sloc, discreteSubtypeDefs, arrayComponentDef, checks) =>
          var compTypeName : Option[String] = None
          var compTypeUri : Option[ResourceUri] = None
          arrayComponentDef.getElement match {
            case cd @ ComponentDefinitionEx(sloc, hasAliased, compDefView, checks) =>
              assert(isEmpty(hasAliased.getHasAliased))
              compDefView.getDefinition match {
                case si @ SubtypeIndicationEx(siloc, ha, hne, smark, scons, checks) =>
                  assert(isEmpty(ha.getHasAliased()))
                  assert(isEmpty(hne.getHasNullExclusion))
                  assert(isEmpty(scons.getConstraint))

                  var (_, tname, turi, _) = getName(smark.getExpression)
                  compTypeName = Some(tname)
                  compTypeUri = Some(turi)
                case _ => throw new RuntimeException("Unexpected")
              }
          }

          var indexTypes = ivectorEmpty[ResourceUri]

          val dim = discreteSubtypeDefs.getDefinitions.size
          discreteSubtypeDefs.getDefinitions.foreach {
            case ds @ DiscreteSubtypeIndicationAsSubtypeDefinitionEx(sloc, stmark, stcons, checks) =>
              assert(isEmpty(stcons.getConstraint()))

              val (_, itname, ituri, _) = getName(stmark)
              indexTypes :+= ituri
            case _ => throw new RuntimeException("Unexpected")
          }

          return ConstrainedArrayDef("", dim, compTypeUri.get, indexTypes)

        /** RECORD TYPES **/
        case rtd @ RecordTypeDefinitionEx(rsloc, hasAbs, hasLim, recDef, checks) =>
          assert(this.isEmpty(hasAbs.getHasAbstract()))
          assert(this.isEmpty(hasLim.getHasLimited()))

          val components = mlinkedMapEmpty[String, ComponentDef]
          recDef.getDefinition match {
            case rde @ RecordDefinitionEx(rdsloc, hasLim, recordComponents, checks) =>
              assert(this.isEmpty(hasLim.getHasLimited()))

              for (rc <- recordComponents.getRecordComponents) {
                rc match {

                  case cd @ ComponentDeclarationEx(rcsloc, names, hasAliased,
                    objDecView, initExp, aspectSpec, checks) =>
                    assert(this.isEmpty(hasAliased.getHasAliased()))
                    assert(this.isEmpty(initExp.getExpression()))
                    assert(aspectSpec.getElements().isEmpty())

                    var typeName : Option[String] = None
                    var typeUri : Option[String] = None

                    objDecView.getDefinition match {
                      case cd @ ComponentDefinitionEx(sloc, ha, compDefView, checks) =>
                        assert(isEmpty(ha.getHasAliased()))
                        compDefView.getDefinition match {
                          case si @ SubtypeIndicationEx(siloc, ha, hne, smark, scons, checks) =>
                            assert(isEmpty(ha.getHasAliased()))
                            assert(isEmpty(hne.getHasNullExclusion))
                            assert(isEmpty(scons.getConstraint))

                            var (_, tname, turi, _) = getName(smark.getExpression)
                            typeName = Some(tname)
                            typeUri = Some(turi)
                        }
                    }

                    names.getDefiningNames.foreach { n =>
                      val (csloc, cname, curi, ctype) = this.getName(n)
                      components(cname) = ComponentDef(curi, typeName.get, typeUri.get,
                        handleLoc(csloc))
                    }
                  case _ => throw new RuntimeException("Unexpected")
                }
              }
          }
          return RecordTypeDef("que", false, components.toMap)
        case _ => throw new RuntimeException("Unexpected")
      }
      println(o.getDefinition())
      throw new RuntimeException()
    }

    def handleAttribute(attr : String, typeName : NameExp, typUri : String) = {
      val ts = addprop(TypeExp(NamedTypeSpec(typeName.name, ivectorEmpty)), URIS.TYPE_URI, typUri)
      val nu = addResourceUri(NameUser(attr), Attribute.attributeURIprefix + attr)
      val ne = NameExp(nu)
      val ce = addprop(CallExp(ne, ts), URIS.TYPE_URI, typUri)
      ce
    }

    def handleTypeDeclaration(o : Base, v : => BVisitor) : PackageElement = {
      o match {
        case otd @ OrdinaryTypeDeclarationEx(sloc, names, discriminantPart,
          typeDecView, aspectSpecs, checks) =>
          assert(names.getDefiningNames.size == 1)
          assert(this.isEmpty(discriminantPart.getDefinition))
          assert(aspectSpecs.getElements.isEmpty)

          val (tsloc, tname, turi, ttyp) = getName(names.getDefiningNames.head)

          this.handleTypeDefinition(typeDecView, v) match {
            case sit : SignedIntegerTypeDef =>
              val tad = TypeAliasDecl(NameDefinition(tname), ivectorEmpty,
                NamedTypeSpec(NameUser("_SIGNED_INTEGER_TYPE_"), ilistEmpty[TypeSpec]))
              tad(URIS.TYPE_DEF) = sit
              tad(URIS.TYPE_URI) = turi
              tad(URIS.REF_URI) = turi
              return tad
            case etd : EnumerationTypeDef =>
              val tad = TypeAliasDecl(NameDefinition(tname), ivectorEmpty,
                NamedTypeSpec(NameUser("_ENUMERATION_TYPE_"), ilistEmpty[TypeSpec]))
              tad(URIS.TYPE_DEF) = etd
              tad(URIS.TYPE_URI) = turi
              tad(URIS.REF_URI) = turi
              return tad
            case cad : ConstrainedArrayDef =>
              val tad = TypeAliasDecl(NameDefinition(tname),
                ivectorEmpty,
                NamedTypeSpec(NameUser("_ARRAY_"), ilistEmpty[TypeSpec]))
              tad(URIS.TYPE_DEF) = cad
              tad(URIS.TYPE_URI) = turi
              tad(URIS.REF_URI) = turi
              return tad
            case rtd : RecordTypeDef =>
              var attrs = ivectorEmpty[AttributeDecl]
              for ((k, v) <- rtd.components) {
                val attr = AttributeDecl(
                  NameDefinition(k),
                  ivectorEmpty,
                  Some(NamedTypeSpec(NameUser(v.typeName), ilistEmpty[TypeSpec])),
                  None
                )
                attr(URIS.REF_URI) = v.refUri
                attr(URIS.TYPE_URI) = v.typeUri
                attrs :+= attr
              }
              val rd = RecordDecl(
                NameDefinition(tname),
                ivectorEmpty,
                ilistEmpty[(NameDefinition, ISeq[Annotation])],
                ilistEmpty[ExtendClause],
                attrs
              )
              rd(URIS.TYPE_DEF) = rtd
              rd(URIS.TYPE_URI) = turi

              rd(URIS.REF_URI) = turi
              return rd
            case _ => throw new RuntimeException("Unexpected")
          }
        case std @ SubtypeDeclarationEx(sloc, names, typeDeclView, aspectSpecs, checks) =>
          assert(names.getDefiningNames().size == 1)
          assert(aspectSpecs.getElements().isEmpty())

          val (tsloc, tname, turi, ttyp) = getName(names.getDefiningNames.head)

          typeDeclView.getDefinition match {
            case si @ SubtypeIndicationEx(sloc, hasAliased, hasNullEx, subtypeMark,
              subtypeCons, checks) =>
              assert(this.isEmpty(hasAliased.getHasAliased()))
              assert(this.isEmpty(hasNullEx.getHasNullExclusion()))

              val (ssloc, sname, suri, styp) = getName(subtypeMark)

              var cons : Option[Constraint] = None
              if (!this.isEmpty(subtypeCons.getConstraint())) {
                subtypeCons.getConstraint() match {
                  case ser @ SimpleExpressionRangeEx(sloc, lower, upper, checks) =>
                    v(lower)
                    val l = this.popResult.asInstanceOf[Exp]

                    v(upper)
                    val u = this.popResult.asInstanceOf[Exp]

                    cons = Some(SimpleRangeConstraint(l, u))
                }
              }

              val std = SubTypeDecl(tname, turi, suri, cons)
              val tad = TypeAliasDecl(NameDefinition(tname),
                ivectorEmpty,
                NamedTypeSpec(NameUser(sname), ilistEmpty[TypeSpec]))

              tad(URIS.TYPE_DEF) = std
              tad(URIS.TYPE_URI) = turi
              tad(URIS.REF_URI) = turi

              return tad
            case _ => throw new RuntimeException("Unexpected")
          }
        case _ => throw new RuntimeException("Unexpected")
      }
    }

    def addResourceUri[T <: org.sireum.pilar.symbol.Symbol](s : T, uri : String) = {
      URIS.addResourceUri(s, uri)
    }

    /**
     * the uri's generated by gnat2xml for globals doesn't provide any
     * indication that the uri refers to a global variable.  For example, the
     * global variable 'G' may have the uri 'ada://variable/P-3:9/G+2:5'.
     * Simply observing that it is the 3rd element in the path (a local var
     * or parameter would have the procedure's name as the 3rd element) is not
     * enough since nested and child packages could have paths that contain
     * 4+ elements.
     *
     * Furthermore, parts of sireum expect global uri's to contain @@ before
     * the globals name -- e.g. refer to how org.sireum.pilar.state.State
     * determines where to store a variables value.
     */
    def convertGlobal(name : String, uri : ResourceUri) : (String, ResourceUri) = {
      var i = uri.lastIndexOf("/")
      assert(i > 0)
      val returi = uri.substring(0, i + 1) + "@@" + uri.substring(i + 1)
      val retname = "@@" + name

      this.globalUriMap(uri) = returi
      this.globalNameMap(uri) = retname

      (retname, returi)
    }

    def copyPropertyMap[I <: PropertyProvider](a : I, b : I) : I = {
      b.propertyMap ++= a.propertyMap
      b
    }

    def rewriteName(uri : ResourceUri, name : String) = globalNameMap.getOrElse(uri, name)
    def rewriteUri(uri : ResourceUri) : ResourceUri = globalUriMap.getOrElse(uri, uri)

    def getName(o : Base) : (SourceLocation, String, String, String) = {
      o match {
        case e @ ExpressionClassEx(exp) => getName(exp)
        case di @ DefiningIdentifierEx(sloc, defName, defUri, typ, checks) =>
          (sloc, rewriteName(defUri, defName), rewriteUri(defUri), typ)
        case i @ IdentifierEx(sloc, refName, refUri, typ, checks) =>
          (sloc, rewriteName(refUri, refName), rewriteUri(refUri), typ)
        case _ => throw new RuntimeException("Unexpected")
      }
    }

    def stripParens(x : Base) : Base = {
      x match {
        case o : ParenthesizedExpression => stripParens(o.getExpressionParenthesizedQ())
        case o : ExpressionClass         => stripParens(o.getExpression)
        case _                           => x
      }
    }
  }

  implicit def nu2nd(nu : NameUser) = {
    val nd = NameDefinition(nu.name)
    nd.propertyMap ++= nu.propertyMap
    nd
  }

  implicit def nd2nu(nd : NameDefinition) = {
    val nu = NameUser(nd.name)
    nu.propertyMap ++= nd.propertyMap
    nu
  }

  implicit def addprop[T <: PropertyProvider](pp : T, key : String, value : Any, required : Boolean = false) : T = {
    if (value == null || value == "null" || value == "") {
      if (DEBUG) Console.err.println(s"null/empty value for $key from $pp")
      if (required)
        throw new RuntimeException("Missing required type")
    } else {
      pp.setProperty(key, value)
    }
    pp
  }

  def packageH(ctx : Context, v : => BVisitor) : VisitorFunction = {

      def createPackageInitProcedure(locs : MList[LocationDecl], isSpec : Boolean = false) = {
        val name = if (isSpec) "$$sinit"
        else "$$binit"

        val path = (ctx.contextStack.map(_._2)).toList :+ name
        val uri = if (isSpec) PackageURIs.initSpecProcedureURIprefix + path.mkString("/")
        else PackageURIs.initBodyProcedureURIprefix + path.mkString("/")

        val nd = ctx.addResourceUri(NameDefinition(name), uri)

        locs += JumpLocation(Some(ctx.newLocLabel(path.mkString("_"))), ivectorEmpty,
          ReturnJump(ivectorEmpty, None))

        ProcedureDecl(nd, ivectorEmpty,
          ivectorEmpty, ivectorEmpty, None, false,
          ImplementedBody(ivectorEmpty, locs.toList, ivectorEmpty))
      }

    {
      case o @ CompilationUnitEx(sloc, contextClauseElements, unitDeclaration,
        pragmasAfter, unitKind, unitClass, unitOrigin, unitFullName, defName, sourceFile, checks) =>

        if (!contextClauseElements.getContextClauses().isEmpty)
          if (DEBUG) Console.err.println("Need to handle context clauses")

        v(unitDeclaration)

        ctx.popResult match {
          case p : PackageDecl =>
            ctx.models += Model(Some(sourceFile), ivectorEmpty[Annotation], ivector(p))
          case x =>
            if (DEBUG) println("Expecting a PackageDecl, received " + x)
        }

        false
      case o @ PackageDeclarationEx(sloc, names, aspectSpec,
        visiblePartDecItems, privatePartDecItems, checks) =>
        if (DEBUG) println(o.getClass().getSimpleName())

        assert(names.getDefiningNames.length == 1)
        v(names.getDefiningNames.head)
        val pname = ctx.popResult.asInstanceOf[NameExp]

        ctx.pushContext((CTX.PACKAGE, pname.name.name))

        if (!aspectSpec.getElements().isEmpty())
          if (DEBUG) Console.err.println("Need to handle package spec aspect clauses: " + pname)

        val packElems = mlistEmpty[PackageElement]

        val publicTypes = TranslatorUtil.getTypeDeclarations(visiblePartDecItems.getDeclarativeItems)
        val privateTypes = TranslatorUtil.getTypeDeclarations(privatePartDecItems.getDeclarativeItems)

        for (td <- publicTypes) {
          packElems += ctx.handleTypeDeclaration(td, v)
          // TODO: add symbol entry        
        }
        for (td <- privateTypes) {
          packElems += ctx.handleTypeDeclaration(td, v)
          // TODO: add symbol entry        
        }

        val publicGlobals = TranslatorUtil.getGlobalDeclarations(visiblePartDecItems.getDeclarativeItems)
        val privateGlobals = TranslatorUtil.getGlobalDeclarations(privatePartDecItems.getDeclarativeItems)

        val ll = ctx.pushLocationList
        for (g <- publicGlobals) {
          v(g)
          packElems ++= ctx.getDummyReturnValue(ctx.popResult)
          // TODO: add symbol entry
        }
        for (g <- privateGlobals) {
          v(g)
          packElems ++= ctx.getDummyReturnValue(ctx.popResult)
          // TODO: add symbol entry        
        }
        val _ll = ctx.popLocationList
        assert(ll eq _ll)

        if (!_ll.isEmpty) {
          // create an init procedure
          packElems += createPackageInitProcedure(_ll, true)
        }

        val publicConstants = TranslatorUtil.getConstantDeclarations(visiblePartDecItems.getDeclarativeItems)
        val privateConstants = TranslatorUtil.getConstantDeclarations(privatePartDecItems.getDeclarativeItems)

        val consts = mlistEmpty[ConstElement]
        for (c <- publicConstants) {
          v(c)
          consts ++= ctx.getDummyReturnValue(ctx.popResult)
        }
        for (c <- privateConstants) {
          v(c)
          consts ++= ctx.getDummyReturnValue(ctx.popResult)
        }
        if (!consts.isEmpty)
          packElems += ConstDecl(NameDefinition("$CONST"), ivectorEmpty, consts.toList)

        val publicMethods = TranslatorUtil.getMethodDeclarations(visiblePartDecItems.getDeclarativeItems)
        val privateMethods = TranslatorUtil.getMethodDeclarations(privatePartDecItems.getDeclarativeItems)

        for (m <- publicMethods) {
          v(m)
          packElems += ctx.popResult.asInstanceOf[ProcedureDecl]
        }
        for (m <- privateMethods) {
          v(m)
          packElems += ctx.popResult.asInstanceOf[ProcedureDecl]
        }

        val pack = PackageDecl(Some(pname.name), ivectorEmpty, packElems.toList)
        ctx.pushResult(pack, sloc)
        ctx.popContext
        false
      case o @ PackageBodyDeclarationEx(sloc, names, aspectSpec,
        bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>

        assert(bodyExceptionHandlers.getExceptionHandlers().isEmpty())

        assert(names.getDefiningNames().length == 1)
        val (pnameLoc, _pname, _puri, _) = ctx.getName(names.getDefiningNames.head)
        val pname = URIS.addResourceUri(NameDefinition(_pname), _puri)

        ctx.pushContext((CTX.PACKAGE, _pname))

        val packElems = mlistEmpty[PackageElement]

        for (td <- TranslatorUtil.getTypeDeclarations(bodyDecItems.getElements)) {
          packElems += ctx.handleTypeDeclaration(td, v)
        }

        if (!aspectSpec.getElements().isEmpty())
          if (DEBUG) Console.err.println("Need to handle package body aspect clauses")

        val consts = mlistEmpty[ConstElement]
        for (c <- TranslatorUtil.getConstantDeclarations(bodyDecItems.getElements)) {
          v(c)
          consts ++= ctx.getDummyReturnValue(ctx.popResult)
        }
        if (!consts.isEmpty)
          packElems += ConstDecl(NameDefinition("$CONST"), ivectorEmpty, consts.toList)

        val ll = ctx.pushLocationList
        for (f <- TranslatorUtil.getGlobalDeclarations(bodyDecItems.getElements)) {
          v(f)
          packElems ++= ctx.getDummyReturnValue(ctx.popResult)
        }

        // process package init block
        v(bodyStatements)

        val _ll = ctx.popLocationList
        assert(ll eq _ll)

        if (!_ll.isEmpty) {
          // create an init procedure
          packElems += createPackageInitProcedure(_ll, false)

        }

        for (m <- TranslatorUtil.getMethodDeclarations(bodyDecItems.getElements)) {
          v(m)
          packElems += ctx.popResult.asInstanceOf[ProcedureDecl]
        }

        val pack = PackageDecl(Some(pname), ivectorEmpty, packElems.toList)
        ctx.pushResult(pack, sloc)

        ctx.popContext
        false
      case vd @ VariableDeclarationEx(sloc, names, hasAliased, objDecView, initExpr, aspectSpec, checks) =>
        assert(ctx.isEmpty(hasAliased.getHasAliased))
        assert(aspectSpec.getElements.isEmpty)

        v(objDecView)
        val odv = ctx.popResult.asInstanceOf[NameExp]
        val typeSpec = Some(NamedTypeSpec(odv.name, ivectorEmpty[TypeSpec]))

        val varDecls = mlistEmpty[PilarAstNode]
        names.getDefiningNames.foreach {
          case di : DefiningIdentifier =>
            val (sloc, defName, defUri, typ) = ctx.getName(di)
            val (cdefName, cdefUri) =
              if (ctx.processingPackage) ctx.convertGlobal(defName, defUri)
              else (defName, defUri)

            val name = ctx.addResourceUri(NameDefinition(cdefName), cdefUri)

            val vd = if (ctx.processingPackage)
              GlobalVarDecl(name, ivectorEmpty, typeSpec)
            else
              LocalVarDecl(typeSpec, name, ivectorEmpty)

            if (!ctx.isEmpty(initExpr.getExpression)) {
              var lhs = addprop(NameExp(ctx.addResourceUri(NameUser(cdefName), cdefUri)),
                URIS.TYPE_URI, typ)
              v(initExpr.getExpression)
              val rhs = ctx.popResult.asInstanceOf[Exp]
              ctx.createPushAssignmentLocation(lhs, rhs, ivectorEmpty, sloc)
            }

            varDecls += ctx.addSourceLoc(vd, sloc)
          case _ => throw new RuntimeException("Unexpected")
        }

        ctx.pushResult(ctx.setDummyReturn(varDecls), sloc)
        false
      case o @ RealNumberDeclarationEx(sloc1, names, initExp, checks) =>
        v(initExp)
        val ie = CastExp(
          NamedTypeSpec(addprop(NameUser("Float"), URIS.TYPE_URI, StandardURIs.floatURI), ivectorEmpty),
          ctx.popResult.asInstanceOf[Exp])

        val constElems = mlistEmpty[ConstElement]
        for (n <- names.getDefiningNames) {
          v(n)
          val constName = ctx.popResult.asInstanceOf[NameExp]
          constElems += ConstElement(constName.name, ie, ivectorEmpty)
        }
        ctx.pushResult(ctx.setDummyReturn(constElems), sloc1)
        false
      case o @ IntegerNumberDeclarationEx(sloc1, names, initExp, checks) =>
        v(initExp)
        val ie = CastExp(NamedTypeSpec(addprop(NameUser("Integer"), URIS.TYPE_URI, StandardURIs.integerURI), ivectorEmpty),
          ctx.popResult.asInstanceOf[Exp])

        val constElems = mlistEmpty[ConstElement]
        for (n <- names.getDefiningNames) {
          v(n)
          val constName = ctx.popResult.asInstanceOf[NameExp]
          constElems += ConstElement(constName.name, ie, ivectorEmpty)
        }
        ctx.pushResult(ctx.setDummyReturn(constElems), sloc1)
        false
    }
  }

  def methodH(ctx : Context, v : => BVisitor) : VisitorFunction = {
      def handleMethod(sloc : SourceLocation,
                       names : DefiningNameList,
                       paramProfile : ParameterSpecificationList,
                       bodyDeclItems : Option[ElementList],
                       bodyStatements : Option[StatementList],
                       resultProfile : Option[ElementClass],
                       aspectSpecs : ElementList,
                       isOverridingDec : Base,
                       isNotOverridingDec : Base) = {

        assert(ctx.isEmpty(isOverridingDec))
        assert(ctx.isEmpty(isNotOverridingDec))

        import org.sireum.util.FileLineColumnLocation._
        assert(names.getDefiningNames().length == 1)
        val (sloc, methodDefName, methodDefUri, methodTypeUri) = ctx.getName(names.getDefiningNames.get(0))
        val mname = ctx.addResourceUri(NameDefinition(methodDefName), methodDefUri)
        mname at (ctx.fileUri, sloc.getLine(), sloc.getCol())

        //ctx.pushNameStack(methodDefName)
        ctx.pushContext((CTX.METHOD, methodDefName))

        val params = mlistEmpty[ParamDecl]
        paramProfile.getParameterSpecifications.foreach {
          case ps @ ParameterSpecificationEx(sloc, pnames, _hasAliased, _hasNullEx,
            objDecView, _initExpr, mode, checks) =>
            // e.g (I : Integer) or (I, J : 
            assert(ctx.isEmpty(_hasAliased.getHasAliased()))
            assert(ctx.isEmpty(_hasNullEx.getHasNullExclusion()))
            assert(ctx.isEmpty(_initExpr.getExpression()))

            v(objDecView.getDefinition)
            val odv = ctx.popResult.asInstanceOf[NameExp]

            pnames.getDefiningNames().foreach {
              case pname : DefiningIdentifier =>
                val (sloc, defName, defUri, typ) = ctx.getName(pname)
                val name = ctx.addResourceUri(NameDefinition(pname.getDefName), defUri)
                val typeSpec = Some(NamedTypeSpec(odv.name, ivectorEmpty[TypeSpec]))

                val pd = ParamDecl(typeSpec, name, ivectorEmpty)
                pd(URIS.REF_URI) = defUri

                import org.sireum.bakar.symbol.BakarSymbol._
                pd.mode(mode)

                params += ctx.addSourceLoc(pd, sloc)
              case _ => throw new RuntimeException("Unexpected")
            }
          case _ => throw new RuntimeException("Unexpected")
        }

        ctx.localsInit
        ctx.pushLocationList

        if (bodyDeclItems.isDefined) {
          for (local <- bodyDeclItems.get.getElements) {
            v(local)
            val ls : MList[LocalVarDecl] = ctx.getDummyReturnValue(ctx.popResult)
            ls.foreach(lvd => ctx.localsPush(lvd))
          }
        }

        if (bodyStatements.isDefined) {
          v(bodyStatements.get)
        }

        val returnType : Option[TypeSpec] = resultProfile match {
          case Some(e) =>
            v(e)
            val ne = ctx.popResult.asInstanceOf[NameExp]
            val nts = NamedTypeSpec(ne.name, ivectorEmpty[TypeSpec])
            ne.propertyMap.foreach { case (key, value) => nts.setProperty(key, value) }
            Some(nts)
          case None => {
            // ada procedure so add an empty return to the body
            ctx.pushLocation(
              JumpLocation(Some(ctx.newLocLabel(sloc)), ivectorEmpty,
                ReturnJump(ivectorEmpty, None)))
            None
          }
        }

        val locs = ctx.popLocationList.toList
        val localVars = ctx.localsPop.toList
        val body = if (bodyDeclItems.isDefined)
          ImplementedBody(localVars, locs, ivectorEmpty)
        else
          EmptyBody()

        val typeVars = ivectorEmpty[(NameDefinition, ISeq[Annotation])]
        val varArity = false
        val pd = ProcedureDecl(mname, ivectorEmpty, typeVars, params.toList,
          returnType, varArity, body)

        pd(URIS.REF_URI) = methodDefUri

        aspectSpecs.getElements.foreach {
          case as @ AspectSpecificationEx(sloc, mark, defs, checks) =>
            val (_, m, _, _) = ctx.getName(mark.getElement)
            m.toLowerCase match {
              case "global" =>
                var ins = isetEmpty[ResourceUri]
                var outs = isetEmpty[ResourceUri]
                var proofs = isetEmpty[ResourceUri]

                defs.getElement match {
                  case ra @ RecordAggregateEx(rasloc, associations, _, checks) =>
                    associations.getAssociations.foreach {
                      case rca @ RecordComponentAssociationEx(_, choices, exp, checks) =>
                        var items = isetEmpty[ResourceUri]
                        ctx.stripParens(exp.getExpression) match {
                          case paa @ PositionalArrayAggregateEx(sloc, arrassoc, typ, checks) =>
                            arrassoc.getAssociations.foreach {
                              case ArrayComponentAssociationEx(_, _choices, _exp, checks) =>
                                assert(_choices.getElements.isEmpty)
                                val (_, _, refuri, _) = ctx.getName(ctx.stripParens(_exp.getExpression))
                                items += refuri
                            }
                          case i @ IdentifierEx(_, refname, refuri, _, checks) =>
                            items += ctx.rewriteUri(refuri)
                        }

                        assert(choices.getExpressions.size == 1)
                        val (_, mode, _, _) = ctx.getName(choices.getExpressions.head)
                        mode.toLowerCase match {
                          case "input"  => ins ++= items
                          case "output" => outs ++= items
                          case "in_out" =>
                            ins ++= items
                            outs ++= items
                          case "proof_in" => proofs ++= items
                        }
                    }
                }

                import org.sireum.bakar.symbol.BakarSymbol._
                if (!ins.isEmpty) pd.globalsIn(ins)
                if (!outs.isEmpty) pd.globalsOut(outs)
                if (!proofs.isEmpty) pd.globalsProof(proofs)
              case _ => throw new RuntimeException("Not hanlding aspect: " + m)
            }
        }
        ctx.popContext
        pd
      }

    {
      case o @ ProcedureDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, hasAbstract, aspectSpec, checks) =>

        assert(ctx.isEmpty(hasAbstract.getHasAbstract))

        val m = handleMethod(sloc, names, paramProfile, None, None, None,
          aspectSpec, isOverridingDec.getIsOverriding,
          isNotOverridingDec.getIsNotOverriding)

        ctx.pushResult(m, sloc)
        false
      case o @ FunctionDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, isNotNullReturn, resultProfile, hasAbstract, aspectSpec, checks) =>

        assert(ctx.isEmpty(isNotNullReturn.getIsNotNullReturn))
        assert(ctx.isEmpty(hasAbstract.getHasAbstract))

        val m = handleMethod(sloc, names, paramProfile, None, None,
          Some(resultProfile),
          aspectSpec, isOverridingDec.getIsOverriding,
          isNotOverridingDec.getIsNotOverriding)

        ctx.pushResult(m, sloc)
        false
      case o @ ProcedureBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, aspectSpec, bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>

        assert(bodyExceptionHandlers.getExceptionHandlers.isEmpty)

        val m = handleMethod(sloc, names, paramProfile, Some(bodyDecItems),
          Some(bodyStatements), None, aspectSpec,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())
        ctx.pushResult(m, sloc)

        false
      case o @ FunctionBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, isNotNullReturn, resultProfile, aspectSpec,
        bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>

        assert(ctx.isEmpty(isNotNullReturn.getIsNotNullReturn()))
        assert(bodyExceptionHandlers.getExceptionHandlers.isEmpty)

        val m = handleMethod(sloc, names, paramProfile, Some(bodyDecItems),
          Some(bodyStatements), Some(resultProfile), aspectSpec,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())
        ctx.pushResult(m, sloc)

        false
    }
  }

  def nameH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o : Identifier =>
      val (sloc, name, refUri, typeUri) = ctx.getName(o)

      val nu = ctx.addResourceUri(NameUser(name), refUri)
      this.addprop(nu, URIS.REF_URI, refUri)
      this.addprop(nu, URIS.TYPE_URI, typeUri)

      val ne = this.addprop(NameExp(nu), URIS.TYPE_URI, typeUri)
      ctx.pushResult(ne, sloc)
      false
    case o : DefiningIdentifier =>
      val (sloc, name, refUri, typUri) = ctx.getName(o)

      val nu = ctx.addResourceUri(NameUser(name), refUri)
      this.addprop(nu, URIS.REF_URI, refUri)
      this.addprop(nu, URIS.TYPE_URI, typUri)

      ctx.pushResult(NameExp(nu), sloc)
      false
    case o @ SelectedComponentEx(sloc, prefix, selector, theType, checks) =>

      v(prefix.getExpression())
      val p = ctx.popResult.asInstanceOf[Exp]

      val (_, sname, suri, _) = ctx.getName(selector)

      // TODO: need to type prefix to determine if this is a 
      // AccessExp, field lookup, etc...
      var ret : Option[Exp] = None
      p match {
        case NameExp(ns) =>
          ret = Some(NameExp(NameUser(ns.name + "::" + sname)))
        case x : IndexingExp =>
          ret = Some(AccessExp(x, NameUser(sname)))
        case q =>
          if (DEBUG) println("what to do with " + q)
          assert(false)
      }
      assert(ret.isDefined)

      ctx.pushResult(ret.get, sloc)
      false
    case o @ (
      NameClassEx(_) |
      DefiningNameClassEx(_) |
      DefiningExpandedNameEx(_)
      ) =>
      if (DEBUG) println("nameH: need to handle: " + o.getClass().getSimpleName())
      true
  }

  def statementH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ AssignmentStatementEx(sloc, labelName, assignmentVariableName, assignmentExpression, checks) =>

      v(assignmentVariableName)
      val lhs = ctx.popResult.asInstanceOf[Exp]

      v(assignmentExpression)
      val rhs = ctx.popResult.asInstanceOf[Exp]

      ctx.createPushAssignmentLocation(lhs, rhs, ivectorEmpty, sloc)
      false
    case o @ IfStatementEx(sloc, labelNames, statementPaths, checks) =>
      val isSingle = statementPaths.getPaths.size == 1
      val endLoc = ctx.newLocLabel(sloc)
      var gotoLoc = if (isSingle) endLoc else ctx.newLocLabel(sloc)

        def render(sloc : SourceLocation, condExp : ExpressionClass, statements : StatementList, isIfElse : Boolean) = {
          if (isIfElse) {
            // #<gotoLoc>.
            ctx.pushLocation(ctx.createEmptyLocation(gotoLoc, ivectorEmpty))
            gotoLoc = ctx.newLocLabel(sloc)
          }

          v(condExp)

          // #l0. if(!condExp) then goto <gotoLoc>;
          val ne = UnaryExp(PilarAstUtil.NOT_UNOP, ctx.popResult.asInstanceOf[Exp])
          addprop(ne, URIS.TYPE_URI, StandardURIs.boolURI)
          val itj = IfThenJump(ne, ivectorEmpty, gotoLoc)
          val ij = IfJump(ivectorEmpty, ivector(itj), None)
          val jl = JumpLocation(Some(ctx.newLocLabel(sloc)), ivectorEmpty, ij)
          ctx.pushLocation(jl)

          // ... eval body statements
          v(statements)

          if (!isSingle) {
            // # goto endLoc;
            val gl = ctx.createGotoJumpLocation(endLoc, ivectorEmpty, sloc)
            ctx.pushLocation(gl)
          }
        }

      statementPaths.getPaths().foreach {
        case IfPathEx(sloc, condExp, statements, checks) =>
          render(sloc, condExp, statements, false)
        case ElsifPathEx(sloc, condExp, statements, checks) =>
          render(sloc, condExp, statements, true)
        case ElsePathEx(sloc, statements, checks) =>
          // #<gotoLoc>.
          ctx.pushLocation(ctx.createEmptyLocation(gotoLoc, ivectorEmpty))

          v(statements)

        case x =>
          throw new RuntimeException("Not expecting " + x)
      }

      ctx.pushLocation(ctx.createEmptyLocation(endLoc))

      false
    case o @ CaseStatementEx(sloc, labelnames, caseExpression, statementPaths, checks) =>
      if (DEBUG) println(o.getClass().getSimpleName())
      true
    case o @ LoopStatementEx(sloc, labelNames, statementIdentifier, loopStatements, checks) =>
      assert(labelNames.getDefiningNames().isEmpty())

      // TODO: currently ignoring statementIdentifier

      // #loopStart.
      val loopStart = ctx.pushLocation(ctx.createEmptyLocation(ctx.newLocLabel(sloc)))

      val endLoc = ctx.createEmptyLocation(ctx.newLocLabel(sloc), ivectorEmpty)
      ctx.pushExitLocation(endLoc)

      v(loopStatements)

      // # goto loopStart
      val gl = ctx.pushLocation(ctx.createGotoJumpLocation(loopStart.name.get, ivectorEmpty, sloc))

      ctx.pushLocation(endLoc)

      val _exit = ctx.popExitLocation
      assert(_exit == endLoc)

      false
    case o @ WhileLoopStatementEx(sloc, labelNames, statementIdentifier,
      whileCondition, loopStatements, checks) =>
      if (DEBUG) println(o.getClass().getSimpleName())

      val endLoc = ctx.createEmptyLocation(ctx.newLocLabel(sloc), ivectorEmpty)
      ctx.pushExitLocation(endLoc)

      // #loopStart.
      val loopStart = ctx.pushLocation(ctx.createEmptyLocation(ctx.newLocLabel(sloc)))

      v(whileCondition)

      // # if (!loopCond) goto endLocLabel;
      val ne = UnaryExp(PilarAstUtil.NOT_UNOP, ctx.popResult.asInstanceOf[Exp])
      addprop(ne, URIS.TYPE_URI, StandardURIs.boolURI)
      val itj = IfThenJump(ne, ivectorEmpty, endLoc.name.get)
      val ij = IfJump(ivectorEmpty, ivector(itj), None)
      val jl = JumpLocation(Some(ctx.newLocLabel(sloc)), ivectorEmpty, ij)
      ctx.pushLocation(jl)

      v(loopStatements)

      // # goto loopStart
      val gl = ctx.pushLocation(ctx.createGotoJumpLocation(loopStart.name.get, ivectorEmpty, sloc))

      ctx.pushLocation(endLoc)
      val _exit = ctx.popExitLocation
      assert(_exit == endLoc)

      false
    case o @ ForLoopStatementEx(sloc, labelnames, statementIdentifier,
      forLoopParameterSpecification, loopStatements, checks) =>
      assert(ctx.isEmpty(statementIdentifier.getDefiningName))
      assert(labelnames.getDefiningNames.isEmpty)

      forLoopParameterSpecification.getDeclaration match {
        case lps @ LoopParameterSpecificationEx(sloc, names, hasRev, range, checks) =>
          assert(names.getDefiningNames.size == 1)

            def unique(s : String, i : Int = -1) : String = {
              if (ctx.locals.find(e => (i == -1 && e.name.name == s) || e.name.name == s + i).isDefined)
                unique(s, i + 1)
              else if (i == -1) s else s + i
            }

          v(names.getDefiningNames().head)
          var iterNE = ctx.popResult.asInstanceOf[NameExp]

          val uiter = unique(iterNE.name.name)
          if (uiter != iterNE.name.name) {
            iterNE = ctx.copyPropertyMap(iterNE,
              NameExp(ctx.copyPropertyMap(iterNE.name, NameUser(uiter))))
          }

          val isRev = !ctx.isEmpty(hasRev.getHasReverse())

          val endLoc = ctx.createEmptyLocation(ctx.newLocLabel(sloc), ivectorEmpty)
          ctx.pushExitLocation(endLoc)

          range.getDiscreteSubtypeDefinition match {
            case DiscreteSubtypeIndicationAsSubtypeDefinitionEx(rsloc, mark, constraint, checks) =>

              v(mark)
              val markNE = ctx.popResult.asInstanceOf[NameExp]
              val markURI : String = markNE.name(URIS.REF_URI)

              addprop(iterNE, URIS.TYPE_URI, markURI)

              // introduce a local variable for iterVar
              val typeSpec = Some(NamedTypeSpec(markNE.name, ivectorEmpty[TypeSpec]))
              val lvd = LocalVarDecl(typeSpec, iterNE.name, ivectorEmpty)
              ctx.localsPush(lvd)

              val (lowBound, highBound) =
                if (!ctx.isEmpty(constraint.getConstraint())) {
                  constraint.getConstraint match {
                    case SimpleExpressionRangeEx(rsloc, low, high, checks) =>
                      v(low)
                      val lb = ctx.popResult.asInstanceOf[Exp]

                      v(high)
                      val hb = ctx.popResult.asInstanceOf[Exp]

                      (lb, hb)
                    case RangeAttributeReferenceEx(rsloc, rangeAttribute, checks) =>
                      // TODO:
                      (null, null)
                  }
                } else {
                  // $First ^Mark .. $Last ^Mark
                  val lb = ctx.handleAttribute(Attribute.ATTRIBUTE_UIF_FIRST, markNE, markURI)
                  val hb = ctx.handleAttribute(Attribute.ATTRIBUTE_UIF_LAST, markNE, markURI)
                  (lb, hb)
                }

              // NOTE: in ADA the loop bounds are fixed by the initial values of 
              //       the low and high ranges assigned to the iter var.  So we
              //       assign the low/high bound exp to temp vars since their
              //       interpretation could change during the loop
              val lowtemp = ctx.genTempVar(markNE.name.name, markURI)
              ctx.createPushAssignmentLocation(lowtemp, lowBound, ivectorEmpty, sloc)
              val hightemp = ctx.genTempVar(markNE.name.name, markURI)
              ctx.createPushAssignmentLocation(hightemp, highBound, ivectorEmpty, sloc)

              // null range check
              val be = ctx.handleBE(sloc, PilarAstUtil.GT_BINOP, lowtemp, hightemp, StandardURIs.boolURI)
              val itj = IfThenJump(be, ivectorEmpty, endLoc.name.get)
              val ij = IfJump(ivectorEmpty, ivector(itj), None)
              val nullCheck = JumpLocation(Some(ctx.newLocLabel(sloc)), ivectorEmpty, ij)
              ctx.pushLocation(nullCheck)

              // initialize iter var
              ctx.createPushAssignmentLocation(iterNE,
                if (isRev) hightemp else lowtemp, ivectorEmpty, sloc)

              val loopStart = ctx.createEmptyLocation(ctx.newLocLabel(sloc), ivectorEmpty)
              ctx.pushLocation(loopStart)

              v(loopStatements)

              // end of loop check
              val endbe = ctx.handleBE(sloc, PilarAstUtil.EQ_BINOP, iterNE,
                if (isRev) lowtemp else hightemp, markURI)
              val enditj = IfThenJump(endbe, ivectorEmpty, endLoc.name.get)
              val endij = IfJump(ivectorEmpty, ivector(enditj), None)
              val endCheck = JumpLocation(Some(ctx.newLocLabel(sloc)), ivectorEmpty, endij)
              ctx.pushLocation(endCheck)

              val ONE = addprop(LiteralExp(LiteralType.INTEGER, BigInt(1), "1ii"), URIS.TYPE_URI, StandardURIs.universalIntURI)

              // increment/decrement iter var
              val incbe = ctx.handleBE(sloc, if (isRev) PilarAstUtil.SUB_BINOP else PilarAstUtil.PLUS_UNOP,
                iterNE, ONE, StandardURIs.boolURI)
              ctx.createPushAssignmentLocation(iterNE, incbe, ivectorEmpty, sloc)

              // goto start
              ctx.pushLocation(ctx.createGotoJumpLocation(loopStart.name.get, ivectorEmpty, sloc))

              // push end location
              ctx.pushLocation(endLoc)
              val _exitLoc = ctx.popExitLocation
              assert(_exitLoc == endLoc)
          }
      }
      false
    case o @ ReturnStatementEx(sloc, labelNames, returnExp, checks) =>
      assert(labelNames == null || labelNames.getDefiningNames().isEmpty())

      v(returnExp)

      val rj = ReturnJump(ivectorEmpty, Some(ctx.popResult.asInstanceOf[Exp]))
      val jl = JumpLocation(Some(ctx.newLocLabel(sloc)), ivectorEmpty, rj)

      ctx.pushLocation(jl)
      false
    case o @ ProcedureCallStatementEx(sloc, labelNames, calledName, params, isPrefixNotation, checks) =>
      assert(ctx.isEmpty(isPrefixNotation.getIsPrefixNotation))
      val (nloc, name, nameUri, typ) = ctx.getName(calledName)

      val plist = mlistEmpty[Exp]
      for (p <- params.getAssociations) {
        v(p)
        plist += ctx.popResult.asInstanceOf[Exp]
      }

      val ce = CallExp(NameExp(ctx.addResourceUri(NameUser(name), nameUri)), TupleExp(plist.toList))
      val cj = CallJump(ivectorEmpty, ivectorEmpty, ce, None)
      val jl = JumpLocation(Some(ctx.newLocLabel(sloc)), ivectorEmpty, cj)

      ctx.pushLocation(jl)
      false
    case o @ ExitStatementEx(sloc, labelNames, exitLoopName, exitCond, checks) =>
      assert(labelNames.getDefiningNames().isEmpty())

      // TODO: currently ignoring exitLoopName

      if (!ctx.isEmpty(exitCond.getExpression())) {
        v(exitCond)
        val c = ctx.popResult.asInstanceOf[Exp]

        val exitItj = IfThenJump(c, ivectorEmpty, ctx.peekExitLocation.name.get)
        val exitIj = IfJump(ivectorEmpty, ivector(exitItj), None)
        val exitJl = JumpLocation(Some(ctx.newLocLabel(sloc)), ivectorEmpty, exitIj)
        ctx.pushLocation(exitJl)

      } else {
        ctx.pushLocation(ctx.createGotoJumpLocation(ctx.peekExitLocation.name.get, ivectorEmpty, sloc))
      }
      false
    case o @ (NullStatementEx(_) |
      BlockStatementEx(_) |
      BlockStatementEx(_) |
      GotoStatementEx(_) |
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
      if (DEBUG) println("statementH: need to handle " + o.getClass().getSimpleName())
      true
  }

  def aggregateH(ctx : Context, v : => BVisitor) : VisitorFunction = {
      def r = {
        val le = LiteralExp(LiteralType.INTEGER, 11111, "11111ii")
        le(URIS.TYPE_URI) = StandardURIs.universalIntURI
        le
      }
    {
      case o @ NamedArrayAggregateEx(sloc, arrayAssoc, typ, checks) =>
        ctx.pushResult(r, sloc)
        false
      case o @ PositionalArrayAggregateEx(sloc, arrayAssoc, typ, checks) =>
        ctx.pushResult(r, sloc)
        false
      case o @ RecordAggregateEx(sloc, recAssoc, typ, checks) =>
        ctx.pushResult(r, sloc)
        false
    }
  }

  def attributeH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ FirstAttributeEx(sloc, prefix, attributeId, attributeExp, typ, checks) =>
      assert(attributeExp.getExpressions().isEmpty())

      v(prefix)
      val p = ctx.popResult.asInstanceOf[NameExp]

      ctx.pushResult(ctx.handleAttribute(Attribute.ATTRIBUTE_UIF_FIRST, p, typ), sloc)
      false
    case o @ LastAttributeEx(sloc, prefix, attributeId, attributeExp, typ, checks) =>
      assert(attributeExp.getExpressions().isEmpty())

      v(prefix)
      val p = ctx.popResult.asInstanceOf[NameExp]

      ctx.pushResult(ctx.handleAttribute(Attribute.ATTRIBUTE_UIF_LAST, p, typ), sloc)
      false
  }

  def expressionH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ FunctionCallEx(sloc, prefix, functionCallParameters, isPrefixCall, isPrefixNotation, callExpType, checks) =>
      import collection.JavaConversions._

      if (!ctx.isEmpty(isPrefixCall.getIsPrefixCall()))
        if (DEBUG) Console.err.println("Need to handle prefix calls")

      if (!ctx.isEmpty(isPrefixNotation.getIsPrefixNotation()))
        if (DEBUG) Console.err.println("Need to handle prefix notation")

      val plist = mlistEmpty[Exp]
      for (a <- functionCallParameters.getAssociations) {
        // TODO: these maybe associations in which case the arg order may not 
        //       match the declared formal param order
        v(a)
        plist += ctx.popResult.asInstanceOf[Exp]
      }

      if (ctx.isBinaryOp(prefix)) {
        assert(plist.length == 2)
        val be = ctx.handleBE(sloc, ctx.getBinaryOp(prefix).get, plist(0), plist(1), callExpType)
        ctx.pushResult(be, sloc)
      } else if (ctx.isUnaryOp(prefix)) {
        assert(plist.length == 1)
        val ue = ctx.handleUnaryExp(sloc, ctx.getUnaryOp(prefix).get, plist(0), callExpType)
        ctx.pushResult(ue, sloc)
      } else {
        v(prefix)
        val mname = ctx.popResult match {
          case ne @ NameExp(nu) =>
            // the name of the method is an identifier and has no type
            if (!(ne ? URIS.TYPE_URI)) addprop(ne, URIS.TYPE_URI, callExpType, true)
            ne
          case _ => throw new RuntimeException("Unexpected")
        }

        val ce = CallExp(mname, TupleExp(plist.toList))
        this.addprop(ce, URIS.TYPE_URI, callExpType, true)

        val tempVar = ctx.genTempVar("FIXME", callExpType)
        val lhss = ivector(tempVar)
        val cj = CallJump(ivectorEmpty, lhss, ce, None)
        val jl = JumpLocation(Some(ctx.newLocLabel(sloc)), ivectorEmpty, cj)
        ctx.pushLocation(jl)

        ctx.pushResult(ctx.handleExp(tempVar), sloc)
      }

      false
    case IntegerLiteralEx(sloc, litVal, typUri, checks) =>
      val v = litVal.replaceAll("_", "") // e.g. 3_500
      val le = LiteralExp(LiteralType.INTEGER, BigInt(v), v + "ii")
      le(URIS.TYPE_URI) = typUri match {
        case "universal integer" => StandardURIs.universalIntURI
        case x                   => x
      }
      ctx.pushResult(le, sloc)
      false
    case RealLiteralEx(sloc, litVal, typUri, checks) =>
      val v = litVal.replaceAll("_", "")
      val le = LiteralExp(LiteralType.FLOAT, v, v)
      le(URIS.TYPE_URI) = typUri match {
        case "universal real" => StandardURIs.universalRealURI
        case x                => println(x); x
      }
      false
    case o @ EnumerationLiteralEx(sloc, refName, ref, typ, checks) =>
      if (typ == StandardURIs.boolURI) {
        val v = refName.toLowerCase() == "true"
        val le = LiteralExp(LiteralType.BOOLEAN, v, refName.toLowerCase())
        addprop(le, URIS.TYPE_URI, StandardURIs.boolURI)
        ctx.pushResult(le, sloc)
      } else {
        if (DEBUG) Console.err.println("Not handling enumeration lit %s %s".format(typ, refName))
      }
      false
    case o @ AndThenShortCircuitEx(sloc, lhs, rhs, theType, checks) =>
      ctx.pushResult(
        ctx.handleBE(v, sloc, PilarAstUtil.LOGICAL_AND_BINOP, lhs, rhs, theType), sloc)
      false
    case o @ OrElseShortCircuitEx(sloc, lhs, rhs, theType, checks) =>
      ctx.pushResult(
        ctx.handleBE(v, sloc, PilarAstUtil.LOGICAL_OR_BINOP, lhs, rhs, theType), sloc)
      false
    case o @ IndexedComponentEx(sloc, prefix, indexExp, theType, checks) =>
      v(prefix)
      val pprefix = ctx.popResult.asInstanceOf[Exp]

      val indices = mlistEmpty[Exp]
      indexExp.getExpressions().foreach { e =>
        v(e)
        indices += ctx.popResult.asInstanceOf[Exp]
      }

      val ie = IndexingExp(pprefix, indices.toList)
      addprop(ie, URIS.TYPE_URI, theType, true)

      ctx.pushResult(ie, sloc)
      false
    case o @ SelectedComponentEx(sloc, prefix, selector, typUri, checks) =>
      v(prefix)
      val e = ctx.popResult.asInstanceOf[Exp]

      val (selsloc, selname, seluri, styp) = ctx.getName(selector)
      val attr = NameUser(selname)
      ctx.addResourceUri(attr, seluri)
      addprop(attr, URIS.REF_URI, seluri)
      addprop(attr, URIS.TYPE_URI, styp)

      val ae = AccessExp(e, attr)
      this.addprop(ae, URIS.TYPE_URI, typUri, true)

      ctx.pushResult(ae, sloc)
      false
    case o @ (
      IfExpressionEx(_) |
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
      if (DEBUG) println("expressionH: need to handle: " + o.getClass.getSimpleName)
      true
  }

  def contractsH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ AssertPragmaEx(sloc, pragmaArgumentAssociations, pragmaName, checks) =>
      for (a <- pragmaArgumentAssociations.getAssociations) {
        v(a)
        val r = ctx.popResult.asInstanceOf[Exp]
        val aa = AssertAction(ivectorEmpty, r, None)
        ctx.createPushLocation(aa, ivectorEmpty, sloc)
      }
      false
    case o @ ImplementationDefinedPragmaEx(sloc, pragmaArgAssociations, pragmaName, checks) if (pragmaName.toLowerCase == "assume") =>
      for (a <- pragmaArgAssociations.getAssociations) {
        v(a)
        val r = ctx.popResult.asInstanceOf[Exp]
        val aa = AssumeAction(ivectorEmpty, r)
        ctx.createPushLocation(aa, ivectorEmpty, sloc)
      }
      false
  }

  def everythingElseH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o if (o != null) =>
      ctx.unhandledSet += o.getClass.getSimpleName()
      true
    case null =>
      if (DEBUG) println("everythingElseH: it is null")
      assert(false)
      false
  }

  def theVisitor : BVisitor = b
  val ctx = new Context {
    this.stackLocationList.push(mlistEmpty[LocationDecl])
  }

  ctx.regression = this.regression

  val b = Visitor.build(
    Visitor.first(
      ivector(
        packageH(ctx, theVisitor),
        methodH(ctx, theVisitor),
        statementH(ctx, theVisitor),
        expressionH(ctx, theVisitor),
        contractsH(ctx, theVisitor),
        nameH(ctx, theVisitor),
        aggregateH(ctx, theVisitor),
        attributeH(ctx, theVisitor),
        everythingElseH(ctx, theVisitor)
      )))

  this.parseGnat2XMLresults.foreach {
    case (fileUri, value) => {
      ctx.fileUri = fileUri
      b(value)
    }
  }

  // TODO: introduce standard package
  val packElems = List(
    StandardTypeDefs.StandardBoolean,
    StandardTypeDefs.StandardInteger,
    StandardTypeDefs.StandardNatural,
    StandardTypeDefs.StandardPositive,
    StandardTypeDefs.StandardFloat,

    // FIXME: inject the non-standard universal_integer
    StandardTypeDefs.UniversalInteger,
    StandardTypeDefs.UniversalReal)

  val nd = ctx.addResourceUri(NameDefinition("Standard"), PackageURIs.standardPackageURI)
  val pack = PackageDecl(Some(nd), ivectorEmpty, packElems)
  ctx.models += Model(Some("fake/standard.ads"), ivectorEmpty, ivector(pack))

  if (DEBUG) println("Not handling: " + ctx.unhandledSet.toList.sorted)

  this.models = ctx.models.toList
}

case class BakarTranslator(

  title : String = "Bakar Vistor",

  @Input parseGnat2XMLresults : IMap[FileResourceUri, CompilationUnit],

  @Input regression : Boolean = false,

  @Output models : ISeq[Model])

object BakarTranslator {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/compiler/module"
    val cnames = Array(BakarTranslator.getClass.getName.dropRight(1))

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))

    val e = new Exec()
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}
