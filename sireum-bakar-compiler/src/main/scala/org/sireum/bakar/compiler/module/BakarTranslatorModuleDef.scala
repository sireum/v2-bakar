package org.sireum.bakar.compiler.module

import scala.collection.JavaConversions.asScalaBuffer

import org.sireum.bakar.compiler.module.{ PilarNodeFactory => PNF }
import org.sireum.bakar.compiler.module.PilarNodeFactory.{ copyPropertyMap => cp }
import org.sireum.bakar.symbol.BakarSymbol.TestCase
import org.sireum.bakar.symbol.BakarSymbol.pack2packInfo
import org.sireum.bakar.symbol.BakarSymbol.pd2pi
import org.sireum.bakar.symbol.BakarSymbol.proc2procInfo
import org.sireum.bakar.symbol.ComponentDef
import org.sireum.bakar.symbol.ConstrainedArrayDef
import org.sireum.bakar.symbol.Constraint
import org.sireum.bakar.symbol.DerivedTypeDef
import org.sireum.bakar.symbol.EnumerationTypeDef
import org.sireum.bakar.symbol.FullTypeDecl
import org.sireum.bakar.symbol.IndexConstraint
import org.sireum.bakar.symbol.PrivateTypeDecl
import org.sireum.bakar.symbol.RecordTypeDef
import org.sireum.bakar.symbol.SignedIntegerTypeDef
import org.sireum.bakar.symbol.SimpleRangeConstraint
import org.sireum.bakar.symbol.SparkTypeDecl
import org.sireum.bakar.symbol.SubTypeDecl
import org.sireum.bakar.symbol.TestCaseMode
import org.sireum.bakar.symbol.TypeDef
import org.sireum.bakar.symbol.UnconstrainedArrayDef
import org.sireum.bakar.symbol.SymbolUtil
import org.sireum.bakar.xml.AndOperator
import org.sireum.bakar.xml.AndThenShortCircuitEx
import org.sireum.bakar.xml.ArrayComponentAssociationEx
import org.sireum.bakar.xml.AspectSpecificationEx
import org.sireum.bakar.xml.AssertPragmaEx
import org.sireum.bakar.xml.AssignmentStatementEx
import org.sireum.bakar.xml.AssociationList
import org.sireum.bakar.xml.Base
import org.sireum.bakar.xml.BlockStatementEx
import org.sireum.bakar.xml.CaseExpressionEx
import org.sireum.bakar.xml.CasePathEx
import org.sireum.bakar.xml.CaseStatementEx
import org.sireum.bakar.xml.CompilationUnit
import org.sireum.bakar.xml.CompilationUnitEx
import org.sireum.bakar.xml.ComponentDeclarationEx
import org.sireum.bakar.xml.ComponentDefinitionEx
import org.sireum.bakar.xml.ConcatenateOperator
import org.sireum.bakar.xml.ConstantDeclarationEx
import org.sireum.bakar.xml.ConstrainedArrayDefinitionEx
import org.sireum.bakar.xml.DeclarationClass
import org.sireum.bakar.xml.DeferredConstantDeclarationEx
import org.sireum.bakar.xml.DefiningEnumerationLiteralEx
import org.sireum.bakar.xml.DefiningIdentifier
import org.sireum.bakar.xml.DefiningIdentifierEx
import org.sireum.bakar.xml.DefiningNameClass
import org.sireum.bakar.xml.DefiningNameList
import org.sireum.bakar.xml.DefinitionClass
import org.sireum.bakar.xml.DerivedTypeDefinitionEx
import org.sireum.bakar.xml.DiscreteRangeAttributeReferenceAsSubtypeDefinitionEx
import org.sireum.bakar.xml.DiscreteSimpleExpressionRangeAsSubtypeDefinitionEx
import org.sireum.bakar.xml.DiscreteSimpleExpressionRangeEx
import org.sireum.bakar.xml.DiscreteSubtypeIndicationAsSubtypeDefinitionEx
import org.sireum.bakar.xml.DiscreteSubtypeIndicationEx
import org.sireum.bakar.xml.DivideOperator
import org.sireum.bakar.xml.ElementClass
import org.sireum.bakar.xml.ElementList
import org.sireum.bakar.xml.ElseExpressionPathEx
import org.sireum.bakar.xml.ElsePathEx
import org.sireum.bakar.xml.ElsifExpressionPathEx
import org.sireum.bakar.xml.ElsifPathEx
import org.sireum.bakar.xml.EnumerationLiteralEx
import org.sireum.bakar.xml.EnumerationLiteralSpecificationEx
import org.sireum.bakar.xml.EnumerationTypeDefinitionEx
import org.sireum.bakar.xml.EqualOperator
import org.sireum.bakar.xml.ExitStatementEx
import org.sireum.bakar.xml.ExponentiateOperator
import org.sireum.bakar.xml.ExpressionClass
import org.sireum.bakar.xml.ExpressionClassEx
import org.sireum.bakar.xml.ExpressionFunctionDeclaration
import org.sireum.bakar.xml.ExpressionFunctionDeclarationEx
import org.sireum.bakar.xml.FirstAttributeEx
import org.sireum.bakar.xml.ForAllQuantifiedExpressionEx
import org.sireum.bakar.xml.ForLoopStatementEx
import org.sireum.bakar.xml.ForSomeQuantifiedExpressionEx
import org.sireum.bakar.xml.FunctionBodyDeclaration
import org.sireum.bakar.xml.FunctionBodyDeclarationEx
import org.sireum.bakar.xml.FunctionCallEx
import org.sireum.bakar.xml.FunctionDeclaration
import org.sireum.bakar.xml.FunctionDeclarationEx
import org.sireum.bakar.xml.GreaterThanOperator
import org.sireum.bakar.xml.GreaterThanOrEqualOperator
import org.sireum.bakar.xml.Identifier
import org.sireum.bakar.xml.IdentifierEx
import org.sireum.bakar.xml.IfExpressionEx
import org.sireum.bakar.xml.IfExpressionPathEx
import org.sireum.bakar.xml.IfPathEx
import org.sireum.bakar.xml.IfStatementEx
import org.sireum.bakar.xml.ImageAttributeEx
import org.sireum.bakar.xml.ImplementationDefinedAttributeEx
import org.sireum.bakar.xml.ImplementationDefinedPragmaEx
import org.sireum.bakar.xml.InMembershipTestEx
import org.sireum.bakar.xml.IndexConstraintEx
import org.sireum.bakar.xml.IndexedComponentEx
import org.sireum.bakar.xml.IntegerLiteralEx
import org.sireum.bakar.xml.IntegerNumberDeclarationEx
import org.sireum.bakar.xml.LastAttributeEx
import org.sireum.bakar.xml.LengthAttributeEx
import org.sireum.bakar.xml.LessThanOperator
import org.sireum.bakar.xml.LessThanOrEqualOperator
import org.sireum.bakar.xml.LoopParameterSpecificationEx
import org.sireum.bakar.xml.LoopStatementEx
import org.sireum.bakar.xml.MaxAttributeEx
import org.sireum.bakar.xml.MinAttributeEx
import org.sireum.bakar.xml.MinusOperator
import org.sireum.bakar.xml.ModOperator
import org.sireum.bakar.xml.ModularTypeDefinitionEx
import org.sireum.bakar.xml.MultiplyOperator
import org.sireum.bakar.xml.NamedArrayAggregateEx
import org.sireum.bakar.xml.NotAnElement
import org.sireum.bakar.xml.NotEqualOperator
import org.sireum.bakar.xml.NotInMembershipTestEx
import org.sireum.bakar.xml.NotOperatorEx
import org.sireum.bakar.xml.NullLiteralEx
import org.sireum.bakar.xml.OrElseShortCircuitEx
import org.sireum.bakar.xml.OrOperator
import org.sireum.bakar.xml.OrdinaryTypeDeclarationEx
import org.sireum.bakar.xml.OthersChoice
import org.sireum.bakar.xml.OthersChoiceEx
import org.sireum.bakar.xml.PackageBodyDeclaration
import org.sireum.bakar.xml.PackageBodyDeclarationEx
import org.sireum.bakar.xml.PackageDeclaration
import org.sireum.bakar.xml.PackageDeclarationEx
import org.sireum.bakar.xml.ParameterAssociation
import org.sireum.bakar.xml.ParameterSpecificationEx
import org.sireum.bakar.xml.ParameterSpecificationList
import org.sireum.bakar.xml.ParenthesizedExpression
import org.sireum.bakar.xml.PlusOperator
import org.sireum.bakar.xml.PositionalArrayAggregateEx
import org.sireum.bakar.xml.PragmaArgumentAssociation
import org.sireum.bakar.xml.PragmaArgumentAssociationEx
import org.sireum.bakar.xml.PredAttributeEx
import org.sireum.bakar.xml.PrivateTypeDeclarationEx
import org.sireum.bakar.xml.PrivateTypeDefinitionEx
import org.sireum.bakar.xml.ProcedureBodyDeclaration
import org.sireum.bakar.xml.ProcedureBodyDeclarationEx
import org.sireum.bakar.xml.ProcedureCallStatementEx
import org.sireum.bakar.xml.ProcedureDeclaration
import org.sireum.bakar.xml.ProcedureDeclarationEx
import org.sireum.bakar.xml.QualifiedExpressionEx
import org.sireum.bakar.xml.RangeAttributeEx
import org.sireum.bakar.xml.RangeAttributeReferenceEx
import org.sireum.bakar.xml.RealLiteralEx
import org.sireum.bakar.xml.RealNumberDeclarationEx
import org.sireum.bakar.xml.RecordAggregateEx
import org.sireum.bakar.xml.RecordComponentAssociationEx
import org.sireum.bakar.xml.RecordDefinitionEx
import org.sireum.bakar.xml.RecordTypeDefinitionEx
import org.sireum.bakar.xml.RemOperator
import org.sireum.bakar.xml.ReturnStatement
import org.sireum.bakar.xml.ReturnStatementEx
import org.sireum.bakar.xml.SelectedComponentEx
import org.sireum.bakar.xml.SignedIntegerTypeDefinitionEx
import org.sireum.bakar.xml.SimpleExpressionRangeEx
import org.sireum.bakar.xml.SourceLocation
import org.sireum.bakar.xml.StatementList
import org.sireum.bakar.xml.StringLiteralEx
import org.sireum.bakar.xml.SubtypeDeclarationEx
import org.sireum.bakar.xml.SubtypeIndicationEx
import org.sireum.bakar.xml.SuccAttributeEx
import org.sireum.bakar.xml.TypeConversionEx
import org.sireum.bakar.xml.UnaryMinusOperatorEx
import org.sireum.bakar.xml.UnaryPlusOperator
import org.sireum.bakar.xml.UnaryPlusOperatorEx
import org.sireum.bakar.xml.UnconstrainedArrayDefinitionEx
import org.sireum.bakar.xml.UnknownAttributeEx
import org.sireum.bakar.xml.UsePackageClauseEx
import org.sireum.bakar.xml.UseTypeClauseEx
import org.sireum.bakar.xml.VariableDeclaration
import org.sireum.bakar.xml.VariableDeclarationEx
import org.sireum.bakar.xml.WhileLoopStatementEx
import org.sireum.bakar.xml.WithClauseEx
import org.sireum.bakar.xml.XorOperator
import org.sireum.pilar.ast.AccessExp
import org.sireum.pilar.ast.Action
import org.sireum.pilar.ast.ActionLocation
import org.sireum.pilar.ast.Annotation
import org.sireum.pilar.ast.AssertAction
import org.sireum.pilar.ast.AssignAction
import org.sireum.pilar.ast.AssumeAction
import org.sireum.pilar.ast.AttributeDecl
import org.sireum.pilar.ast.AttributeInit
import org.sireum.pilar.ast.BinaryExp
import org.sireum.pilar.ast.BinaryOp
import org.sireum.pilar.ast.CallExp
import org.sireum.pilar.ast.CallJump
import org.sireum.pilar.ast.CastExp
import org.sireum.pilar.ast.ConstDecl
import org.sireum.pilar.ast.ConstElement
import org.sireum.pilar.ast.EmptyBody
import org.sireum.pilar.ast.EmptyLocation
import org.sireum.pilar.ast.EnumDecl
import org.sireum.pilar.ast.EnumElement
import org.sireum.pilar.ast.Exp
import org.sireum.pilar.ast.ExtendClause
import org.sireum.pilar.ast.ExternalExp
import org.sireum.pilar.ast.FunExp
import org.sireum.pilar.ast.GlobalVarDecl
import org.sireum.pilar.ast.GotoJump
import org.sireum.pilar.ast.IfExp
import org.sireum.pilar.ast.IfThenExp
import org.sireum.pilar.ast.ImplementedBody
import org.sireum.pilar.ast.IndexingExp
import org.sireum.pilar.ast.Jump
import org.sireum.pilar.ast.JumpLocation
import org.sireum.pilar.ast.LiteralExp
import org.sireum.pilar.ast.LiteralType
import org.sireum.pilar.ast.LocalVarDecl
import org.sireum.pilar.ast.LocationDecl
import org.sireum.pilar.ast.Matching
import org.sireum.pilar.ast.Model
import org.sireum.pilar.ast.NameDefinition
import org.sireum.pilar.ast.NameExp
import org.sireum.pilar.ast.NameUser
import org.sireum.pilar.ast.NamedTypeSpec
import org.sireum.pilar.ast.NewFunctionExp
import org.sireum.pilar.ast.NewRecordExp
import org.sireum.pilar.ast.PackageDecl
import org.sireum.pilar.ast.PackageElement
import org.sireum.pilar.ast.ParamDecl
import org.sireum.pilar.ast.PilarAstNode
import org.sireum.pilar.ast.PilarAstUtil
import org.sireum.pilar.ast.ProcedureDecl
import org.sireum.pilar.ast.RecordDecl
import org.sireum.pilar.ast.ReturnJump
import org.sireum.pilar.ast.SwitchCaseExp
import org.sireum.pilar.ast.SwitchExp
import org.sireum.pilar.ast.TupleExp
import org.sireum.pilar.ast.TypeAliasDecl
import org.sireum.pilar.ast.TypeExp
import org.sireum.pilar.ast.TypeSpec
import org.sireum.pilar.ast.UnaryExp
import org.sireum.pilar.ast.UnaryOp
import org.sireum.pilar.symbol.Symbol.pp2r
import org.sireum.pipeline.Input
import org.sireum.pipeline.Output
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.util.BeginEndLineColumnLocation
import org.sireum.util.SourceLocation.SourceLocationWithAt
import org.sireum.util.Exec
import org.sireum.util.FileLineColumnLocation.pp2flcl
import org.sireum.util.FileResourceUri
import org.sireum.util.IMap
import org.sireum.util.ISeq
import org.sireum.util.ISet
import org.sireum.util.Location
import org.sireum.util.MBuffer
import org.sireum.util.MList
import org.sireum.util.PropertyProvider
import org.sireum.util.ResourceUri
import org.sireum.util.SourceLocation.pp2sl
import org.sireum.util.Visitor
import org.sireum.util.VisitorFunction
import org.sireum.util.ilistEmpty
import org.sireum.util.imapEmpty
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

  case class Context(
    val kind : CTX.Value,
    val name : String,
    val uri : ResourceUri)

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

  trait VContext {
    val LOCATION_PREFIX = "l"

    var regression = false

    var fileUri : ResourceUri = null

    var models = mlistEmpty[Model]

    var unhandledSet = msetEmpty[String]

    val typeCache = mmapEmpty[Base, ISeq[PackageElement]]
    var typeDeclarations = imapEmpty[ResourceUri, SparkTypeDecl]

    var loopCounter = 0
    def nextLoopLabel = {
      val ret = loopCounter
      loopCounter += 1
      NameDefinition("LOOP_LABEL_" + ret)
    }

    val loopLabelStack = mstackEmpty[NameDefinition]
    def peekLoopLabel =
      PNF.buildNameExp(loopLabelStack.top.name, URIS.DUMMY_URI, Some(URIS.DUMMY_URI))
    def popLoopLabel = loopLabelStack.pop
    def pushLoopLabel(s : NameDefinition) = loopLabelStack.push(s)

    def addLoopLabel(ld : LocationDecl) : Unit = addLoopLabel(ld, nextLoopLabel)

    def addLoopLabel(ld : LocationDecl, label : NameDefinition) : Unit = {
      ld(BAKAR_KEYS.LOOP_LABEL_KEY) = label
      pushLoopLabel(label)
    }

    var countLocation = 0
    var stackLocationList = mstackEmpty[MList[LocationDecl]]
    def pushLocationList = {
      val locs = mlistEmpty[LocationDecl]
      stackLocationList.push(locs)
      locs
    }
    def popLocationList = stackLocationList.pop
    def pushLocation(l : LocationDecl) : LocationDecl = {
      stackLocationList.top += l
      l
    }
    def pushLocation(l : LocationDecl, sloc : SourceLocation) : LocationDecl = {
      this.addSourceLoc(l, sloc)
      pushLocation(l)
    }

    val contextStack = mstackEmpty[Context]
    def pushContext(s : Context) = contextStack.push(s)
    def popContext = contextStack.pop

    val exitLocations = mstackEmpty[LocationDecl]
    def pushExitLocation(s : LocationDecl) = exitLocations.push(s)
    def popExitLocation = exitLocations.pop
    def peekExitLocation = exitLocations.top

    var resultStack : PilarAstNode = null;

    def pushResult[T <: PilarAstNode](o : T, sloc : SourceLocation) {
      assert(resultStack == null)
      addSourceLoc(o, sloc)
      resultStack = o
    }
    def popResult[T <: PilarAstNode] : T = {
      assert(resultStack != null)
      val t = resultStack.asInstanceOf[T]
      resultStack = null
      t
    }

    case class Scope(
      constants : MList[ConstElement] = mlistEmpty,
      var initBlock : Option[MList[LocationDecl]] = None,
      typeDeclarations : MList[PackageElement] = mlistEmpty,
      variableDeclarations : MList[PilarAstNode] = mlistEmpty)

    val scopeCache = mmapEmpty[Base, Scope]
    val scopeStack = mstackEmpty[Scope]

    def localsPush(o : LocalVarDecl) {
      scopeStack.head.variableDeclarations += o
    }

    var anonymousPackageCounter = 0
    def nextAnonymousPackage = {
      val ret = anonymousPackageCounter
      anonymousPackageCounter += 1
      ret
    }

    var anonymousTypeCounter = 0
    def nextAnonymousType = {
      val ret = anonymousTypeCounter
      anonymousTypeCounter += 1
      ret
    }

    val globalUriMap = mmapEmpty[ResourceUri, ResourceUri]
    val globalNameMap = mmapEmpty[ResourceUri, String]

    var tempVarCounter = 0
    def genTempVar(typeUri : ResourceUri) = {
      val tempVarPrefix = "_tcomp"
      val name = tempVarPrefix + tempVarCounter
      tempVarCounter += 1
      val path = getContextPath :+ name
      val typeDecl = typeDeclarations(typeUri)

      val (lvd, ret) = PNF.buildLocalTempVar(typeDecl.id, typeUri, path)
      localsPush(lvd)
      ret
    }

    def getContextPath = URIS.getPath(contextStack.top.uri)

    def processingPackage = contextStack.head.kind == CTX.PACKAGE

    var inProofContext = false
    var _noTempVars = false
    def noTempVars = _noTempVars
    def noTempVars(isProcessing : Boolean) = _noTempVars = isProcessing

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

    def handleLoop(v : => BVisitor, sloc : SourceLocation,
                   labelnames : Option[DefiningNameList],
                   statementIdentifier : Option[DefiningNameClass],
                   forLoopParameterSpecification : Base,
                   loopStatements : Option[StatementList],
                   exp : Option[Base],
                   quantifiedExpType : Option[ResourceUri],
                   checks : String) : NameExp = {

      val (isRev, iterNE, iterND, markNE, markURI, lowBound, highBound) =
        handleLoopParam(v, forLoopParameterSpecification)

      val endLoc = createEmptyLocation(newLocLabel, ivectorEmpty)
      pushExitLocation(endLoc)

      // introduce a local variable for iterVar
      val typeUri = markNE.name.uri
      val typeSpec = PNF.buildNamedTypeSpec(markNE.name, typeUri)
      val lvd = PNF.buildLocalVar(iterND, typeSpec)
      localsPush(lvd)

      // NOTE: in ADA the loop bounds are fixed by the initial values of 
      //       the low and high ranges assigned to the iter var.  So we
      //       assign the low/high bound exp to temp vars since their
      //       interpretation could change during the loop
      val lowtemp = genTempVar(markURI)
      createPushAssignmentLocation(lowtemp, lowBound, ivectorEmpty, sloc)
      val hightemp = genTempVar(markURI)
      createPushAssignmentLocation(hightemp, highBound, ivectorEmpty, sloc)

      // null range check
      val be = handleBE(sloc, PilarAstUtil.GT_BINOP, lowtemp, hightemp, StandardURIs.boolURI)
      val nullCheck = PNF.buildIfJumpLocation(be, newLocLabel, endLoc.name.get)
      pushLocation(nullCheck)

      // initialize iter var
      createPushAssignmentLocation(iterNE,
        if (isRev) hightemp else lowtemp, ivectorEmpty, sloc)

      val resultVar =
        if (quantifiedExpType.isDefined) {
          val tv = genTempVar(StandardURIs.boolURI)
          val initVal = if (quantifiedExpType.get == Proof.PROOF_UIF_FOR_ALL) PNF.TRUE
          else PNF.FALSE

          createPushAssignmentLocation(tv, initVal, ivectorEmpty, sloc)
          tv
        } else null

      val loopStart = pushLocation(createEmptyLocation(newLocLabel))

      if (statementIdentifier.isDefined && !isEmpty(statementIdentifier.get.getDefiningName)) {
        v(statementIdentifier)
        addLoopLabel(loopStart, popResult.asInstanceOf[NameDefinition])
      } else
        addLoopLabel(loopStart)

      if (loopStatements.isDefined)
        v(loopStatements.get)
      else {
        v(exp.get)
        val _exp : Exp = popResult
        createPushAssignmentLocation(resultVar, _exp, ivectorEmpty, sloc)

        // end of loop check
        val cond = if (quantifiedExpType.get == Proof.PROOF_UIF_FOR_SOME) resultVar
        else PNF.buildUnaryExp(PilarAstUtil.NOT_UNOP, resultVar, StandardURIs.boolURI)
        val jl = PNF.buildIfJumpLocation(cond, newLocLabel, endLoc.name.get)
        pushLocation(jl)
      }

      // end of loop check
      val endbe = handleBE(sloc, PilarAstUtil.EQ_BINOP, iterNE,
        if (isRev) lowtemp else hightemp, markURI)
      val endCheck = PNF.buildIfJumpLocation(endbe, newLocLabel, endLoc.name.get)
      pushLocation(endCheck)

      // increment/decrement iter var
      val incbe = handleBE(sloc, if (isRev) PilarAstUtil.SUB_BINOP else PilarAstUtil.PLUS_UNOP,
        iterNE, PNF.ONE, StandardURIs.boolURI)
      createPushAssignmentLocation(iterNE, incbe, ivectorEmpty, sloc)

      // goto start
      pushLocation(createGotoJumpLocation(loopStart.name.get, ivectorEmpty, sloc))

      // push end location
      pushLocation(endLoc)
      val _exitLoc = popExitLocation
      assert(_exitLoc == endLoc)

      popLoopLabel

      resultVar
    }

    def handleLoopParam(v : => BVisitor, o : Base) : (Boolean, NameExp, NameDefinition, NameExp, ResourceUri, Exp, Exp) = {
      o match {
        case LoopParameterSpecificationEx(sloc, names, hasRev, range, checks) =>
          assert(names.getDefiningNames.size == 1)

          val currScope = scopeStack.head
          val locals = if (!processingPackage)
            currScope.variableDeclarations.asInstanceOf[MList[LocalVarDecl]]
          else null

            def unique(s : String, i : Int = -1) : String = {
              assert(locals != null || noTempVars)
              if (locals != null && !noTempVars && locals.find(e => (i == -1 && e.name.name == s) || e.name.name == s + i).isDefined)
                unique(s, i + 1)
              else if (i == -1) s else s + i
            }

          v(names.getDefiningNames.head)
          var iterND : NameDefinition = popResult

          val uiter = unique(iterND.name)
          if (uiter != iterND.name) {
            iterND = cp(iterND, NameDefinition(uiter))
          }

          val isRev = !isEmpty(hasRev.getHasReverse)

          range.getDiscreteSubtypeDefinition match {
            case DiscreteSimpleExpressionRangeAsSubtypeDefinitionEx(sloc2, lbound, hbound, check) =>
              v(lbound.getExpression)
              val lowBound : Exp = popResult

              v(hbound)
              val highBound : Exp = popResult

              val td = typeDeclarations(StandardURIs.universalIntURI)

              val markURI = td.uri
              val markNE = PNF.buildNameExp(td.id, markURI, Some(markURI))

              addTypeUri(iterND, markURI)
              val iterNE = PNF.buildNameExp(iterND, Some(markURI))

              return (isRev, iterNE, iterND, markNE, markURI, lowBound, highBound)
            case DiscreteRangeAttributeReferenceAsSubtypeDefinitionEx(sloc2, attr, checks) =>
              attr.getExpression match {
                case RangeAttributeEx(sloc3, prefix, id, exp, typ, checks) =>
                  assert(exp.getExpressions.isEmpty)

                  // e.g.       for I in Element'Range loop

                  v(prefix)
                  val ne : NameExp = popResult

                  // ne could be an unconstrained array.  we could investigate
                  // the type def to determine this and handle it special, but
                  // for now let's just introduce an unbounded iter var

                  val td = typeDeclarations(StandardURIs.universalIntURI)

                  val markURI = td.uri
                  val markNE = PNF.buildNameExp(td.id, markURI, Some(markURI))

                  if (!URIS.hasTypeUri(ne))
                    addTypeUri(ne, markURI)

                  addTypeUri(iterND, markURI)
                  val iterNE = PNF.buildNameExp(iterND, Some(markURI))

                  var texps : ISeq[Exp] = ivector(ne)
                  if (!exp.getExpressions.isEmpty)
                    for (e <- exp.getExpressions) {
                      v(e)
                      texps :+= popResult
                    }

                  val te = TupleExp(texps)

                  val lowBound = createUIFCall(Attribute.ATTRIBUTE_UIF_FIRST, te, markURI)
                  val highBound = createUIFCall(Attribute.ATTRIBUTE_UIF_LAST, te, markURI)

                  return (isRev, iterNE, iterND, markNE, markURI, lowBound, highBound)
                case x => throw new RuntimeException("Unexpected: " + x)
              }
            case DiscreteSubtypeIndicationAsSubtypeDefinitionEx(rsloc, mark, constraint, checks) =>

              v(mark)
              val markNE : NameExp = popResult
              val markURI : String = markNE.name.uri

              addTypeUri(markNE.name, markURI)
              addTypeUri(iterND, markURI)
              val iterNE = PNF.buildNameExp(iterND, Some(markURI))

              val (lowBound, highBound) =
                if (!isEmpty(constraint.getConstraint)) {
                  constraint.getConstraint match {
                    case SimpleExpressionRangeEx(rsloc, low, high, checks) =>
                      v(low)
                      val lb : Exp = popResult

                      v(high)
                      val hb : Exp = popResult

                      (lb, hb)
                    case RangeAttributeReferenceEx(rsloc, rangeAttribute, checks) =>
                      rangeAttribute.getExpression match {
                        case RangeAttributeEx(sloc2, prefix, id, exp, typ, checks) =>
                          v(prefix)
                          val ne : NameExp = popResult

                          if (!URIS.hasTypeUri(ne))
                            addTypeUri(ne, markURI)

                          var texps : ISeq[Exp] = ivector(ne)
                          if (!exp.getExpressions.isEmpty)
                            for (e <- exp.getExpressions) {
                              v(e)
                              texps :+= popResult
                            }

                          val te = TupleExp(texps)

                          val lb = createUIFCall(Attribute.ATTRIBUTE_UIF_FIRST, te, markURI)
                          val hb = createUIFCall(Attribute.ATTRIBUTE_UIF_LAST, te, markURI)

                          (lb, hb)
                        case x => throw new RuntimeException("Unexpected: " + x)
                      }
                  }
                } else {
                  // $First ^Mark .. $Last ^Mark
                  val te = PNF.buildTypeExp(markNE.name, markURI)
                  val lb = createUIFCall(Attribute.ATTRIBUTE_UIF_FIRST, te, markURI)
                  val hb = createUIFCall(Attribute.ATTRIBUTE_UIF_LAST, te, markURI)
                  (lb, hb)
                }

              return (isRev, iterNE, iterND, markNE, markURI, lowBound, highBound)
          }
      }
      throw new RuntimeException("Shouldn't get here")
    }

    def handleChoices(v : => BVisitor, choices : ElementList) = {
      val exps = mlistEmpty[Exp]

      choices.getElements.foreach {
        case OthersChoiceEx(sloc, checks) =>
          exps += ExternalExp("_OTHERS_")
        case el =>
          val e : Exp = el match {
            case DiscreteSubtypeIndicationEx(sloc, mark, cons, check) =>
              if (isEmpty(cons.getConstraint)) {
                v(mark)
                popResult
              } else {
                v(cons.getConstraint)
                popResult
              }
            case _ =>
              v(el)
              popResult
          }

          e match {
            case c : NameExp =>
              val cURI : String = c.name.uri
              if (cURI.startsWith("ada://enumeration_literal") ||
                cURI.startsWith("ada://parameter") ||
                cURI.startsWith("ada://variable")) {
                // x in EnumElement
                // ===> (x == EnumElement)
                exps += c
              } else {
                assert(cURI.contains("type"))

                // x in Positive 
                // ===> (Positive'First <= x &&& x <= Positive'Last)
                val te = PNF.buildTypeExp(c.name, cURI)

                val f = createUIFCall(Attribute.ATTRIBUTE_UIF_FIRST, te, cURI)
                val l = createUIFCall(Attribute.ATTRIBUTE_UIF_LAST, te, cURI)

                exps += TupleExp(ivector(f, l))
              }
            case c : Exp => exps += c
            case c       => throw new RuntimeException("Unexpected: " + c)
          }
      }
      exps
    }

    def handleConstant(v : => BVisitor, o : Base) : ISeq[ConstElement] = {
        def make(names : DefiningNameList, typeName : String, typeUri : ResourceUri, initExp : ExpressionClass = null) = {
          val ie : Exp = if (initExp != null) {
            v(initExp)
            popResult
          } else {
            // TODO: 
            PNF.buildNameExp("__DEFERRED_CONSTANT__", URIS.DUMMY_URI, Some(URIS.DUMMY_URI))
          }
          val castExp = CastExp(PNF.buildNamedTypeSpec(typeName, typeUri), ie)
          val constElems = mlistEmpty[ConstElement]
          for (n <- names.getDefiningNames) {
            v(n)
            val constName : NameDefinition = popResult
            constElems += ConstElement(constName, castExp, ivectorEmpty)
          }
          constElems.toList
        }

      o match {
        case ConstantDeclarationEx(sloc, names, hasAliased, objDec, initExp, aspect, checks) =>
          assert(isEmpty(hasAliased.getHasAliased))
          assert(aspect.getElements.isEmpty)

          objDec.getDefinition match {
            case SubtypeIndicationEx(sloc2, hasAliased, hasNullEx, mark, cons, check) =>
              assert(isEmpty(hasAliased.getHasAliased))
              assert(isEmpty(hasNullEx.getHasNullExclusion))
              assert(isEmpty(cons.getConstraint))

              val (sloc3, refName, refUri, typUri) = getName(mark)
              make(names, refName, refUri, initExp)
            case _ => throw new RuntimeException("Unexpected: " + objDec.getDefinition)
          }
        case DeferredConstantDeclarationEx(sloc, names, hasAliased, objDec, aspect, checks) =>
          assert(isEmpty(hasAliased.getHasAliased))
          assert(aspect.getElements.isEmpty)
          objDec.getDefinition match {
            case SubtypeIndicationEx(sloc2, hasAliased, hasNullEx, mark, cons, check) =>
              assert(isEmpty(hasAliased.getHasAliased))
              assert(isEmpty(hasNullEx.getHasNullExclusion))
              assert(isEmpty(cons.getConstraint))

              val (sloc3, refName, refUri, typUri) = getName(mark)
              make(names, refName, refUri)
            case _ => throw new RuntimeException("Unexpected: " + objDec.getDefinition)
          }
        case IntegerNumberDeclarationEx(sloc1, names, initExp, checks) =>
          make(names, "Integer", StandardURIs.integerURI, initExp)
        case RealNumberDeclarationEx(sloc1, names, initExp, checks) =>
          make(names, "Float", StandardURIs.floatURI, initExp)
        case x => throw new RuntimeException("Unexpected: " + o)
      }
    }

    def handleMembershipTest(v : => BVisitor, exp : ExpressionClass, choices : ElementList) : Exp = {
      assert(!choices.getElements.isEmpty)

      v(exp)
      val e : Exp = popResult

      handleChoices(v, choices) map {
        case o : TupleExp =>
          // x in 5 .. 20
          // ==> (5 <= x && x <= 20)
          // OR 
          // x in Positive 
          // ===> (Positive'First <= x && x <= Positive'Last)
          assert(o.exps.size == 2)
          val lhs = PNF.buildBinaryExp(PilarAstUtil.LE_BINOP, o.exps(0), e, StandardURIs.boolURI)
          val rhs = PNF.buildBinaryExp(PilarAstUtil.LE_BINOP, e, o.exps(1), StandardURIs.boolURI)

          PNF.buildBinaryExp(PilarAstUtil.COND_AND_BINOP, lhs, rhs, StandardURIs.boolURI)
        case x =>
          // x in 5 + 3
          // ===> (x == 5 + 3)
          // OR
          // x in 9
          // ===> (x == 9)            
          PNF.buildBinaryExp(PilarAstUtil.EQ_BINOP, e, x, StandardURIs.boolURI)
      } reduce { (a, b) =>
        PNF.buildBinaryExp(PilarAstUtil.COND_OR_BINOP, a, b, StandardURIs.boolURI)
      }
    }

    def addSourceLoc[T <: PilarAstNode](o : T, sloc : SourceLocation) : T = {
      o match {
        case x : PropertyProvider =>
          import org.sireum.util.SourceLocation._
          x at (purifyPath(fileUri), sloc.getLine, sloc.getCol, sloc.getEndline, sloc.getEndcol)
        case _ =>
      }
      o
    }

    def getSourceLoc(o : PilarAstNode) : Option[SourceLocationWithAt[PilarAstNode]] = {
      if (o ? Location.locPropKey) {
        val x = o(Location.locPropKey).asInstanceOf[SourceLocationWithAt[PilarAstNode]]
        Some(x)
      } else None
    }

    def isEmpty(o : Base) : Boolean = o.isInstanceOf[NotAnElement]

    def isUnaryOp(o : Any) = getUnaryOp(o).isDefined
    def getUnaryOp(o : Any) : scala.Option[UnaryOp] = {
      if (!o.isInstanceOf[ExpressionClass]) {
        return None
      }
      val x = o.asInstanceOf[ExpressionClass].getExpression.asInstanceOf[Any]

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
      o.asInstanceOf[ExpressionClass].getExpression.asInstanceOf[Any] match {
        case x : AndOperator                => Some(PilarAstUtil.LOGICAL_AND_BINOP)
        case x : OrOperator                 => Some(PilarAstUtil.LOGICAL_OR_BINOP)

        case x : EqualOperator              => Some(PilarAstUtil.EQ_BINOP)
        case x : GreaterThanOperator        => Some(PilarAstUtil.GT_BINOP)
        case x : GreaterThanOrEqualOperator => Some(PilarAstUtil.GE_BINOP)
        case x : LessThanOperator           => Some(PilarAstUtil.LT_BINOP)
        case x : LessThanOrEqualOperator    => Some(PilarAstUtil.LE_BINOP)
        case x : NotEqualOperator           => Some(PilarAstUtil.NE_BINOP)

        case x : DivideOperator             => Some(PilarAstUtil.DIV_BINOP)
        case x : MinusOperator              => Some(PilarAstUtil.SUB_BINOP)
        case x : MultiplyOperator           => Some(PilarAstUtil.MUL_BINOP)
        case x : PlusOperator               => Some(PilarAstUtil.PLUS_UNOP)
        case x : RemOperator                => Some(PilarAstUtil.REM_BINOP)

        case x : ModOperator                => Some(BinaryOps.MOD_OP)
        case x : ExponentiateOperator       => Some(BinaryOps.POWER_OP)
        case x : XorOperator                => Some(BinaryOps.XOR_OP)
        case x : ConcatenateOperator        => Some(BinaryOps.STRING_CONCATENATE_OP)
        case _ =>
          None
      }
    }

    def newLocLabel : NameDefinition = {
      val label = LOCATION_PREFIX + countLocation
      countLocation += 1
      val uri = getContextPath :+ label
      PNF.buildLocationLabel(uri)
    }

    def createEmptyLocation(locName : NameDefinition, annots : ISeq[Annotation] = ivectorEmpty) =
      EmptyLocation(Some(locName), annots)

    def createLocation(locName : NameDefinition, a : Action, annots : ISeq[Annotation] = ivectorEmpty) =
      ActionLocation(Some(locName), annots, a)

    def createPushLocation(a : Action, annots : ISeq[Annotation], s : SourceLocation) : LocationDecl =
      createPushLocation(newLocLabel, a, annots)

    def createPushLocation(locName : NameDefinition, a : Action, annots : ISeq[Annotation] = ivectorEmpty) : LocationDecl = {
      val loc = createLocation(locName, a, annots)
      pushLocation(loc)
      loc
    }

    def createJumpLocation(j : Jump, s : SourceLocation) =
      JumpLocation(Some(newLocLabel), ivectorEmpty, j)

    def createGotoJumpLocation(target : NameUser, annots : ISeq[Annotation], s : SourceLocation) =
      createJumpLocation(GotoJump(annots, target), s)

    def createPushAssignmentLocation(lhs : Exp, rhs : Exp, annots : ISeq[Annotation], s : SourceLocation) =
      createPushLocation(createAssignment(lhs, rhs, annots), ivectorEmpty, s)

    def createAssignment(lhs : Exp, rhs : Exp, annots : ISeq[Annotation]) =
      AssignAction(annots, lhs, ":=", rhs)

    def handleUnaryExp(sloc : SourceLocation, op : UnaryOp, exp : Exp, theType : String) : Exp =
      addSourceLoc(handleExp(PNF.buildUnaryExp(op, exp, theType)), sloc)

    def handleVariableDeclaration(v : => BVisitor, o : Base) : MList[PilarAstNode] = {
      o match {
        case VariableDeclarationEx(sloc, names, hasAliased, objDecView, initExpr, aspectSpec, checks) =>
          assert(isEmpty(hasAliased.getHasAliased))
          assert(aspectSpec.getElements.isEmpty)

          v(objDecView)
          val odv : NameExp = popResult
          val typeUri = odv.name.uri
          if (!URIS.hasTypeUri(odv.name)) addTypeUri(odv.name, typeUri)
          val typeSpec = PNF.buildNamedTypeSpec(odv.name, typeUri)

          val varDecls = mlistEmpty[PilarAstNode]
          names.getDefiningNames.foreach {
            case di : DefiningIdentifier =>
              val (sloc, cdefName, cdefUri, typ) = getName(di)

              val vd = if (processingPackage)
                PNF.buildGlobalVar(cdefName, cdefUri, contextStack.top.uri, typeSpec)
              else
                PNF.buildLocalVar(cdefName, cdefUri, typeSpec)

              if (!isEmpty(initExpr.getExpression)) {
                var lhs = PNF.buildNameExp(cdefName, cdefUri, Some(typ))
                v(initExpr.getExpression)
                val rhs : Exp = popResult
                createPushAssignmentLocation(lhs, rhs, ivectorEmpty, sloc)
              }

              varDecls += addSourceLoc(vd, sloc)
            case _ => throw new RuntimeException("Unexpected")
          }

          varDecls
      }
    }

    def handleBE(sloc : SourceLocation, op : BinaryOp, lhs : Exp, rhs : Exp, theType : String) : Exp =
      addSourceLoc(handleExp(PNF.buildBinaryExp(op, lhs, rhs, theType)), sloc)

    def handleBE(v : => BVisitor, sloc : SourceLocation,
                 op : BinaryOp, lhs : ExpressionClass, rhs : ExpressionClass, theType : String) : Exp = {
      v(lhs)
      val plhs : Exp = popResult

      v(rhs)
      val prhs : Exp = popResult

      handleBE(sloc, op, plhs, prhs, theType)
    }

    def handleExp(e : Exp) : Exp = e

    def convertTypeUri(uri : ResourceUri) = {
      assert(uri != null && uri != "null")
      uri match {
        case "universal integer" => StandardURIs.universalIntURI
        case "universal real"    => StandardURIs.universalRealURI
        case _                   => uri
      }
    }

    def addTypeUri[T <: PropertyProvider](pp : T, uri : ResourceUri) : T = {
      assert(uri != null && uri != "null")
      URIS.addTypeUri(pp, convertTypeUri(uri))
    }

    def addProperty[T <: PropertyProvider](key : String, value : Any, pp : T) : T = {
      if (value != "null") {
        assert(value != null && value != "")
        pp.setProperty(key, value)
      }
      pp
    }

    def introduceAnonymousType(lowBound : Exp, highBound : Exp,
                               parentTypeName : String, parentTypeUri : ResourceUri) = {
      val subtypeName = "anonymousType$" + nextAnonymousType
      val path = getContextPath :+ subtypeName
      val subtypeURI = "ada://ordinary_type__anonymous/" + path.mkString("/")

      val pilarTypeDec = TypeAliasDecl(
        URIS.addResourceUri(NameDefinition(subtypeName), subtypeURI), ivectorEmpty,
        PNF.buildNamedTypeSpec(parentTypeName, parentTypeUri))

      val cons = Some(SimpleRangeConstraint(lowBound, highBound))
      val sparkTypeDec = SubTypeDecl(subtypeName, subtypeURI, parentTypeUri, cons)
      typeDeclarations += (subtypeURI -> sparkTypeDec)

      URIS.addTypeDef(pilarTypeDec, sparkTypeDec)
      addTypeUri(pilarTypeDec, subtypeURI)
    }

    def handleTypeDefinition(o : DefinitionClass, v : => BVisitor) : (TypeDef, Option[ISeq[PackageElement]]) = {
      o.getDefinition match {
        case EnumerationTypeDefinitionEx(sloc1, enumLiteralDecls, checks) =>
          var elems = ivectorEmpty[(String, ResourceUri)]
          enumLiteralDecls.getDeclarations.foreach {
            case EnumerationLiteralSpecificationEx(sloc2, names, checks) =>
              names.getDefiningNames.foreach {
                case DefiningEnumerationLiteralEx(sloc3, defName, defUri, typ, checks) =>
                  elems :+= (defName, defUri)
              }
            case _ => throw new RuntimeException("Unexpected")
          }
          return (EnumerationTypeDef(elems), None)

        /** INTEGER TYPES **/
        case SignedIntegerTypeDefinitionEx(sloc1, integerConstraint, checks) =>
          integerConstraint.getRangeConstraint match {
            case SimpleExpressionRangeEx(sloc2, lb, hb, checks) =>
              v(lb)
              val lowBound : Exp = popResult

              v(hb)
              val highBound : Exp = popResult

              return (SignedIntegerTypeDef(Some(lowBound), Some(highBound)), None)
            case _ => throw new RuntimeException("Unexpected")
          }
        case ModularTypeDefinitionEx(sloc, modStaticExpr, checks) =>

        /** REAL TYPES **/
        //case fpd @ FloatingPointDefinitionEx(_) =>
        //case ofpd @ OrdinaryFixedPointDefinitionEx(_) =>
        //case dfpd @ DecimalFixedPointDefinitionEx(_) =>

        /** ARRAY TYPE **/
        case UnconstrainedArrayDefinitionEx(sloc, subtypes, componentDef, checks) =>
          val dim = subtypes.getExpressions.size

          val indexSubtypes = (for (s <- subtypes.getExpressions) yield {
            v(s)
            popResult.asInstanceOf[NameExp].name.uri
          }).toList

          var compTypeName : Option[String] = None
          var componentSubtype : Option[ResourceUri] = None
          componentDef.getElement match {
            case ComponentDefinitionEx(sloc, hasAliased, compDefView, checks) =>
              assert(isEmpty(hasAliased.getHasAliased))
              compDefView.getDefinition match {
                case SubtypeIndicationEx(siloc, ha, hne, smark, scons, checks) =>
                  assert(isEmpty(ha.getHasAliased))
                  assert(isEmpty(hne.getHasNullExclusion))
                  assert(isEmpty(scons.getConstraint))

                  var (_, tname, turi, _) = getName(smark.getExpression)
                  compTypeName = Some(tname)
                  componentSubtype = Some(turi)
                case _ => throw new RuntimeException("Unexpected")
              }
          }

          return (UnconstrainedArrayDef(dim, componentSubtype.get, indexSubtypes), None)
        case ConstrainedArrayDefinitionEx(sloc, discreteSubtypeDefs, arrayComponentDef, checks) =>

          var auxTypes = ivectorEmpty[PackageElement]
          var compTypeName : Option[String] = None
          var compTypeUri : Option[ResourceUri] = None

          arrayComponentDef.getElement match {
            case ComponentDefinitionEx(sloc, hasAliased, compDefView, checks) =>
              assert(isEmpty(hasAliased.getHasAliased))
              compDefView.getDefinition match {
                case SubtypeIndicationEx(siloc, ha, hne, smark, scons, checks) =>
                  assert(isEmpty(ha.getHasAliased))
                  assert(isEmpty(hne.getHasNullExclusion))

                  var (_, tname, turi, _) = getName(smark.getExpression)
                  if (!isEmpty(scons.getConstraint)) {
                    v(scons.getConstraint)
                    val t : TupleExp = popResult

                    val anon = introduceAnonymousType(t.exps(0), t.exps(1), tname, turi)

                    auxTypes :+= anon
                    compTypeName = Some(anon.name.name)
                    compTypeUri = Some(anon.name.uri)
                  } else {
                    compTypeName = Some(tname)
                    compTypeUri = Some(turi)
                  }
                case _ => throw new RuntimeException("Unexpected")
              }
          }

          var indexTypes = ivectorEmpty[ResourceUri]

          val dim = discreteSubtypeDefs.getDefinitions.size
          discreteSubtypeDefs.getDefinitions.foreach {
            case DiscreteSubtypeIndicationAsSubtypeDefinitionEx(sloc, stmark, stcons, checks) =>

              val (_, itname, ituri, _) = getName(stmark)
              var _indexUri : ResourceUri = null

              if (!isEmpty(stcons.getConstraint)) {
                v(stcons.getConstraint)
                val t : TupleExp = popResult

                val anon = introduceAnonymousType(t.exps(0), t.exps(1), itname, ituri)

                auxTypes :+= anon
                _indexUri = anon.name.uri
              } else
                _indexUri = ituri

              indexTypes :+= _indexUri
            case DiscreteSimpleExpressionRangeAsSubtypeDefinitionEx(sloc2, low, high, checks2) =>
              // e.g. type IntArray is array (0..100) of Integer;

              v(low)
              val lowBound : Exp = popResult

              v(high)
              val highBound : Exp = popResult

              val i = URIS.getTypeDef(StandardTypeDefs.StandardInteger)
              val anon = introduceAnonymousType(lowBound, highBound, i.id, i.uri)
              auxTypes :+= anon
              indexTypes :+= anon.name.uri
            case x => throw new RuntimeException("Unexpected: " + x)
          }

          return (ConstrainedArrayDef(dim, compTypeUri.get, indexTypes),
            if (auxTypes.isEmpty) None else Some(auxTypes))
        /** RECORD TYPES **/
        case RecordTypeDefinitionEx(rsloc, hasAbs, hasLim, recDef, checks) =>
          assert(isEmpty(hasAbs.getHasAbstract))
          assert(isEmpty(hasLim.getHasLimited))

          val components = mlinkedMapEmpty[String, ComponentDef]
          recDef.getDefinition match {
            case RecordDefinitionEx(rdsloc, hasLim, recordComponents, checks) =>
              assert(isEmpty(hasLim.getHasLimited))

              for (rc <- recordComponents.getRecordComponents) {
                rc match {

                  case ComponentDeclarationEx(rcsloc, names, hasAliased,
                    objDecView, initExp, aspectSpec, checks) =>
                    assert(isEmpty(hasAliased.getHasAliased))
                    assert(isEmpty(initExp.getExpression))
                    assert(aspectSpec.getElements.isEmpty)

                    var typeName : Option[String] = None
                    var typeUri : Option[String] = None

                    objDecView.getDefinition match {
                      case ComponentDefinitionEx(sloc, ha, compDefView, checks) =>
                        assert(isEmpty(ha.getHasAliased))
                        compDefView.getDefinition match {
                          case SubtypeIndicationEx(siloc, ha, hne, smark, scons, checks) =>
                            assert(isEmpty(ha.getHasAliased))
                            assert(isEmpty(hne.getHasNullExclusion))
                            assert(isEmpty(scons.getConstraint))

                            v(smark.getExpression)
                            val ne : NameExp = popResult
                            val tname = ne.name.name
                            val turi =
                              if (URIS.hasTypeUri(ne)) URIS.getTypeUri(ne)
                              else {
                                assert(URIS.isTypeUri(ne.name.uri))
                                ne.name.uri
                              }

                            //var (_, tname, turi, _) = getName(smark.getExpression)
                            typeName = Some(tname)
                            typeUri = Some(turi)
                        }
                    }

                    names.getDefiningNames.foreach { n =>
                      val (csloc, cname, curi, ctype) = getName(n)
                      components(cname) = ComponentDef(curi, typeName.get, typeUri.get,
                        handleLoc(csloc))
                    }
                  case _ => throw new RuntimeException("Unexpected")
                }
              }
          }
          return (RecordTypeDef(false, components.toMap), None)
        case DerivedTypeDefinitionEx(sloc, hasAbstract, hasLimited, parentSubtypeId, checks) =>
          assert(isEmpty(hasAbstract.getHasAbstract))
          assert(isEmpty(hasLimited.getHasLimited))

          val (sname, suri, cons) = handleSubtypeDef(parentSubtypeId.getElement, v)

          return (DerivedTypeDef(suri, cons), None)
        case x => throw new RuntimeException("Unexpected: " + x)
      }
      println(o.getDefinition)
      throw new RuntimeException
    }

    def createUIFCall(uif : String, arg : Exp, typUri : String) = {
      assert(typUri != null)
      val _typeUri = if (typUri == "null") None else Some(typUri)
      PNF.buildCallExp(uif, UIF.uifURIprefix + uif, _typeUri, arg)
    }

    def handleSubtypeDef(o : Base, v : => BVisitor) = {
      o match {
        case SubtypeIndicationEx(sloc, hasAliased, hasNullEx, subtypeMark,
          subtypeCons, checks) =>
          assert(isEmpty(hasAliased.getHasAliased))
          assert(isEmpty(hasNullEx.getHasNullExclusion))

          v(subtypeMark)
          val ne : NameExp = popResult
          val suri = ne.name.uri
          val sname = ne.name.name

          var cons : Option[Constraint] = None
          if (!isEmpty(subtypeCons.getConstraint)) {
            subtypeCons.getConstraint match {
              case SimpleExpressionRangeEx(sloc, lower, upper, checks) =>
                v(lower)
                val l : Exp = popResult

                v(upper)
                val u : Exp = popResult

                cons = Some(SimpleRangeConstraint(l, u))
              case IndexConstraintEx(sloc, ranges, checks) =>

                val subtypes = (for (r <- ranges.getDiscreteRanges) yield {
                  r match {
                    case DiscreteSubtypeIndicationEx(sloc, mark, cons, check) =>
                      val e : NameExp = if (isEmpty(cons.getConstraint)) {
                        v(mark)
                        popResult
                      } else {
                        v(cons.getConstraint)
                        popResult
                      }
                      e.name.uri
                  }
                }).toList
                cons = Some(IndexConstraint(subtypes))
            }
          }
          (sname, suri, cons)
      }
    }

    def handleTypeDeclaration(o : Base, v : => BVisitor) : ISeq[PackageElement] = {
      if (typeCache.contains(o))
        return typeCache(o)

      val typeDecls = o match {
        case OrdinaryTypeDeclarationEx(sloc, names, discriminantPart,
          typeDecView, aspectSpecs, checks) =>
          assert(names.getDefiningNames.size == 1)
          assert(isEmpty(discriminantPart.getDefinition))
          assert(aspectSpecs.getElements.isEmpty)

          val (tsloc, tname, turi, ttyp) = getName(names.getDefiningNames.head)

          val (td, auxTypes) = handleTypeDefinition(typeDecView, v)

          val pilarTypeDec = td match {
            case sit : SignedIntegerTypeDef =>
              TypeAliasDecl(URIS.addResourceUri(NameDefinition(tname), turi), ivectorEmpty,
                NamedTypeSpec(NameUser("_SIGNED_INTEGER_TYPE_"), ilistEmpty[TypeSpec]))
            case etd : EnumerationTypeDef =>
              val elems = for ((n, u) <- etd.elems) yield EnumElement(URIS.addResourceUri(NameDefinition(n), u), ivectorEmpty)
              EnumDecl(URIS.addResourceUri(NameDefinition(tname), turi), ivectorEmpty, elems.toList)
            case uad : UnconstrainedArrayDef =>
              TypeAliasDecl(URIS.addResourceUri(NameDefinition(tname), turi), ivectorEmpty,
                NamedTypeSpec(NameUser("_UNCONSTRAINED_ARRAY_"), ilistEmpty[TypeSpec]))
            case cad : ConstrainedArrayDef =>
              TypeAliasDecl(URIS.addResourceUri(NameDefinition(tname), turi), ivectorEmpty,
                NamedTypeSpec(NameUser("_ARRAY_"), ilistEmpty[TypeSpec]))
            case dtd : DerivedTypeDef =>
              TypeAliasDecl(URIS.addResourceUri(NameDefinition(tname), turi), ivectorEmpty,
                NamedTypeSpec(NameUser("_DERIVED_TYPE_"), ilistEmpty[TypeSpec]))
            case rtd : RecordTypeDef =>
              var attrs = ivectorEmpty[AttributeDecl]
              for ((k, v) <- rtd.components) {
                val attr = AttributeDecl(
                  URIS.addResourceUri(NameDefinition(k), v.refUri), ivectorEmpty,
                  Some(NamedTypeSpec(NameUser(v.typeName), ilistEmpty[TypeSpec])), None)
                addTypeUri(attr, v.typeUri)
                attrs :+= attr
              }
              RecordDecl(
                URIS.addResourceUri(NameDefinition(tname), turi), ivectorEmpty,
                ilistEmpty[(NameDefinition, ISeq[Annotation])], ilistEmpty[ExtendClause],
                attrs)
            case _ => throw new RuntimeException("Unexpected")
          }
          val ret = if (auxTypes.isDefined) auxTypes.get :+ pilarTypeDec else ivector(pilarTypeDec)

          val sparkTypeDec = FullTypeDecl(tname, turi, td)
          typeDeclarations += (turi -> sparkTypeDec)

          URIS.addTypeDef(pilarTypeDec, sparkTypeDec)
          addTypeUri(pilarTypeDec, turi)

          ret
        case SubtypeDeclarationEx(sloc, names, typeDeclView, aspectSpecs, checks) =>
          assert(names.getDefiningNames.size == 1)
          assert(aspectSpecs.getElements.isEmpty)

          val (tsloc, tname, turi, ttyp) = getName(names.getDefiningNames.head)

          val (sname, suri, cons) = handleSubtypeDef(typeDeclView.getDefinition, v)

          val pilarTypeDec = TypeAliasDecl(
            URIS.addResourceUri(NameDefinition(tname), turi), ivectorEmpty,
            PNF.buildNamedTypeSpec(sname, suri))

          val ret = ivector(pilarTypeDec)

          val sparkTypeDec = SubTypeDecl(tname, turi, suri, cons)
          typeDeclarations += (turi -> sparkTypeDec)

          URIS.addTypeDef(pilarTypeDec, sparkTypeDec)
          addTypeUri(pilarTypeDec, turi)

          ret
        case PrivateTypeDeclarationEx(sloc, names, disc, typeDec, aspects, checks) =>
          assert(names.getDefiningNames.size == 1)
          assert(isEmpty(disc.getDefinition))
          assert(aspects.getElements.isEmpty)

          val (tsloc, tname, turi, ttyp) = getName(names.getDefiningNames.head)

          val isLimited = typeDec.getDefinition match {
            case PrivateTypeDefinitionEx(sloc2, hasA, hasLimited, checks2) =>
              assert(isEmpty(hasA.getHasAbstract))
              !isEmpty(hasLimited.getHasLimited)
            case x => throw new RuntimeException("Unexpected: " + x)
          }
          val pilarTypeDec = TypeAliasDecl(
            URIS.addResourceUri(NameDefinition(tname), turi), ivectorEmpty,
            NamedTypeSpec(NameUser("_PRIVATE_TYPE_DECLARATION_"), ilistEmpty[TypeSpec]))

          val ret = ivector(pilarTypeDec)

          val fullTypeDec = typeDeclarations(turi.replaceFirst("private_type", "ordinary_type"))

          val sparkTypeDec = PrivateTypeDecl(tname, turi, false, isLimited, fullTypeDec.uri)
          typeDeclarations += (turi -> sparkTypeDec)

          URIS.addTypeDef(pilarTypeDec, sparkTypeDec)
          addTypeUri(pilarTypeDec, turi)

          ret
        case _ => throw new RuntimeException("Unexpected: " + o)
      }

      typeCache(o) = typeDecls
      typeDecls
    }

    def constructScope(v : => BVisitor, o : Base, isMethodCompilationUnit : Boolean = false) : Scope = {
      if (scopeCache.contains(o)) {
        scopeStack.push(scopeCache(o))
        scopeStack.head
      } else {
        if (isMethodCompilationUnit) constructPushScope(v, o)
        else
          o match {
            case i : PackageBodyDeclaration        => constructPushScope(v, i)
            case i : PackageDeclaration            => constructPushScope(v, i)

            case i : ExpressionFunctionDeclaration => constructPushScope(v, i)
            case i : FunctionBodyDeclaration       => constructPushScope(v, i, i.getBodyDeclarativeItemsQl)
            case i : FunctionDeclaration           => constructPushScope(v, i)
            case i : ProcedureBodyDeclaration      => constructPushScope(v, i, i.getBodyDeclarativeItemsQl)
            case i : ProcedureDeclaration          => constructPushScope(v, i)
            case x                                 => throw new RuntimeException()
          }
      }
    }

    private def constructPushScope(v : => BVisitor, o : Base, bodyDeclItems : ElementList) : Scope = {
      val consDecls = TranslatorUtil.getConstantDeclarations(bodyDeclItems.getElements)
      val localDecls = TranslatorUtil.getVariableDeclarations(bodyDeclItems.getElements)
      val typeDecls = TranslatorUtil.getTypeDeclarations(bodyDeclItems.getElements)

      constructPushScope(v, o,
        if (typeDecls.isEmpty) None else Some(typeDecls), None,
        if (consDecls.isEmpty) None else Some(consDecls), None,
        if (localDecls.isEmpty) None else Some(localDecls), None, None)
    }

    private def constructPushScope(v : => BVisitor, o : PackageBodyDeclaration) : Scope = {
      val publicTypes = TranslatorUtil.getTypeDeclarations(o.getBodyDeclarativeItemsQl.getElements)
      val publicConstants = TranslatorUtil.getConstantDeclarations(o.getBodyDeclarativeItemsQl.getElements)
      val publicGlobals = TranslatorUtil.getVariableDeclarations(o.getBodyDeclarativeItemsQl.getElements)
      val bodyStatements = if (o.getBodyStatementsQl.getStatements.isEmpty) None else Some(o.getBodyStatementsQl)

      constructPushScope(v, o,
        if (publicTypes.isEmpty) None else Some(publicTypes), None,
        if (publicConstants.isEmpty) None else Some(publicConstants), None,
        if (publicGlobals.isEmpty) None else Some(publicGlobals), None,
        bodyStatements)
    }

    private def constructPushScope(v : => BVisitor, o : PackageDeclaration) : Scope = {
      val publicTypes = TranslatorUtil.getTypeDeclarations(o.getVisiblePartDeclarativeItemsQl.getDeclarativeItems)
      val privateTypes = TranslatorUtil.getTypeDeclarations(o.getPrivatePartDeclarativeItemsQl.getDeclarativeItems)

      val publicConstants = TranslatorUtil.getConstantDeclarations(o.getVisiblePartDeclarativeItemsQl.getDeclarativeItems)
      val privateConstants = TranslatorUtil.getConstantDeclarations(o.getPrivatePartDeclarativeItemsQl.getDeclarativeItems)

      val publicGlobals = TranslatorUtil.getVariableDeclarations(o.getVisiblePartDeclarativeItemsQl.getDeclarativeItems)
      val privateGlobals = TranslatorUtil.getVariableDeclarations(o.getPrivatePartDeclarativeItemsQl.getDeclarativeItems)

      constructPushScope(v, o,
        if (publicTypes.isEmpty) None else Some(publicTypes),
        if (privateTypes.isEmpty) None else Some(privateTypes),
        if (publicConstants.isEmpty) None else Some(publicConstants),
        if (privateConstants.isEmpty) None else Some(privateConstants),
        if (publicGlobals.isEmpty) None else Some(publicGlobals),
        if (privateGlobals.isEmpty) None else Some(privateGlobals),
        None)
    }

    private def constructPushScope(v : => BVisitor, o : Base,
                                   publicTypes : Option[MBuffer[Base]] = None,
                                   privateTypes : Option[MBuffer[Base]] = None,
                                   publicConstants : Option[MBuffer[Base]] = None,
                                   privateConstants : Option[MBuffer[Base]] = None,
                                   publicVariables : Option[MBuffer[VariableDeclaration]] = None,
                                   privateVariables : Option[MBuffer[VariableDeclaration]] = None,
                                   bodyStatements : Option[StatementList] = None) : Scope = {

      val constants = mlistEmpty[ConstElement]
      val typeDeclarations = mlistEmpty[PackageElement]
      val variableDeclarations = mlistEmpty[PilarAstNode]

      val ret = Scope(constants, None, typeDeclarations, variableDeclarations)
      scopeStack.push(ret)
      scopeCache(o) = ret

      val old = noTempVars
      noTempVars(true)

      if (this.processingPackage) {
        // type declarations may refer to global vars so we need to introduce
        // the global var name/uri translations first
        val vars = (if (publicVariables.isDefined) publicVariables.get else ivectorEmpty) ++
          (if (privateVariables.isDefined) privateVariables.get else ivectorEmpty)

        vars.foreach {
          case VariableDeclarationEx(_, names, _, _, _, _, _) =>
            names.getDefiningNames.foreach {
              case di : DefiningIdentifier => convertGlobal(di.getDefName, di.getDef)
            }
        }
      }

      if (privateTypes.isDefined)
        for (td <- privateTypes.get)
          typeDeclarations ++= handleTypeDeclaration(td, v)

      if (publicTypes.isDefined)
        for (td <- publicTypes.get)
          typeDeclarations ++= handleTypeDeclaration(td, v)

      if (publicConstants.isDefined)
        for (c <- publicConstants.get)
          constants ++= handleConstant(v, c)

      if (privateConstants.isDefined)
        for (c <- privateConstants.get)
          constants ++= handleConstant(v, c)

      noTempVars(old)

      val ll = pushLocationList
      if (publicVariables.isDefined)
        for (g <- publicVariables.get)
          variableDeclarations ++= handleVariableDeclaration(v, g)

      if (privateVariables.isDefined)
        for (g <- privateVariables.get)
          variableDeclarations ++= handleVariableDeclaration(v, g)

      if (bodyStatements.isDefined)
        v(bodyStatements.get)

      val _ll = popLocationList
      assert(ll eq _ll)

      if (!_ll.isEmpty)
        ret.initBlock = Some(_ll)

      ret
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

      globalUriMap(uri) = returi
      globalNameMap(uri) = retname

      (retname, returi)
    }

    def rewriteName(uri : ResourceUri, name : String) = globalNameMap.getOrElse(uri, name)
    def rewriteUri(uri : ResourceUri) : ResourceUri = globalUriMap.getOrElse(uri, uri)

    /*
     * rewrites global names and uris
     * 
     * returns sloc, refName, refUri, typUri
     */
    def getName(o : Base) : (SourceLocation, String, String, String) = {
      o match {
        case ExpressionClassEx(exp) => getName(exp)
        case DefiningIdentifierEx(sloc, defName, defUri, typ, checks) =>
          (sloc, rewriteName(defUri, defName), rewriteUri(defUri), typ)
        case IdentifierEx(sloc, refName, refUri, typ, checks) =>
          (sloc, rewriteName(refUri, refName), rewriteUri(refUri), typ)
        case _ => throw new RuntimeException("Unexpected: " + o)
      }
    }

    def stripParens(x : Base) : Base = {
      x match {
        case o : ParenthesizedExpression => stripParens(o.getExpressionParenthesizedQ)
        case o : ExpressionClass         => stripParens(o.getExpression)
        case _                           => x
      }
    }

    def toString(s : SourceLocation) = {
      s"[${s.getLine}, ${s.getCol}]"
    }
  }

  def packageH(ctx : VContext, v : => BVisitor) : VisitorFunction = {
      def createConstDecl(isSpec : Boolean, constants : ISeq[ConstElement]) = {
        val name = "$CONST"
        val path = ctx.getContextPath :+ name
        val uri = (if (isSpec) PackageURIs.constSpecDeclPrefixUri
        else PackageURIs.constBodyDeclPrefixUri) + path.mkString("/")
        val nd = NameDefinition(name)
        URIS.addResourceUri(nd, uri)
        ConstDecl(nd, ivectorEmpty, constants)
      }

      def handlePackage(o : Base, sloc : SourceLocation, names : DefiningNameList,
                        aspectSpec : ElementList, visibleDecls : java.util.List[Base],
                        privateDecls : Option[java.util.List[Base]], checks : String) {

        assert(names.getDefiningNames.length == 1)
        v(names.getDefiningNames.head)
        val pname : NameDefinition = ctx.popResult

        val isSpec = o.isInstanceOf[PackageDeclaration]

        ctx.pushContext(Context(CTX.PACKAGE, pname.name, pname.uri))

        val scope = ctx.constructScope(v, o)

        val packElems = mlistEmpty[PackageElement]

        for (m <- TranslatorUtil.getMethodDeclarations(visibleDecls)) {
          v(m)
          packElems += ctx.popResult
        }

        if (privateDecls.isDefined) {
          for (m <- TranslatorUtil.getMethodDeclarations(privateDecls.get)) {
            v(m)
            packElems += ctx.popResult
          }
        }

        val _scope = ctx.scopeStack.pop
        assert(_scope eq scope)

        val elements = scope.typeDeclarations

        if (!scope.constants.isEmpty)
          elements += createConstDecl(isSpec, scope.constants.toList)

        val (globals, locals) = scope.variableDeclarations.partition(_.isInstanceOf[GlobalVarDecl])
        elements ++= globals.asInstanceOf[MList[GlobalVarDecl]]

        if (scope.initBlock.isDefined) {
          val name = if (isSpec) "$$sinit"
          else "$$binit"

          val path = ctx.getContextPath :+ name
          val uri = if (isSpec) PackageURIs.initSpecProcedureURIprefix + path.mkString("/")
          else PackageURIs.initBodyProcedureURIprefix + path.mkString("/")

          val nd = URIS.addResourceUri(NameDefinition(name), uri)

          scope.initBlock.get += JumpLocation(Some(ctx.newLocLabel), ivectorEmpty,
            ReturnJump(ivectorEmpty, None))

          val body = ImplementedBody(locals.asInstanceOf[MList[LocalVarDecl]].toList,
            scope.initBlock.get.toList, ivectorEmpty)
          val p = PNF.buildProcedureDecl(name, uri, pname.uri,
            ivectorEmpty, None, body)
          elements += p
        }
        elements ++= packElems

        val pack = PNF.buildPackageDecl(pname, elements.toList)

        import org.sireum.bakar.symbol.BakarSymbol._
        aspectSpec.getElements.foreach {
          case AspectSpecificationEx(sloc, mark, definition, checks) =>
            v(mark)
            val _aspect = ctx.popResult.asInstanceOf[NameExp].name.name.toLowerCase

            _aspect match {
              case "abstract_state" | "refined_state" =>
                v(definition)

                ctx.popResult.asInstanceOf[Exp] match {
                  case i : NameExp =>
                    assert(_aspect == "abstract_state")
                    pack.abstractState = ivector(i)
                  case i : NewRecordExp =>
                    val r = (for (a <- i.attributeInits) yield {
                      (NameExp(a.name), a.exp match {
                        case fe : FunExp => (for (
                          m <- fe.matchings;
                          c <- m.exp.asInstanceOf[SwitchExp].cases
                        ) yield c.exp.asInstanceOf[NameExp])
                        case ne : NameExp => ivector(ne)
                      })
                    })
                    if (_aspect == "refined_state") pack.refinedState = r
                    else pack.abstractState = r.map(_._2.head)
                }
              case "spark_mode" =>
                val mode = if (!ctx.isEmpty(definition.getElement)) {
                  v(definition)
                  ctx.popResult.asInstanceOf[NameExp].name.name.toLowerCase match {
                    case "on"  => true
                    case "off" => false
                  }
                } else true
                pack.sparkMode = mode
              case "initializes" =>
                var inits = ivectorEmpty[Exp]
                v(definition)
                ctx.popResult.asInstanceOf[Exp] match {
                  case ne @ NameExp(nu) =>
                    inits :+= ne
                  case nre @ NewRecordExp(_, ais) =>
                    inits ++= (for (a <- ais) yield if (a.name == null) a.exp
                    else TupleExp(ivector(NameExp(a.name), a.exp)))
                }
                pack.initializes = inits
              case x => throw new RuntimeException("Unexpected: " + x)
            }
        }

        ctx.pushResult(pack, sloc)
        ctx.popContext
      }

    {
      case o @ CompilationUnitEx(sloc, contextClauseElements, unitDeclaration,
        pragmasAfter, unitKind, unitClass, unitOrigin, unitFullName, defName, sourceFile, checks) =>

        val pack = if (TranslatorUtil.isPackageDeclaration(unitDeclaration.getDeclaration)) {
          v(unitDeclaration)
          ctx.popResult.asInstanceOf[PackageDecl]
        } else if (TranslatorUtil.isMethodDeclaration(unitDeclaration.getDeclaration)) {
          val pname = "__anonymousPackage$" + ctx.nextAnonymousPackage
          val puri = PackageURIs.anonymousPackageBodyURIprefix + pname

          ctx.pushContext(Context(CTX.METHOD, pname, puri))
          val scope = ctx.constructScope(v, unitDeclaration.getDeclaration, true)
          ctx.scopeCache -= unitDeclaration.getDeclaration

          v(unitDeclaration)
          val p : ProcedureDecl = ctx.popResult

          val _scope = ctx.scopeStack.pop
          assert(scope eq _scope)

          val elements = _scope.typeDeclarations
          if (!_scope.constants.isEmpty)
            elements += createConstDecl(false, _scope.constants.toList)

          elements += p

          val name = URIS.addResourceUri(NameDefinition(pname), puri)
          ctx.popContext

          PNF.buildPackageDecl(name, elements.toList)
        } else
          throw new RuntimeException("Unexpected compilation unit: " + o)

        ctx.models += PNF.buildModel(sourceFile, ivector(pack))

          def vi(names : java.util.List[Base]) : ISeq[NameExp] =
            (for (n <- names) yield {
              v(n)
              ctx.popResult.asInstanceOf[NameExp]
            }).toList

          def sparkModeOn(assocs : AssociationList) =
            if (!assocs.getAssociations.isEmpty) {
              assert(assocs.getAssociations.size == 1)
              v(assocs.getAssociations.head.asInstanceOf[PragmaArgumentAssociation].getActualParameterQ)
              ctx.popResult.asInstanceOf[NameExp].name.name.toLowerCase == "on"
            } else true

        var withClauses = ivectorEmpty[NameExp]
        var useClauses = ivectorEmpty[NameExp]
        var useTypeClauses = ivectorEmpty[NameExp]

        import org.sireum.bakar.symbol.BakarSymbol._
        contextClauseElements.getContextClauses.foreach {
          case ImplementationDefinedPragmaEx(sloc2, assocs, pragmaName, checks2) =>
            assert(pragmaName.toLowerCase == "spark_mode")
            pack.sparkMode = sparkModeOn(assocs)
          case WithClauseEx(sloc2, hasLimited, hasPrivate, names, checks2) =>
            assert(ctx.isEmpty(hasLimited.getHasLimited))
            assert(ctx.isEmpty(hasPrivate.getHasPrivate))
            withClauses ++= vi(names.getNames)
          case UsePackageClauseEx(sloc2, names, checks2) =>
            useClauses ++= vi(names.getNames)
          case UseTypeClauseEx(sloc2, names, checks2) =>
            useTypeClauses ++= vi(names.getNames)
          case x => throw new RuntimeException("Unknown: " + x)
        }
        if (!withClauses.isEmpty) pack.withClauses = withClauses
        if (!useClauses.isEmpty) pack.useClauses = useClauses
        if (!useTypeClauses.isEmpty) pack.useTypeClauses = useTypeClauses

        pragmasAfter.getElements.foreach {
          case ImplementationDefinedPragmaEx(sloc2, assocs, pragmaName, checks2) =>
            assert(pragmaName.toLowerCase == "spark_mode")
            pack.sparkMode = sparkModeOn(assocs)
        }

        false
      case o @ PackageDeclarationEx(sloc, names, aspectSpec,
        visiblePartDecItems, privatePartDecItems, checks) =>

        handlePackage(o, sloc, names, aspectSpec, visiblePartDecItems.getDeclarativeItems,
          Some(privatePartDecItems.getDeclarativeItems), checks)

        false
      case o @ PackageBodyDeclarationEx(sloc, names, aspectSpec,
        bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>

        assert(bodyExceptionHandlers.getExceptionHandlers.isEmpty)

        handlePackage(o, sloc, names, aspectSpec, bodyDecItems.getElements,
          None, checks)

        false
    }
  }

  def methodH(ctx : VContext, v : => BVisitor) : VisitorFunction = {
      def handleMethod(o : Base, sloc : SourceLocation, names : DefiningNameList,
                       paramProfile : ParameterSpecificationList,
                       bodyDeclItems : Option[ElementList], bodyStatements : Option[StatementList],
                       resultProfile : Option[ElementClass], aspectSpecs : ElementList,
                       isOverridingDec : Option[Base], isNotOverridingDec : Option[Base]) = {

        assert(isOverridingDec.isEmpty || ctx.isEmpty(isOverridingDec.get))
        assert(isNotOverridingDec.isEmpty || ctx.isEmpty(isNotOverridingDec.get))

        import org.sireum.util.FileLineColumnLocation._
        assert(names.getDefiningNames.length == 1)
        val (sloc2, methodDefName, methodDefUri, methodTypeUri) = ctx.getName(names.getDefiningNames.get(0))

        ctx.pushContext(Context(CTX.METHOD, methodDefName, methodDefUri))

        val scope = ctx.constructScope(v, o)

        val params = mlistEmpty[ParamDecl]
        paramProfile.getParameterSpecifications.foreach {
          case ParameterSpecificationEx(sloc3, pnames, _hasAliased, _hasNullEx,
            objDecView, _initExpr, mode, checks) =>
            // e.g (I : Integer) or (I, J : 
            assert(ctx.isEmpty(_hasAliased.getHasAliased))
            assert(ctx.isEmpty(_hasNullEx.getHasNullExclusion))
            assert(ctx.isEmpty(_initExpr.getExpression))

            v(objDecView.getDefinition)
            val odv = ctx.popResult.asInstanceOf[NameExp]
            val typUri = odv.name.uri
            ctx.addTypeUri(odv.name, typUri)

            pnames.getDefiningNames.foreach {
              case pname : DefiningIdentifier =>
                val (sloc, defName, defUri, typ) = ctx.getName(pname)

                val typeSpec = PNF.buildNamedTypeSpec(odv.name, typUri)
                val pd = PNF.buildParamDecl(pname.getDefName, defUri, typeSpec)

                import org.sireum.bakar.symbol.BakarSymbol._
                pd.mode = mode

                params += ctx.addSourceLoc(pd, sloc)
              case _ => throw new RuntimeException("Unexpected")
            }
          case _ => throw new RuntimeException("Unexpected")
        }

        ctx.pushLocationList

        if (bodyStatements.isDefined) {
          v(bodyStatements.get)
        }

        val returnType : Option[TypeSpec] = resultProfile match {
          case Some(e) =>
            v(e)
            val ne : NameExp = ctx.popResult
            val typeUri = ne.name.uri
            if (!URIS.hasTypeUri(ne.name))
              ctx.addTypeUri(ne.name, typeUri)
            val nts = PNF.buildNamedTypeSpec(ne.name, typeUri)
            ne.propertyMap.foreach { case (key, value) => nts.setProperty(key, value) }
            Some(nts)
          case None => {
            if (bodyDeclItems.isDefined) {
              // ada procedure body so add an empty return to the body
              ctx.pushLocation(
                JumpLocation(Some(ctx.newLocLabel), ivectorEmpty,
                  ReturnJump(ivectorEmpty, None)))
            }
            None
          }
        }

        val _scope = ctx.scopeStack.pop
        assert(_scope eq scope)

        val parentScope = ctx.scopeStack.head
        parentScope.constants ++= scope.constants
        parentScope.typeDeclarations ++= scope.typeDeclarations

        val locs =
          if (scope.initBlock.isDefined) scope.initBlock.get ++ ctx.popLocationList
          else ctx.popLocationList

        val localVars = scope.variableDeclarations.asInstanceOf[MList[LocalVarDecl]]

        val body = if (!locs.isEmpty) ImplementedBody(localVars.toList, locs.toList, ivectorEmpty)
        else EmptyBody()

        val parentUri = ctx.contextStack.tail.head.uri
        val pd = PNF.buildProcedureDecl(methodDefName, methodDefUri,
          parentUri, params.toList, returnType, body)
        pd.name at (ctx.fileUri, sloc2.getLine, sloc2.getCol)

        ctx.noTempVars(true)
        ctx.inProofContext = true
        aspectSpecs.getElements.foreach {
          case AspectSpecificationEx(sloc, mark, aspectDef, checks) =>
            val (_, m, _, _) = ctx.getName(mark.getElement)
            val ml = m.toLowerCase

            import org.sireum.bakar.symbol.BakarSymbol._
            ml match {
              case "contract_cases" =>
                var exps = ilistEmpty[Exp]
                aspectDef.getElement match {
                  case RecordAggregateEx(sloc2, assocs, typ, checks) =>
                    assocs.getAssociations.foreach {
                      case RecordComponentAssociationEx(sloc3, choices, exp, checks) =>
                        v(exp)
                        val rhs : Exp = ctx.popResult

                        choices.getExpressions.foreach {
                          case OthersChoiceEx(sloc, checks) =>
                            exps :+= rhs
                          case x =>
                            v(x)
                            exps :+= TupleExp(ivector(ctx.popResult, rhs))
                        }
                    }
                }
                pd.contractCases = exps
              case "convention" =>
                v(aspectDef.getElement)
                val ne : NameExp = ctx.popResult

                ne.name.name.toLowerCase match {
                  case "ghost" => pd.isGhostFunction = true
                }
              case "post" | "refined_post" =>
                v(aspectDef.getElement)
                if (ml == "post") pd.post = ctx.popResult
                else pd.postRefined = ctx.popResult
              case "pre" =>
                v(aspectDef.getElement)
                pd.pre = ctx.popResult
              case "global" | "refined_global" =>
                var ins = isetEmpty[ResourceUri]
                var outs = isetEmpty[ResourceUri]
                var proofs = isetEmpty[ResourceUri]

                v(aspectDef.getElement)
                ctx.popResult.asInstanceOf[Exp] match {
                  case i : NewRecordExp =>
                    for (ai <- i.attributeInits) {
                      val values = ai.exp match {
                        case i : NameExp => ivector(i.name.uri)
                        case i : FunExp =>
                          assert(i.matchings.size == 1)
                          i.matchings.head.exp.asInstanceOf[SwitchExp].cases.map(f =>
                            f.exp.asInstanceOf[NameExp].name.uri)
                      }
                      ai.name.name.toLowerCase match {
                        case "input"  => ins ++= values
                        case "output" => outs ++= values
                        case "in_out" =>
                          ins ++= values
                          outs ++= values
                        case "proof_in" => proofs ++= values
                      }
                    }
                  case i : NameExp =>
                    if (i.name.uri == "null")
                      throw new RuntimeException("null URI for Global " + i.name.name)
                    ins += i.name.uri
                  case x => throw new RuntimeException("Unexpected: " + x)
                }
                if (ml == "global") {
                  if (!ins.isEmpty) pd.globalsIn = ins
                  if (!outs.isEmpty) pd.globalsOut = outs
                  if (!proofs.isEmpty) pd.globalsProof = proofs
                } else {
                  if (!ins.isEmpty) pd.globalsRefinedIn = ins
                  if (!outs.isEmpty) pd.globalsRefinedOut = outs
                  if (!proofs.isEmpty) pd.globalsProof = proofs
                }
              case "depends" | "refined_depends" =>
                var assoc = ivectorEmpty[(ISet[String], ISet[String])]

                ctx.stripParens(aspectDef.getElement) match {
                  case RecordAggregateEx(rasloc, associations, _, checks) =>
                    associations.getAssociations.foreach {
                      case RecordComponentAssociationEx(_, choices, exp, checks) =>

                        def helper(e : Any) : ISet[String] = {
                            var ret = isetEmpty[String]
                            e match {
                              case FunctionCallEx(sloc2, prefix, params, _, _, _, _) =>
                                assert(prefix.getExpression.isInstanceOf[UnaryPlusOperator])
                                assert(params.getAssociations.size == 1)

                                val x = (params.getAssociations.head.asInstanceOf[ParameterAssociation]).getActualParameterQ.getExpression
                                ret ++= helper(x)
                              case NullLiteralEx(sloc2, typ, checks2) => ivectorEmpty
                              case PositionalArrayAggregateEx(sloc4, arrassoc, typ, checks2) =>
                                arrassoc.getAssociations.foreach {
                                  case ArrayComponentAssociationEx(_, _choices, _exp, checks2) =>
                                    assert(_choices.getElements.isEmpty)
                                    val (_, _, refuri, _) = ctx.getName(ctx.stripParens(_exp.getExpression))
                                    ret += ctx.rewriteUri(refuri)
                                }
                              case IdentifierEx(_, refName, refUri, _, checks2) =>
                                ret += ctx.rewriteUri(refUri)
                            }
                            ret
                          }

                        val rhs = helper(ctx.stripParens(exp.getExpression))
                        assert(choices.getExpressions.size == 1)
                        val lhs = helper(ctx.stripParens(choices.getExpressions.head))

                        assoc :+= (lhs, rhs)
                    }
                }
                var d = imapEmpty[ResourceUri, ISet[ResourceUri]]
                for ((outputs, inputs) <- assoc; out <- outputs) {
                  d += (out -> inputs)
                }
                if (ml == "depends") pd.depends = d else pd.dependsRefined = d
              case "test_case" =>
                v(aspectDef.getElement)
                val x : NewRecordExp = ctx.popResult

                var name : String = null
                var mode : TestCaseMode = null
                var requires : Option[Exp] = None
                var ensures : Option[Exp] = None
                x.attributeInits.foreach(f =>
                  f.name.name.toLowerCase match {
                    case "name" => name = f.exp.asInstanceOf[LiteralExp].text
                    case "mode" =>
                      f.exp.asInstanceOf[NameExp].name.name.toLowerCase match {
                        case "nominal"    => mode = TestCaseMode.Nominal
                        case "robustness" => mode = TestCaseMode.Robustness
                      }
                    case "requires" => requires = Some(f.exp)
                    case "ensures"  => ensures = Some(f.exp)
                  })

                var testCases = if (pd.testCases.isDefined) pd.testCases.get
                else ivectorEmpty[TestCase]

                pd.testCases = testCases :+ TestCase(name, mode, requires, ensures)
            }
          case x => throw new RuntimeException("Unexpected: " + x)
        }
        ctx.inProofContext = false
        ctx.noTempVars(false)

        ctx.popContext
        pd
      }

    {
      case o @ ExpressionFunctionDeclarationEx(sloc, names, paramProfile, resultProfile,
        resultExp, aspectSpec, checks) =>

        val rt = new ReturnStatement()
        rt.setChecks(checks)
        rt.setLabelNamesQl(new DefiningNameList())
        rt.setReturnExpressionQ(resultExp)
        rt.setSloc(sloc)

        val bodyStatements = new StatementList()
        bodyStatements.getStatements.add(rt)

        val m = handleMethod(o, sloc, names, paramProfile, None,
          Some(bodyStatements), Some(resultProfile), aspectSpec, None, None)

        ctx.pushResult(m, sloc)
        false
      case o @ FunctionDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, isNotNullReturn, resultProfile, hasAbstract, aspectSpec, checks) =>

        assert(ctx.isEmpty(isNotNullReturn.getIsNotNullReturn))
        assert(ctx.isEmpty(hasAbstract.getHasAbstract))

        val m = handleMethod(o, sloc, names, paramProfile, None, None,
          Some(resultProfile),
          aspectSpec, Some(isOverridingDec.getIsOverriding),
          Some(isNotOverridingDec.getIsNotOverriding))

        ctx.pushResult(m, sloc)
        false
      case o @ FunctionBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, isNotNullReturn, resultProfile, aspectSpec,
        bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>

        assert(ctx.isEmpty(isNotNullReturn.getIsNotNullReturn))
        assert(bodyExceptionHandlers.getExceptionHandlers.isEmpty)

        val m = handleMethod(o, sloc, names, paramProfile, Some(bodyDecItems),
          Some(bodyStatements), Some(resultProfile), aspectSpec,
          Some(isOverridingDec.getIsOverriding), Some(isNotOverridingDec.getIsNotOverriding))
        ctx.pushResult(m, sloc)

        false
      case o @ ProcedureBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, aspectSpec, bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>

        assert(bodyExceptionHandlers.getExceptionHandlers.isEmpty)

        val m = handleMethod(o, sloc, names, paramProfile, Some(bodyDecItems),
          Some(bodyStatements), None, aspectSpec,
          Some(isOverridingDec.getIsOverriding), Some(isNotOverridingDec.getIsNotOverriding))
        ctx.pushResult(m, sloc)

        false
      case o @ ProcedureDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
        names, paramProfile, hasAbstract, aspectSpec, checks) =>

        assert(ctx.isEmpty(hasAbstract.getHasAbstract))

        val m = handleMethod(o, sloc, names, paramProfile, None, None, None,
          aspectSpec, Some(isOverridingDec.getIsOverriding),
          Some(isNotOverridingDec.getIsNotOverriding))

        ctx.pushResult(m, sloc)
        false
    }
  }

  def nameH(ctx : VContext, v : => BVisitor) : VisitorFunction = {
    case o : DefiningIdentifier =>
      val (sloc, name, refUri, typeUri) = ctx.getName(o)

      val nd = URIS.addResourceUri(NameDefinition(name), refUri)
      if (typeUri != "null") ctx.addTypeUri(nd, typeUri)

      ctx.pushResult(nd, sloc)
      false
    case EnumerationLiteralEx(sloc, refName, refUri, typeUri, checks) =>
      if (typeUri == StandardURIs.boolURI) {
        val le = if (refName.toLowerCase == "true") PNF.TRUE else PNF.FALSE
        ctx.pushResult(le, sloc)
      } else {
        val ne = PNF.buildNameExp(refName, refUri, Some(typeUri))
        ctx.pushResult(ne, sloc)
      }
      false
    case o : Identifier =>
      val (sloc, name, refUri, typeUri) = ctx.getName(o)

      val _typeUri = if (typeUri == "null" && URIS.isTypeUri(refUri)) refUri
      else typeUri

      val nu = URIS.addResourceUri(NameUser(name), refUri)

      val ne = NameExp(nu)
      if (_typeUri != "null") {
        ctx.addTypeUri(nu, _typeUri)
        ctx.addTypeUri(ne, _typeUri)
      }

      ctx.pushResult(ne, sloc)
      false
    case SelectedComponentEx(sloc, prefix, selector, theType, checks) =>

      v(prefix.getExpression)
      val p : Exp = ctx.popResult

      val (_, sname, suri, _) = ctx.getName(selector)

      // TODO: need to type prefix to determine if this is a 
      // AccessExp, field lookup, etc...
      var ret : Option[Exp] = None
      p match {
        case NameExp(ns) =>
          ret = Some(NameExp(NameUser(ns.name + "::" + sname)))
        case x : IndexingExp =>
          ret = Some(AccessExp(x, NameUser(sname)))
        case q => throw new RuntimeException("Unexpected: " + q)
      }
      assert(ret.isDefined)

      ctx.pushResult(ret.get, sloc)
      false
  }

  def statementH(ctx : VContext, v : => BVisitor) : VisitorFunction = {
    case AssignmentStatementEx(sloc, labelNames, assignmentVariableName, assignmentExpression, checks) =>

      v(assignmentVariableName)
      val lhs : Exp = ctx.popResult

      v(assignmentExpression)
      val rhs : Exp = ctx.popResult

      ctx.createPushAssignmentLocation(lhs, rhs, ivectorEmpty, sloc)
      false
    case BlockStatementEx(sloc, labelNames, id, decItems, statements, exceptionHandlers, checks) =>
      assert(exceptionHandlers.getExceptionHandlers.isEmpty)

      if (!ctx.isEmpty(id.getDefiningName)) {
        // FIXME:
        Console.err.println("Need to handle block ids")
      }

      // FIXME: variable shadowing could occur, however this will just be the
      // name, not the uri.  
      for (local <- decItems.getDeclarativeItems) {
        val ls : MList[LocalVarDecl] = ctx.handleVariableDeclaration(v, local).asInstanceOf[MList[LocalVarDecl]]
        ls.foreach(lvd => ctx.localsPush(lvd))
      }

      v(statements)

      false
    case CaseStatementEx(sloc, labelNames, exp, statementPaths, checks) =>
      val isSingle = statementPaths.getPaths.size == 1
      val endLoc = ctx.newLocLabel
      var gotoLoc = if (isSingle) endLoc else ctx.newLocLabel

      val first = statementPaths.getPaths.head
      val last = statementPaths.getPaths.get(statementPaths.getPaths.size - 1)

      statementPaths.getPaths.foreach {
        case e @ CasePathEx(sloc, choices, statements, checks) =>
          if (e ne first) {
            // #<gotoLoc>.
            ctx.pushLocation(ctx.createEmptyLocation(gotoLoc, ivectorEmpty))
            gotoLoc = ctx.newLocLabel
          }

          var isLast = ctx.handleMembershipTest(v, exp, choices) match {
            case BinaryExp(_, _, ExternalExp(_)) =>
              // others case
              true
            case x =>
              // #l0. if(!condExp) then goto <gotoLoc>;
              val ue = PNF.buildUnaryExp(PilarAstUtil.NOT_UNOP, x, StandardURIs.boolURI)
              val jl = PNF.buildIfJumpLocation(ue, ctx.newLocLabel, if (e eq last) endLoc else gotoLoc)
              ctx.pushLocation(jl)
              e eq last
          }

          v(statements)

          if (!isLast) {
            // # goto endLoc;
            val gl = ctx.createGotoJumpLocation(endLoc, ivectorEmpty, sloc)
            ctx.pushLocation(gl)
          }
        case x => throw new RuntimeException("Unexpected: " + x)
      }

      ctx.pushLocation(ctx.createEmptyLocation(endLoc))
      false
    case ExitStatementEx(sloc, labelNames, exitLoopName, exitCond, checks) =>
      // TODO: currently ignoring exitLoopName

      if (!ctx.isEmpty(exitCond.getExpression)) {
        v(exitCond)
        val c : Exp = ctx.popResult

        val exitJl = PNF.buildIfJumpLocation(c, ctx.newLocLabel, ctx.peekExitLocation.name.get)
        ctx.pushLocation(exitJl)

      } else {
        ctx.pushLocation(ctx.createGotoJumpLocation(ctx.peekExitLocation.name.get, ivectorEmpty, sloc))
      }
      false
    case ForLoopStatementEx(sloc, labelnames, statementIdentifier,
      forLoopParameterSpecification, loopStatements, checks) =>

      ctx.handleLoop(v, sloc, Some(labelnames), Some(statementIdentifier),
        forLoopParameterSpecification.getDeclaration,
        Some(loopStatements), None, None, checks)

      false
    case IfStatementEx(sloc, labelNames, statementPaths, checks) =>
      val isSingle = statementPaths.getPaths.size == 1
      val endLoc = ctx.newLocLabel
      var gotoLoc = if (isSingle) endLoc else ctx.newLocLabel

        def render(sloc1 : SourceLocation, condExp : ExpressionClass, statements : StatementList, isIfElse : Boolean) = {
          if (isIfElse) {
            // #<gotoLoc>.
            ctx.pushLocation(ctx.createEmptyLocation(gotoLoc, ivectorEmpty))
            gotoLoc = ctx.newLocLabel
          }

          v(condExp)

          val cond : Exp = ctx.popResult
          val condLoc = ctx.getSourceLoc(cond)

          // #l0. if(!condExp) then goto <gotoLoc>;
          val ue = PNF.buildUnaryExp(PilarAstUtil.NOT_UNOP, cond, StandardURIs.boolURI)
          val jl = PNF.buildIfJumpLocation(ue, ctx.newLocLabel, gotoLoc)

          jl(Location.locPropKey) = condLoc.get
          ctx.pushLocation(jl)

          // ... eval body statements
          v(statements)

          if (!isSingle) {
            // # goto endLoc;
            val gl = ctx.createGotoJumpLocation(endLoc, ivectorEmpty, sloc1)
            ctx.pushLocation(gl)
          }
        }

      statementPaths.getPaths.foreach {
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
    case LoopStatementEx(sloc, labelNames, statementIdentifier, loopStatements, checks) =>
      // #loopStart.
      val loopStart = ctx.pushLocation(ctx.createEmptyLocation(ctx.newLocLabel))

      if (!ctx.isEmpty(statementIdentifier.getDefiningName)) {
        v(statementIdentifier)
        ctx.addLoopLabel(loopStart, ctx.popResult.asInstanceOf[NameDefinition])
      } else
        ctx.addLoopLabel(loopStart)

      val endLoc = ctx.createEmptyLocation(ctx.newLocLabel, ivectorEmpty)
      ctx.pushExitLocation(endLoc)

      v(loopStatements)

      // # goto loopStart
      val gl = ctx.pushLocation(ctx.createGotoJumpLocation(loopStart.name.get, ivectorEmpty, sloc))

      ctx.pushLocation(endLoc)

      val _exit = ctx.popExitLocation
      assert(_exit == endLoc)

      ctx.popLoopLabel

      false
    case ProcedureCallStatementEx(sloc, labelNames, calledName, params, isPrefixNotation, checks) =>
      assert(ctx.isEmpty(isPrefixNotation.getIsPrefixNotation))

      v(calledName)
      val ne : NameExp = ctx.popResult

      val plist = mlistEmpty[Exp]
      for (p <- params.getAssociations) {
        v(p)
        plist += ctx.popResult
      }

      // procedures don't have a return type
      val ce = PNF.buildCallExp(ne, None, TupleExp(plist.toList))
      val cj = CallJump(ivectorEmpty, ivectorEmpty, ce, None)
      val jl = JumpLocation(Some(ctx.newLocLabel), ivectorEmpty, cj)

      ctx.pushLocation(jl)
      false
    case ReturnStatementEx(sloc, labelNames, returnExp, checks) =>
      val exp =
        if (!ctx.isEmpty(returnExp.getExpression)) {
          v(returnExp)
          Some(ctx.popResult.asInstanceOf[Exp])
        } else
          None

      val rj = ReturnJump(ivectorEmpty, exp)
      val jl = JumpLocation(Some(ctx.newLocLabel), ivectorEmpty, rj)

      ctx.pushLocation(jl)
      false
    case WhileLoopStatementEx(sloc, labelNames, statementIdentifier,
      whileCondition, loopStatements, checks) =>

      val endLoc = ctx.createEmptyLocation(ctx.newLocLabel, ivectorEmpty)
      ctx.pushExitLocation(endLoc)

      // #loopStart.
      val loopStart = ctx.pushLocation(ctx.createEmptyLocation(ctx.newLocLabel))

      if (!ctx.isEmpty(statementIdentifier.getDefiningName)) {
        v(statementIdentifier)
        ctx.addLoopLabel(loopStart, ctx.popResult.asInstanceOf[NameDefinition])
      } else
        ctx.addLoopLabel(loopStart)

      v(whileCondition)

      // # if (!loopCond) goto endLocLabel;
      val ue = PNF.buildUnaryExp(PilarAstUtil.NOT_UNOP, ctx.popResult, StandardURIs.boolURI)
      val jl = PNF.buildIfJumpLocation(ue, ctx.newLocLabel, endLoc.name.get)
      ctx.pushLocation(jl)

      v(loopStatements)

      // # goto loopStart
      val gl = ctx.pushLocation(ctx.createGotoJumpLocation(loopStart.name.get, ivectorEmpty, sloc))

      ctx.pushLocation(endLoc)
      val _exit = ctx.popExitLocation
      assert(_exit == endLoc)

      ctx.popLoopLabel

      false
  }

  def aggregateH(ctx : VContext, v : => BVisitor) : VisitorFunction = {
    case NamedArrayAggregateEx(sloc, arrayAssocs, typeUri, checks) =>
      // Table'(2 | 4 | 10 => 1, others => 0)

      var cases = ivectorEmpty[SwitchCaseExp]
      var default : Option[Exp] = None

      arrayAssocs.getAssociations.foreach {
        case ArrayComponentAssociationEx(sloc2, choices, exp, checks2) =>
          v(exp)
          val rhs : Exp = ctx.popResult

          ctx.handleChoices(v, choices).foreach {
            case o : ExternalExp =>
              default = Some(rhs)
            case x =>
              cases :+= SwitchCaseExp(x, ivectorEmpty, rhs)
          }
      }

      val indexType = if (typeUri == "null")
        ctx.typeDeclarations(StandardURIs.integerURI)
      else {
        val arrayType = SymbolUtil.getTypeDef(ctx.typeDeclarations(typeUri), ctx.typeDeclarations)
        val indexTypeUri = arrayType match {
          case i : ConstrainedArrayDef   => i.discreteSubtypes.head
          case i : UnconstrainedArrayDef => i.indexSubtypes.head
        }
        ctx.typeDeclarations(indexTypeUri)
      }

      val iterNE = PNF.buildNameExp("iter", indexType.uri, Some(indexType.uri))

      val se = SwitchExp(iterNE, cases, if (default.isDefined) default.get else null)

      val pd = PNF.buildParamDecl("iter", URIS.DUMMY_URI, PNF.buildNamedTypeSpec(indexType))
      val fe = FunExp(ivector(Matching(ivector(pd), se)))
      ctx.pushResult(fe, sloc)
      false
    case PositionalArrayAggregateEx(sloc, arrayAssocs, typeUri, checks) =>
      // Table'(5, 8, 4, 1, others => 0)

      var cases = ivectorEmpty[SwitchCaseExp]
      var default : Option[Exp] = None

      val indexType = if (typeUri != "null") {
        val arrayType = SymbolUtil.getTypeDef(ctx.typeDeclarations(typeUri), ctx.typeDeclarations)
        val indexTypeUri = arrayType match {
          case i : ConstrainedArrayDef   => i.discreteSubtypes.head
          case i : UnconstrainedArrayDef => i.indexSubtypes.head
        }
        ctx.typeDeclarations(indexTypeUri)
      } else {
        ctx.typeDeclarations(StandardURIs.integerURI)
      }

      val te = PNF.buildTypeExp(indexType.id, indexType.uri)
      val first = ctx.createUIFCall(Attribute.ATTRIBUTE_UIF_FIRST, te, indexType.uri)

      var i = 0
      arrayAssocs.getAssociations.foreach {
        case ArrayComponentAssociationEx(sloc2, choices, exp, checks2) =>
          v(exp)
          val _exp : Exp = ctx.popResult

          if (choices.getElements.isEmpty) {
            val _rhs = PNF.buildLiteralExp(LiteralType.INTEGER, BigInt(i), i + "ii", indexType.uri)
            val be = PNF.buildBinaryExp(PilarAstUtil.ADD_BINOP, first, _rhs, indexType.uri)
            cases :+= SwitchCaseExp(be, ivectorEmpty, _exp)
            i += 1
          } else {
            default = Some(_exp)
          }
      }
      val iterNE = PNF.buildNameExp("iter", indexType.uri, Some(indexType.uri))

      val se = SwitchExp(iterNE, cases, if (default.isDefined) default.get else null)

      val pd = PNF.buildParamDecl("iter", URIS.DUMMY_URI, PNF.buildNamedTypeSpec(indexType))
      val fe = FunExp(ivector(Matching(ivector(pd), se)))

      ctx.pushResult(fe, sloc)
      false
    case RecordAggregateEx(sloc, recAssocs, typ, checks) =>
      var inits = ivectorEmpty[AttributeInit]
      var i = 0
      val rtd = if (typ == "null") null
      else SymbolUtil.getTypeDef(ctx.typeDeclarations(typ), ctx.typeDeclarations).asInstanceOf[RecordTypeDef]

      val seenAttributes = mlistEmpty[ResourceUri]
      recAssocs.getAssociations.foreach {
        case RecordComponentAssociationEx(sloc2, choices, exp, checks2) =>
          v(exp)
          val rhs : Exp = ctx.popResult

          if (!choices.getExpressions.isEmpty) {
            choices.getExpressions.foreach {
              case i : OthersChoice =>
                for (a <- rtd.components) if (!seenAttributes.contains(a._2.refUri)) {
                  val nu = URIS.addResourceUri(NameUser(a._1), a._2.refUri)
                  inits :+= AttributeInit(nu, rhs)
                }
              case c =>
                v(c)
                val ne : NameExp = ctx.popResult

                if (rtd != null) {
                  assert(rtd.components.exists(p => p._2.refUri == ne.name.uri))
                  seenAttributes += ne.name.uri
                }
                inits :+= AttributeInit(ne.name, rhs)
            }
          } else if (rtd != null) {
            val attr = rtd.components.toList(i)
            seenAttributes += attr._2.refUri
            val nu = URIS.addResourceUri(NameUser(attr._1), attr._2.refUri)
            inits :+= AttributeInit(nu, rhs)
            i += 1
          } else {
            // should only get here if processing Initializes clauses like
            // Initializes => (B, C, S => F.A)
            inits :+= AttributeInit(null, rhs.asInstanceOf[NameExp])
          }
        case x => throw new RuntimeException("Unexpected: " + x)
      }
      ctx.pushResult(NewRecordExp(null, inits), sloc)
      false
  }

  def attributeH(ctx : VContext, v : => BVisitor) : VisitorFunction = {
      def h(prefix : Base, attr : String, typeUri : String = null, createTypeExp : Boolean = true) = {
        v(prefix)
        val p : NameExp = ctx.popResult

        val _typUri = ctx.convertTypeUri(
          if (typeUri != null && typeUri != "null") typeUri
          else if (URIS.hasTypeUri(p))
            URIS.getTypeUri(p)
          else {
            assert(URIS.isTypeUri(p.name.uri))
            assert(!URIS.hasTypeUri(p))

            ctx.addTypeUri(p, p.name.uri)
            p.name.uri
          })

        val arg = if (createTypeExp) PNF.buildTypeExp(p.name, _typUri) else p

        ctx.createUIFCall(attr, arg, _typUri)
      }

    {
      case FirstAttributeEx(sloc, prefix, attributeId, attributeExp, typUri, checks) =>
        assert(attributeExp.getExpressions.isEmpty)

        // according to ada-rm-3.5, the return type should be the same as prefix,
        // typUri however appears to be the base type of prefix
        ctx.pushResult(h(prefix, Attribute.ATTRIBUTE_UIF_FIRST, typUri), sloc)
        false
      case ImageAttributeEx(sloc, prefix, id, typUri, checks) =>
        ctx.pushResult(h(prefix, Attribute.ATTRIBUTE_UIF_IMAGE, typUri), sloc)
        false
      case ImplementationDefinedAttributeEx(sloc, prefix, attId, attExp, typeUri, checks) =>
        v(prefix)
        val exp : Exp = ctx.popResult

        val (_, name, _, _) = ctx.getName(attId)
        val ce = name.toLowerCase match {
          case "old"    => ctx.createUIFCall(Attribute.ATTRIBUTE_UIF_OLD, exp, typeUri)
          case "result" => ctx.createUIFCall(Attribute.ATTRIBUTE_UIF_RESULT, exp, typeUri)
          case "update" =>
            assert(attExp.getExpressions.size == 1)
            var elements = ivectorEmpty[(Exp, Exp)]
            for (de <- attExp.getExpressions) {
              v(de)
              ctx.popResult.asInstanceOf[Any] match {
                case fe : FunExp =>
                  assert(fe.matchings.size == 1)

                  val se = fe.matchings.head.exp.asInstanceOf[SwitchExp]
                  assert(se.defaultCase == null)

                  elements ++= se.cases.map(f => (f.cond, f.exp))
                case ne : NewRecordExp =>
                  elements ++= ne.attributeInits.map(f => (NameExp(f.name), f.exp))
                case x => throw new RuntimeException("Unexpected: " + x)
              }
            }
            val fe = ctx.addTypeUri(NewFunctionExp(elements), typeUri)
            val _args = TupleExp(ivector(exp, fe))
            ctx.createUIFCall(Attribute.ATTRIBUTE_UIF_UPDATE_EXP, _args, typeUri)
          case x => throw new RuntimeException("Unexpected: " + x)
        }
        ctx.pushResult(ce, sloc)
        false
      case LastAttributeEx(sloc, prefix, attributeId, attributeExp, typUri, checks) =>
        assert(attributeExp.getExpressions.isEmpty)

        // according to ada-rm-3.5, the return type should be the same as prefix,
        // typUri however appears to be the base type of prefix
        ctx.pushResult(h(prefix, Attribute.ATTRIBUTE_UIF_LAST, typUri), sloc)
        false
      case LengthAttributeEx(sloc, prefix, id, exprs, typUri, checks) =>
        assert(exprs.getExpressions.isEmpty)
        ctx.pushResult(h(prefix, Attribute.ATTRIBUTE_UIF_LENGTH, typUri), sloc)
        false
      case MaxAttributeEx(sloc, prefix, id, typUri, checks) =>
        ctx.pushResult(h(prefix, Attribute.ATTRIBUTE_UIF_MAX, typUri), sloc)
        false
      case MinAttributeEx(sloc, prefix, id, typUri, checks) =>
        ctx.pushResult(h(prefix, Attribute.ATTRIBUTE_UIF_MIN, typUri), sloc)
        false
      case PredAttributeEx(sloc, prefix, attrId, typUri, checks) =>
        ctx.pushResult(h(prefix, Attribute.ATTRIBUTE_UIF_PRED, typUri), sloc)
        false
      case RangeAttributeEx(sloc, prefix, attId, attExp, typUri, checks) =>
        assert(attExp.getExpressions.isEmpty)
        assert(typUri == "null")

        // A'Range is equivalent to the range A'First .. A'Last, except that
        // the prefix A is only evaluated once. See 3.6.2.

        val (_, _, _, typeUri) = ctx.getName(prefix)

        val lb = h(prefix, Attribute.ATTRIBUTE_UIF_FIRST, typeUri = typeUri, createTypeExp = false)
        val up = h(prefix, Attribute.ATTRIBUTE_UIF_LAST, typeUri = typeUri, createTypeExp = false)

        ctx.pushResult(TupleExp(ivector(lb, up)), sloc)
        false
      case SuccAttributeEx(sloc, prefix, attrId, typUri, checks) =>
        ctx.pushResult(h(prefix, Attribute.ATTRIBUTE_UIF_SUCC, typUri), sloc)
        false
      case UnknownAttributeEx(sloc, prefix, id, designatorExps, typUri, checks) =>
        v(prefix)
        val component : Exp = ctx.popResult

        val (_, name, _, _) = ctx.getName(id)
        val (uif, args) = name.toLowerCase match {
          case "loop_entry" =>
            val _args = if (!designatorExps.getExpressions.isEmpty) {
              assert(designatorExps.getExpressions.size == 1)
              v(designatorExps.getExpressions.get(0))
              val loopLabel : NameExp = ctx.popResult

              TupleExp(ivector(loopLabel, component))
            } else
              TupleExp(ivector(ctx.peekLoopLabel, component))

            (Attribute.ATTRIBUTE_UIF_LOOP_ENTRY, _args)
        }

        val a = ctx.createUIFCall(uif, args, typUri)
        ctx.pushResult(a, sloc)
        false
    }
  }

  def expressionH(ctx : VContext, v : => BVisitor) : VisitorFunction = {

      def handleQuantifiedExp(sloc : SourceLocation, isUniversal : Boolean, iter : Base, pred : Base,
                              typ : String, checks : String) = {

        if (ctx.inProofContext) {
          val (isRev, iterNE, iterND, markNE, markURI, lowBound, highBound) =
            ctx.handleLoopParam(v, iter)

          v(pred)
          val _pred : Exp = ctx.popResult

          val cond = TupleExp(ivector(lowBound, highBound))
          val cases = ivector(SwitchCaseExp(cond, ivectorEmpty, _pred))
          val se = SwitchExp(iterNE, cases, PNF.TRUE)

          val typUri = if (URIS.hasTypeUri(markNE)) {
            URIS.getTypeUri(markNE)
          } else {
            assert(URIS.isTypeUri(markNE.name.uri))
            markNE.name.uri
          }

          val nts = PNF.buildNamedTypeSpec(markNE.name, typUri)
          val pd = PNF.buildParamDecl(iterND, nts)
          val m = Matching(ivector(pd), se)
          val arg = ctx.addTypeUri(FunExp(ivector(m)), typ)

          val uif =
            if (isUniversal) if (isRev) Proof.PROOF_UIF_FOR_ALL_REV else Proof.PROOF_UIF_FOR_ALL
            else if (isRev) Proof.PROOF_UIF_FOR_SOME_REV else Proof.PROOF_UIF_FOR_SOME
          val ce = ctx.createUIFCall(uif, arg, typ)
          ce
        } else {
          val kind = if (isUniversal) Proof.PROOF_UIF_FOR_ALL else Proof.PROOF_UIF_FOR_SOME
          ctx.handleLoop(v, sloc, None, None,
            iter, None, Some(pred), Some(kind), checks)
        }
      }
    {
      case AndThenShortCircuitEx(sloc, lhs, rhs, theType, checks) =>
        ctx.pushResult(
          ctx.handleBE(v, sloc, PilarAstUtil.COND_AND_BINOP, lhs, rhs, theType), sloc)
        false
      case CaseExpressionEx(sloc, caseExp, expPaths, typ, checks) =>
        throw new RuntimeException()
      case DiscreteSimpleExpressionRangeEx(sloc, lb, ub, checks) =>
        v(lb)
        val _lb : Exp = ctx.popResult

        v(ub)
        val _ub : Exp = ctx.popResult

        ctx.pushResult(TupleExp(ivector(_lb, _ub)), sloc)
        false
      case ForAllQuantifiedExpressionEx(sloc, iter, pred, typ, checks) =>
        val ce = handleQuantifiedExp(sloc, true, iter.getDeclaration, pred, typ, checks)
        ctx.pushResult(ce, sloc)
        false
      case ForSomeQuantifiedExpressionEx(sloc, iter, pred, typ, checks) =>
        val ce = handleQuantifiedExp(sloc, false, iter.getDeclaration, pred, typ, checks)
        ctx.pushResult(ce, sloc)
        false
      case FunctionCallEx(sloc, prefix, functionCallParameters, isPrefixCall, isPrefixNotation, callExpType, checks) =>
        if (!ctx.isEmpty(isPrefixNotation.getIsPrefixNotation))
          if (DEBUG) Console.err.println("Need to handle prefix notation")

        val plist = mlistEmpty[Exp]
        for (a <- functionCallParameters.getAssociations) {
          // TODO: these maybe associations in which case the arg order may not 
          //       match the declared formal param order
          v(a)
          plist += ctx.popResult
        }

        if (ctx.isEmpty(isPrefixCall.getIsPrefixCall)) {
          if (ctx.isBinaryOp(prefix)) {
            assert(plist.length == 2)
            val be = ctx.handleBE(sloc, ctx.getBinaryOp(prefix).get, plist(0), plist(1), callExpType)
            ctx.pushResult(be, sloc)
          } else if (ctx.isUnaryOp(prefix)) {
            assert(plist.length == 1)
            val ue = ctx.handleUnaryExp(sloc, ctx.getUnaryOp(prefix).get, plist(0), callExpType)
            ctx.pushResult(ue, sloc)
          } else throw new RuntimeException("Unexpected infix expression")
        } else {
          v(prefix)
          ctx.popResult.asInstanceOf[Exp] match {
            case ne @ NameExp(nu) =>
              // the name of the method is an identifier and has no type
              if (!URIS.hasTypeUri(ne)) ctx.addTypeUri(ne, callExpType)

              val ce = PNF.buildCallExp(ne, Some(callExpType), TupleExp(plist.toList))

              if (ctx.noTempVars) {
                ctx.pushResult(ctx.handleExp(ce), sloc)
              } else {
                val tempVar = ctx.genTempVar(callExpType)
                val lhss = ivector(tempVar)
                val cj = CallJump(ivectorEmpty, lhss, ce, None)
                val jl = JumpLocation(Some(ctx.newLocLabel), ivectorEmpty, cj)
                ctx.pushLocation(jl)

                ctx.pushResult(ctx.handleExp(tempVar), sloc)
              }
            case ce @ CallExp(ne @ NameExp(nu), arg) =>
              assert(
                nu.name == Attribute.ATTRIBUTE_UIF_IMAGE ||
                  nu.name == Attribute.ATTRIBUTE_UIF_MAX ||
                  nu.name == Attribute.ATTRIBUTE_UIF_MIN ||
                  nu.name == Attribute.ATTRIBUTE_UIF_PRED ||
                  nu.name == Attribute.ATTRIBUTE_UIF_SUCC)

              val _ce = PNF.buildCallExp(ne, Some(callExpType), TupleExp(arg +: plist.toList))
              cp(ce, _ce)

              ctx.pushResult(ctx.handleExp(_ce), sloc)
            case x => throw new RuntimeException("Unexpected: " + x)
          }
        }
        false
      case IfExpressionEx(sloc, expPaths, typ, checks) =>
        var ifThens = ivectorEmpty[IfThenExp]
        var elseExp : Exp = null
        expPaths.getElements.foreach {
          case IfExpressionPathEx(sloc, condExp, exp, checks) =>
            v(condExp)
            val _condExp : Exp = ctx.popResult

            v(exp)
            ifThens :+= IfThenExp(_condExp, ivectorEmpty, ctx.popResult)
          case ElsifExpressionPathEx(sloc, condExp, exp, checks) =>
            v(condExp)
            val _condExp : Exp = ctx.popResult

            v(exp)
            ifThens :+= IfThenExp(_condExp, ivectorEmpty, ctx.popResult)
          case ElseExpressionPathEx(sloc, exp, checks) =>
            v(exp)
            elseExp = ctx.popResult
        }
        assert(typ != "null")

        if (elseExp == null) {
          // according to ARM 4.5.7, when there is no else clause then the value
          // of the if expression is True
          assert(typ == StandardURIs.boolURI)
          elseExp = PNF.TRUE
        }

        val ie = ctx.addTypeUri(IfExp(ifThens, elseExp), typ)
        ctx.pushResult(ie, sloc)
        false
      case IndexedComponentEx(_, ExpressionClassEx(ua @ UnknownAttributeEx(_, _,
        ExpressionClassEx(IdentifierEx(_, "Loop_Entry", _, _, _)), exps, _, _)), _, _, _) if (!exps.getExpressions.isEmpty) =>
        // special case to handle expressions like
        // A.X'Loop_Entry(InnerLoop2)(Temp)
        v(ua)
        false
      case IndexedComponentEx(sloc, prefix, indexExps, theType, checks) =>
        v(prefix)
        val pprefix = ctx.popResult.asInstanceOf[Exp]

        val indices = mlistEmpty[Exp]
        indexExps.getExpressions.foreach { e =>
          v(e)
          indices += ctx.popResult
        }

        val ie = IndexingExp(pprefix, indices.toList)
        ctx.addTypeUri(ie, theType)

        ctx.pushResult(ie, sloc)
        false
      case InMembershipTestEx(sloc, exp, choices, typ, checks) =>
        ctx.pushResult(ctx.handleMembershipTest(v, exp, choices), sloc)
        false
      case IntegerLiteralEx(sloc, litVal, typUri, checks) =>
        val v = litVal.replaceAll("_", "") // e.g. 3_500

          def num(base : String, numeral : String, exponent : String = null) = {
            val padded = numeral + "0" *
              (if (exponent != null) { // integer literal can't have negative exponent
                if (exponent.charAt(1) == '+') Integer.parseInt(exponent.drop(2))
                else Integer.parseInt(exponent.drop(1))
              } else 0)
            new java.math.BigInteger(padded, Integer.parseInt(base)).toString
          }

        val _v = if (v.contains("#")) {
          // e.g. 16#E#E1 => 16#E0# => 224
          v.split("#").toList match {
            case base :: numeral :: Nil             => num(base, numeral)
            case base :: numeral :: exponent :: Nil => num(base, numeral, exponent)
            case x                                  => throw new RuntimeException("Unexpected: " + v)
          }
        } else v

        val le = PNF.buildLiteralExp(LiteralType.INTEGER, BigInt(_v), _v + "ii", ctx.convertTypeUri(typUri))
        ctx.pushResult(le, sloc)
        false
      case NotInMembershipTestEx(sloc, exp, choices, typ, checks) =>
        val ue = PNF.buildUnaryExp(PilarAstUtil.NOT_UNOP,
          ctx.handleMembershipTest(v, exp, choices), StandardURIs.boolURI)
        ctx.pushResult(ue, sloc)
        false
      case OrElseShortCircuitEx(sloc, lhs, rhs, theType, checks) =>
        ctx.pushResult(
          ctx.handleBE(v, sloc, PilarAstUtil.COND_OR_BINOP, lhs, rhs, theType), sloc)
        false
      case QualifiedExpressionEx(sloc, mark, exp, typ, checks) =>
        val (sloc, typeName, trefUri, typeUri) = ctx.getName(mark)
        assert(typeUri == "null")
        val nu = NameUser(typeName)
        URIS.addResourceUri(nu, trefUri)
        ctx.addTypeUri(nu, trefUri)
        val nts = PNF.buildNamedTypeSpec(nu, trefUri)

        v(exp)
        ctx.popResult.asInstanceOf[Any] match {
          case fe : FunExp =>
            // from NamedArrayAggregate

            val ce = PNF.buildCallExp(TypeExp(nts), typ, fe)

            ctx.pushResult(ce, sloc)
          case nre : NewRecordExp =>
            // from RecordAggregate
            assert(nre.recordType == null)
            val re = ctx.addTypeUri(NewRecordExp(nts, nre.attributeInits), typ)
            ctx.pushResult(re, sloc)
          case x => throw new RuntimeException("Unexpected: " + x)
        }

        false
      case RealLiteralEx(sloc, litVal, typUri, checks) =>
        val v = litVal.replaceAll("_", "")

        // TODO: handle base literals 
        // 16#1b.1392#E1
        // base#whole.frac#exp
        // var _frac = 0.0
        // for(i <- frac.size - 1 to 0 by -1) 
        //   _frac = (_frac + Integer.parseInt(frac.charAt(i).toString)) / base

        val le = PNF.buildLiteralExp(LiteralType.FLOAT, v, v, ctx.convertTypeUri(typUri))
        ctx.pushResult(le, sloc)
        false
      case SelectedComponentEx(sloc, prefix, selector, typUri, checks) =>
        v(prefix)
        val e : Exp = ctx.popResult

        val (selsloc, selname, seluri, styp) = ctx.getName(selector)
        val attr = NameUser(selname)
        URIS.addResourceUri(attr, seluri)
        if (styp != "null") ctx.addTypeUri(attr, styp)

        if (seluri.startsWith("ada://component")) {
          val ae = ctx.addTypeUri(AccessExp(e, attr), typUri)
          ctx.pushResult(ae, sloc)
        } else {
          e match {
            case NameExp(nu) =>
              assert(URIS.isPackageUri(seluri) || URIS.isMethodUri(seluri) || URIS.isTypeUri(seluri)
                || (URIS.isPackageUri(nu.uri) && URIS.isGlobalVarUri(seluri)))
              val _typeUri = if (typUri != "null") Some(typUri) else None
              val ret = PNF.buildNameExp(nu.name + "::" + selname, seluri, _typeUri)
              ctx.pushResult(ret, sloc)
            case x => throw new RuntimeException("Unexpected: " + x)
          }
        }
        false
      case SimpleExpressionRangeEx(sloc, lb, ub, checks) =>
        v(lb)
        val _lb : Exp = ctx.popResult

        v(ub)
        val _ub : Exp = ctx.popResult

        ctx.pushResult(TupleExp(ivector(_lb, _ub)), sloc)
        false
      case StringLiteralEx(sloc, litVal, typUri, checks) =>
        assert(litVal.startsWith("\"") && litVal.endsWith("\""))
        val s = litVal.drop(1).dropRight(1)
        val le = PNF.buildLiteralExp(LiteralType.STRING, s, s, ctx.convertTypeUri(typUri))
        ctx.pushResult(le, sloc)
        false
      case TypeConversionEx(sloc, mark, exp, typ, checks) =>
        val (sloc2, refName, refUri, typUri) = ctx.getName(mark)

        val nts = ctx.addSourceLoc(PNF.buildNamedTypeSpec(refName, refUri), sloc2)

        v(exp)
        val _exp : Exp = ctx.popResult

        ctx.pushResult(ctx.addTypeUri(CastExp(nts, _exp), refUri), sloc)
        false
    }
  }

  def contractsH(ctx : VContext, v : => BVisitor) : VisitorFunction = {
    case AssertPragmaEx(sloc, pragmaArgumentAssociations, pragmaName, checks) =>
      ctx.noTempVars(true)
      ctx.inProofContext = true
      for (a <- pragmaArgumentAssociations.getAssociations) {
        v(a)
        val uif = ctx.createUIFCall(Proof.PROOF_UIF_ASSERT, ctx.popResult, StandardURIs.boolURI)
        val m = s"Assertion failed at ${ctx.toString(sloc)}"
        val aa = PNF.buildAssertAction(uif, m)
        ctx.createPushLocation(aa, ivectorEmpty, sloc)
      }
      ctx.inProofContext = false
      ctx.noTempVars(false)
      false
    case ImplementationDefinedPragmaEx(sloc, pragmaArgAssociations, pragmaName, checks) =>
      ctx.noTempVars(true)
      ctx.inProofContext = true
      pragmaName.toLowerCase match {
        case "assume" =>
          assert(pragmaArgAssociations.getAssociations.size == 1)

          v(pragmaArgAssociations.getAssociations.head)
          val uif = ctx.createUIFCall(Proof.PROOF_UIF_ASSUME, ctx.popResult, StandardURIs.boolURI)
          val aa = AssumeAction(ivectorEmpty, uif, None)
          ctx.createPushLocation(aa, ivectorEmpty, sloc)
        case "assert_and_cut" =>
          assert(pragmaArgAssociations.getAssociations.size == 1)

          v(pragmaArgAssociations.getAssociations.head)
          val uif = ctx.createUIFCall(Proof.PROOF_UIF_ASSERT_AND_CUT, ctx.popResult, StandardURIs.boolURI)
          val m = s"Assertion failed at ${ctx.toString(sloc)}"
          val aa = PNF.buildAssertAction(uif, m)
          ctx.createPushLocation(aa, ivectorEmpty, sloc)
        case "loop_invariant" =>
          assert(pragmaArgAssociations.getAssociations.size == 1)

          v(pragmaArgAssociations.getAssociations.head)
          val uif = ctx.createUIFCall(Proof.PROOF_UIF_LOOP_INVARIANT, ctx.popResult, StandardURIs.boolURI)
          val m = s"Loop Invariant failed at ${ctx.toString(sloc)}"
          val aa = PNF.buildAssertAction(uif, m)
          ctx.createPushLocation(aa, ivectorEmpty, sloc)
        case "loop_variant" =>
          var matchings = ivectorEmpty[Matching]
          pragmaArgAssociations.getAssociations.foreach {
            case PragmaArgumentAssociationEx(sloc2, formal, actual, checks2) =>
              v(formal)
              val ne : NameExp = ctx.popResult
              val name = ne.name.name.toLowerCase

              v(actual)
              val e : Exp = ctx.popResult

              val ts = PNF.buildNamedTypeSpec(ctx.typeDeclarations(StandardURIs.boolURI))
              val pd = PNF.buildParamDecl(name, URIS.DUMMY_URI, ts)
              matchings :+= Matching(ivector(pd), e)
            case x => throw new RuntimeException()
          }
          val ne = ctx.peekLoopLabel
          val te = TupleExp(ivector(ne, FunExp(matchings)))
          val uif = ctx.createUIFCall(Proof.PROOF_UIF_LOOP_VARIANT, te, StandardURIs.boolURI)
          val m = s"Loop Variant failed at ${ctx.toString(sloc)}"
          val aa = PNF.buildAssertAction(uif, m)
          ctx.createPushLocation(aa, ivectorEmpty, sloc)
      }
      ctx.inProofContext = false
      ctx.noTempVars(false)
      false
  }

  def everythingElseH(ctx : VContext, v : => BVisitor) : VisitorFunction = {
    case o if (o != null) =>
      ctx.unhandledSet += o.getClass.getSimpleName
      true
    case null =>
      throw new RuntimeException("Element is null")
  }

  def theVisitor : BVisitor = b
  val theContext = new VContext {
    stackLocationList.push(mlistEmpty[LocationDecl])
  }

  theContext.regression = regression

  val b = Visitor.build(
    Visitor.first(
      ivector(
        packageH(theContext, theVisitor),
        methodH(theContext, theVisitor),
        statementH(theContext, theVisitor),
        expressionH(theContext, theVisitor),
        contractsH(theContext, theVisitor),
        nameH(theContext, theVisitor),
        aggregateH(theContext, theVisitor),
        attributeH(theContext, theVisitor),
        everythingElseH(theContext, theVisitor))))

  // TODO: introduce standard package types
  val standardPackageTypes = List(
    StandardTypeDefs.StandardBoolean,
    StandardTypeDefs.StandardInteger,
    StandardTypeDefs.StandardNatural,
    StandardTypeDefs.StandardPositive,
    StandardTypeDefs.StandardFloat,

    // FIXME: inject the non-standard universal_integer
    StandardTypeDefs.UniversalInteger,
    StandardTypeDefs.UniversalReal,

    StandardTypeDefs.StandardCharacter,
    StandardTypeDefs.StandardString)

  for (s <- standardPackageTypes) {
    val td = URIS.getTypeDef(s)
    theContext.typeDeclarations += (td.uri -> td)
  }

  // pick up public type declarations
  parseGnat2XMLresults.foreach {
    case (fileUri, value) => {
      theContext.fileUri = fileUri
      value.getUnitDeclarationQ.getDeclaration match {
        case o : PackageDeclaration =>
          assert(o.getNamesQl.getDefiningNames.size == 1)
          val pname = o.getNamesQl.getDefiningNames.head.asInstanceOf[DefiningIdentifier]

          theContext.pushContext(Context(CTX.PACKAGE, pname.getDefName, pname.getDef))

          val scope = theContext.constructScope(b, o)

          theContext.popContext
        case _ =>
      }
    }
  }

  parseGnat2XMLresults.foreach {
    case (fileUri, value) => {
      theContext.fileUri = fileUri
      b(value)
    }
  }

  val nd = URIS.addResourceUri(NameDefinition("Standard"), PackageURIs.standardPackageURI)
  val standardPackage = PNF.buildPackageDecl(nd, standardPackageTypes)
  theContext.models += PNF.buildModel("fake/standard.ads", ivector(standardPackage))

  if (DEBUG) println("Not handling: " + theContext.unhandledSet.toList.sorted)

  models = theContext.models.toList
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

    val e = new Exec
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}
