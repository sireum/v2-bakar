package org.sireum.bakar.policy

import org.sireum.pipeline._
import org.sireum.bakar.xml._
import org.sireum.util._
import scala.collection.JavaConversions.asScalaBuffer
import org.sireum.bakar.xml.SourceLocation
import org.sireum.bakar.policy.parser.T_Policy
import org.sireum.bakar.policy.parser.PolicyReader

class BakarProgramTranslatorModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarProgramTranslatorModule {

  // add implementation here
  // Here we implement the translation from SPARK XML AST tree to Coq value
  // - Bakar2CoqTranslatorConfig generate Bakar2CoqTranslatorModuleCore
  // - Bakar2CoqTranslatorModuleCore is a general framework that's common for all the translation project
  // - Bakar2CoqTranslatorImp implements our specific translation from SPARK XML AST tree to Coq, and it's called in Bakar2CoqTranslatorModuleCore
  type BVisitor = Any => Boolean
  
  /*
  final case class TypeConstraint(lhs_type: String, rhs_type: IList[String]) {
    // e.g. rhs_type <= lhs_type, where rhs_type maybe the union of a list of types, such as t' v t''
    
  }
  
  final case class TypeConstraint_of_Subprogram(
      f_name: String, 
      f_param_type: MMap[String, String], 
      f_param_mode: MMap[String, String], 
      f_param_constraints: MList[TypeConstraint]) {
    // subprogram name
    
    // type mapping of parameters
    
    // in/out mode of parameters
    
    // type constraints between types of parameters
    
  }
  
  trait Context {
    // Tf: mapping from function name to its parameter types and type constraints between them
    // Tg: mapping from global variables to types
    // Tl: mapping from local variables to types
    // Tp: type of the program counter
    // fresh_n: fresh variables
    // Cs:   type constraint set
    val Domains = mlistEmpty[String]
    val Domain_Ordering = mmapEmpty[String, String] // key <= value
    val Declassifiers = mmapEmpty[String, TypeConstraint_of_Subprogram]
    
    val Tf = mmapEmpty[String, TypeConstraint_of_Subprogram]
    val Tg = mmapEmpty[String, String]
    val Tl = mmapEmpty[String, String]
    var Tp = scala.collection.immutable.List.empty[String]
    var fresh_n = 0
    var Cs = mlistEmpty[TypeConstraint]
    var Vm = mlistEmpty[String] // variables that maybe modified
    var lhs_or_rhs = false
        
    Tp = Tp :+ "BOTTOM"
    
    // help functions
    def gen_fresh_type(): String = {
      fresh_n += 1
      return ("t" + fresh_n)
    }
    
    def fetch_type(x: String): Option[String] = {
      if(Tg.get(x) != None)
        return Tg.get(x)
      
      if(lhs_or_rhs) 
        // if it's a lhs variable
        Tl += (x -> gen_fresh_type)
      
      if(Tl.get(x).isEmpty)
        Tl += (x -> gen_fresh_type)
      
      return Tl.get(x)
    }
    
    def add_program_constraint(f_name: String, c: TypeConstraint_of_Subprogram) {
      Tf += (f_name -> c)
    }
    
    def add_typeConstraint(lhs_type: String, rhs_type: IList[String]) = {
      Cs += new TypeConstraint(lhs_type, rhs_type)
    }
    
    def get_typeConstraint() = {
      val tc = Cs
      Cs = mlistEmpty[TypeConstraint]
      tc
    }
    
    def add_modVar(x: String) = {
      Vm += x
    }
    
    def get_modVars() = {
      val t = Vm
      Vm = mlistEmpty[String]
      t
    }    
    
    def add_global_mapping(new_gm: MMap[String, String]) {
      Tg ++= new_gm
    }
    
    def reset_global_mapping(gm: MMap[String, String]) {
      Tg.clear()
      Tg ++= gm
    }
    
    def add_context_type(new_ct: MList[String]) {
      Tp ++= new_ct
    }
    
    def reset_context_type(ct: IList[String]) {
      Tp = ct
    }
    
    def is_lhs_or_rhs(b: Boolean) {
      lhs_or_rhs = b
    }
    
    def accept_policy(policy: T_Policy) {
      for(d <- policy.get_domains.get_domains)
        Domains += d
      import scala.collection.JavaConversions._
      policy.get_domains.get_domain_ordering.foreach(kv => Domain_Ordering += (kv._1 -> kv._2))
      policy.get_domain_bindings.foreach(kv => Tg += (kv._1 -> kv._2))
      policy.get_declassifiers.foreach(
          kv => {
            val f_name = kv._1
            val f_param_type = mmapEmpty[String, String]
            val f_param_mode = mmapEmpty[String, String]
            val f_param_constraints = mlistEmpty[TypeConstraint]
            kv._2.get_param_types.foreach(pt => f_param_type += (pt._1 -> pt._2))
            kv._2.get_param_mode.foreach(pm => f_param_mode += (pm._1 -> pm._2))
            val declassifier_constraint = new TypeConstraint_of_Subprogram(f_name, f_param_type, f_param_mode, f_param_constraints)
            Declassifiers += (f_name -> declassifier_constraint)
          }
      )
    }    
    
    // results: hold the union of types for an expression
    var type_disj = mlistEmpty[String]
    
    def add_type(t : String) {
      type_disj += t
    }
    
    def get_type = {
      val t = type_disj
      type_disj = mlistEmpty[String]
      t
    }
    
    // ==============================
    // ==============================    
    
    var result : Any = null

    def pushResult(o : Any) {
      result = o;
    }

    def popResult = {
      val t = result
      result = null
      t
    }

    def isEmpty(o : Base) : Boolean = o.isInstanceOf[NotAnElement]

    def isUnaryOp(o : Any) = getUnaryOp(o).isDefined

    def getUnaryOp(o : Any) : scala.Option[String] = {
      if (!o.isInstanceOf[ExpressionClass]) {
        return None
      }
      val x = o.asInstanceOf[ExpressionClass].getExpression().asInstanceOf[Any]
      x match {
        case UnaryMinusOperatorEx(_) => Some("Unary_Minus")
        case UnaryPlusOperatorEx(_)  => Some("Unary_Plus")
        case NotOperatorEx(_)        => Some("Not")
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
        case ModOperatorEx(_)                => Some("Divide") // temporary solution
        case _                               => None
      }
    }
  }
  */

  def packageDeclarationH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ CompilationUnitEx(sloc, contextClauseElements, unitDeclaration, pragmasAfter,
        unitKind, unitClass, unitOrigin, unitFullName, defName, sourceFile, checks) =>
//    if (!contextClauseElements.getContextClauses().isEmpty)
//      Console.err.println("Need to handle context clauses")
      
      // Compilation unit can be either (1) Package Body/Declaration or (2) Procedure/Function Body
      v(unitDeclaration)
      
      false
    case o @ PackageDeclarationEx(sloc, names, aspectSpec,
      visiblePartDecItems, privatePartDecItems, checks) =>
      val visibleDecItems = visiblePartDecItems.getDeclarativeItems()      
      val privateDecItems = privatePartDecItems.getDeclarativeItems()
      // declarativePartH(ctx, v, visibleDecItems.toList ++ privateDecItems.toList)

      false
    case o @ PackageBodyDeclarationEx(sloc, names, aspectSpec,
      bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>
//    assert(bodyExceptionHandlers.getExceptionHandlers().isEmpty())
//    assert(names.getDefiningNames().length == 1)
      
      // val pkgname = names.getDefiningNames.get(0)
      // v(pkgname)
      // val pkgBodyName = ctx.popResult
      
      declarativePartH(ctx, v, bodyDecItems.getElements.toList)
      
      false
  }
  
  def declarativePartH(ctx : Context, v : => BVisitor, decItems: List[org.sireum.bakar.xml.Base]) = {
    // declared items, e.g. variables, array/record types, or procedures
    val it = decItems.iterator
    // in ".ads" file, we just ignore procedure/function declarations;
    while (it.hasNext){
      val declItem = it.next()
      // for object declarations, multiple objects of the same type can be declared in in line,
      // e.g. X, Y, Z: Integer;
      v(declItem)
    }
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
                           isNotOverridingDec : Base) {

//      assert(exceptionHandlerList.getExceptionHandlers().isEmpty())
//      assert(ctx.isEmpty(isOverridingDec))
//      assert(ctx.isEmpty(isNotOverridingDec))
        
        // [1] subprogram name
        v(names.getDefiningNames().get(0))
        val f_name = ctx.popResult.asInstanceOf[String]
        
        // [3] subprogram parameters
        val f_param_type = mmapEmpty[String, String]
        val f_param_mode = mmapEmpty[String, String] 
        
        for (p <- paramProfile.getParameterSpecifications()) {
          v(p)
          val param_mode_types = ctx.popResult.asInstanceOf[MList[(String, String, String)]]
          param_mode_types.foreach(
              triple => {
                val param_name = triple._1
                val param_mode = triple._2
                val param_type = triple._3
                f_param_type += (param_name -> param_type)
                f_param_mode += (param_name -> param_mode)
              })
        }
        
        val Tg_old = mmapEmpty[String, String]
        Tg_old ++= ctx.Tg
        ctx.add_global_mapping(f_param_type)
        
        // [4] declared local objects, e.g. variables, array/record types, or nested procedures
        declarativePartH(ctx, v, bodyDeclItems.getElements.toList)
        
        // [5] subprogram body
        v(bodyStatements)
        val f_param_constraints = ctx.get_typeConstraint()
        
        // [6] subprogram aspect specification, for example, Pre and Post 
        
        // 
        val program_constraint = TypeConstraint_of_Subprogram(f_name, f_param_type, f_param_mode, f_param_constraints) 
        ctx.add_program_constraint(f_name, program_constraint)
        
        ctx.reset_global_mapping(Tg_old)
        ctx.Tl.clear()
        
        // 
        println("\n=== before simplification ===\n")
        Util.prettyPrint(f_param_constraints)
        val atomicTypeConstraints = TypeConstraintSimplification.normalize(f_param_constraints)
        val typeConstraintsClosure = TypeConstraintSimplification.transitive_closure(atomicTypeConstraints)
        val simplifiedTypeConstraints = TypeConstraintSimplification.simplify(typeConstraintsClosure)
        println("\n=== after simplification === \n")        
        Util.prettyPrint_atomicTypeConstraints(simplifiedTypeConstraints)
        println("finish one procedure !")
      }

    {
      case o @ ProcedureDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          names, paramProfile, hasAbstract, aspectSpec, checks) =>
        val pn = names.getDefiningNames.get(0)
        // v(pn)

        false
        
      case o @ FunctionDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          names, paramProfile, isNotNullReturn, resultProfile, hasAbstract, aspectSpec, checks) =>
        val fn = names.getDefiningNames.get(0)
        // v(fn)
        
        false

      case o @ ProcedureBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          names, paramProfile, aspectSpec, bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>
        handleSubprogramBody(sloc, names, paramProfile, bodyDecItems,
          bodyStatements, None, aspectSpec, bodyExceptionHandlers,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())

        false
      case o @ FunctionBodyDeclarationEx(sloc, isOverridingDec, isNotOverridingDec,
          names, paramProfile, isNotNullReturn, resultProfile, aspectSpec,
          bodyDecItems, bodyStatements, bodyExceptionHandlers, checks) =>
        handleSubprogramBody(sloc, names, paramProfile, bodyDecItems,
          bodyStatements, Some(resultProfile), aspectSpec, bodyExceptionHandlers,
          isOverridingDec.getIsOverriding(), isNotOverridingDec.getIsNotOverriding())

        false
      case o @ ExpressionFunctionDeclarationEx(sloc, namesQl, paramProfileQl, resultProfileQ, resultExprQ, aspectSpecQl, checks) =>
        val efn = namesQl.getDefiningNames.get(0)
        // v(efn)
        
        false
    }
  }
  
  // variable declaration, type declaration, procedure declaration and package declaration,
  // the last two declarations are translated separately;
  def otherDeclarationH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ ConstantDeclarationEx(sloc, namesQl, hasAliasedQ, objDeclViewQ, initExpQ, aspectSpecQl, checks) =>
      if (!ctx.isEmpty(initExpQ.getExpression())) {
        // in XML AST, binary/unary expression is represented as a function call;
        v(initExpQ.getExpression())
        val initExpType = ctx.get_type // type of initialization expression 
        val it = namesQl.getDefiningNames().iterator()
        while(it.hasNext){
          // define constant variable
          val x = it.next()
          v(x)
          val xName = ctx.popResult.asInstanceOf[String]
          val xType = ctx.fetch_type(xName).getOrElse("UndefinedType")
          ctx.add_typeConstraint(xType, initExpType.toList)   
          ctx.add_typeConstraint(xType, ctx.Tp) 
        }        
      }
      
      false
    case o @ VariableDeclarationEx(sloc, namesQl, hasAliasedQ, objDeclViewQ, initExpQ, aspectSpecQl, checks) =>
      if (!ctx.isEmpty(initExpQ.getExpression())) {
        v(initExpQ.getExpression())
        val initExpType = ctx.get_type // type of initialization expression
        val it = namesQl.getDefiningNames().iterator()
        while(it.hasNext){
          val x = it.next()
          v(x)
          val xName = ctx.popResult.asInstanceOf[String]
          val xType = ctx.fetch_type(xName).getOrElse("UndefinedType")
          ctx.add_typeConstraint(xType, initExpType.toList)
          ctx.add_typeConstraint(xType, ctx.Tp) 
        }        
      }
      
      false
    case o @ OrdinaryTypeDeclarationEx(sloc, namesQl, discriminantPartQ, typeDeclarationViewQ, aspectSpecificationsQl, checks) => 
      // v(namesQl.getDefiningNames().get(0)) // typeName
      val typeRef = namesQl.getDefiningNames().get(0).asInstanceOf[DefiningIdentifier].getDef()
      val typeDef = typeDeclarationViewQ.getDefinition()
      // v(typeDef)
      
      // e.g. type T is range 0 .. 10;
      // type name: T is represented by a natural number: (1 (*T*))
      // type reference: ada://ordinary_type/Binary_Search+1:11/T+3:9
      // type reference name: Integer_Type (1 (*T*))
      
      false
    case o @ SubtypeDeclarationEx(sloc, namesQl, typeDeclarationViewQ, aspectSpecificationsQl, checks) =>
      v(namesQl.getDefiningNames().get(0))
      val typeRef = namesQl.getDefiningNames().get(0).asInstanceOf[DefiningIdentifier].getDef()
      val typeDef = typeDeclarationViewQ.getDefinition()
      // v(typeDef)
      
      false
    case o @ PrivateTypeDeclarationEx(sloc, namesQl, discriminantPartQ, typeDeclarationViewQ, aspectSpecificationsQl, checks) =>
      // e.g. type Stack_Type is private;
      val ptn = namesQl.getDefiningNames.get(0)
      // v(ptn)
      
      false
    case o @ UsePackageClauseEx(sloc, clauseNamesQl, checks) =>
      
      false
  }
  
  // array definition and record definition, which are used to declare array / record type
  def definitionH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ SignedIntegerTypeDefinitionEx(sloc, integerConstraintQ, checks) =>
      // e.g. type T is range 0 .. 10;
      
      false
    case o @ DerivedTypeDefinitionEx(sloc, hasAbstractQ, hasLimitedQ, parentSubtypeIndicationQ, checks) =>
      // e.g. type T1 is new Integer range 1 .. 10;

      false
    case o @ RecordTypeDefinitionEx(sloc, hasAbstractQ, hasLimitedQ, recordDefinitionQ, checks) =>
      
      false
    case o @ ConstrainedArrayDefinitionEx(sloc, discreteSubtypeDefinitionsQl, arrayComponentDefinitionQ, checks) =>
      
      false
    case SubtypeIndicationEx(sloc, hasAliasedQ, hasNullExclusionQ, subtypeMarkQ, subtypeConstraintQ, checks) =>
      
      false
  }
  
  
  // translate the parameters of the procedures
  def parameterSpecificationH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ ParameterSpecificationEx(sloc, namesQl, hasAliasedQ, hasNullExclusionQ, objectDeclarationViewQ, initializationExpressionQ, mode, checks) =>
      assert(ctx.isEmpty(hasAliasedQ.getHasAliased()))
      assert(ctx.isEmpty(hasNullExclusionQ.getHasNullExclusion()))
      assert(ctx.isEmpty(initializationExpressionQ.getExpression()))
      
      val param_mode_types = mlistEmpty[(String, String, String)]

      // (1) parameter type
      // v(objectDeclarationViewQ.getDefinition())
      
      // (2) parameter mode
      val paramMode =       
        if(mode == "AN_IN_MODE")
          "in"
        else if(mode == "AN_OUT_MODE")
          "out"
        else
          "inout"
      
      // (3) parameter name
      // example of multiple parameters of the same type: Swap (A : in out Arr; I J : Index)
      val it = namesQl.getDefiningNames().iterator()
      while(it.hasNext){
        v(it.next)
        val paramName = ctx.popResult.asInstanceOf[String]
        val paramType = ctx.gen_fresh_type() // fresh type for the parameter
        val triple = (paramName, paramMode, paramType)
        param_mode_types += triple
      }
      
      ctx.pushResult(param_mode_types)
      
      false
  }

  /**
   * Procedure name
   * procedure parameters
   * ProcedureBodyDeclaration /- body_declarative_items_ql: List[VariableDeclaration]
   */
  def definingIdentifierH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ DefiningIdentifierEx(sloc, defName, theDef, theType, checks) =>
      // theDef: the unique identifier name
      ctx.pushResult(defName)
      false
  }

  def statementH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ StatementListEx(statements) =>
      for(statement <- statements)
        v(statement)
      false
    case o @ NullStatementEx(sloc, labelNamesQl, checks) =>
      false
    case o @ AssignmentStatementEx(sloc, labelName, assignmentVariableName, assignmentExpression, checks) =>
      // get the type of the right hand side expression
      ctx.is_lhs_or_rhs(false)
      v(assignmentExpression.getExpression())
      val rhs_type = ctx.get_type      
      // get the type of left hand side variable
      ctx.is_lhs_or_rhs(true)
      v(assignmentVariableName.getExpression())
      val lhs_type = ctx.get_type.head
      ctx.is_lhs_or_rhs(false)
      ctx.add_typeConstraint(lhs_type, rhs_type.toList)
      ctx.add_typeConstraint(lhs_type, ctx.Tp)
      false
    case o @ IfStatementEx(sloc, labelNames, statementPaths, checks) =>
      def HandleIfStmt(statementPaths: List[org.sireum.bakar.xml.Base]) {
        if(statementPaths.isEmpty)
          return
        
        statementPaths.head match {
          case IfPathEx(sloc, condExp, statements, checks) =>
            v(condExp.getExpression())
            val b_type = ctx.get_type // type of conditional expression
            val old_context_type = ctx.Tp
            ctx.add_context_type(b_type)
            // true branch
            v(statements)
            // false branch
            HandleIfStmt(statementPaths.tail)
            ctx.reset_context_type(old_context_type)
          case ElsifPathEx(sloc, condExp, statements, checks) =>
            v(condExp.getExpression())
            val b_type = ctx.get_type // type of conditional expression
            val old_context_type = ctx.Tp
            ctx.add_context_type(b_type)
            // true branch
            v(statements)
            // false branch
            HandleIfStmt(statementPaths.tail)
            ctx.reset_context_type(old_context_type)
          case ElsePathEx(sloc, statements, checks) =>
            v(statements)
        }
      }
      
      HandleIfStmt(statementPaths.getPaths().toList)
      false
    case o @ WhileLoopStatementEx(sloc, labelNames, statementIdentifier, whileCondition, loopStatements, checks) =>
      v(whileCondition.getExpression())
      v(loopStatements)
      false
    case o @ ProcedureCallStatementEx(sloc, labelName, calledName, callStatementParameters, isPrefixNotation, checks) =>
      val args = mlistEmpty[Any]
      v(calledName.getExpression())
      
      // 
      // for a procedure call, if we cannot find its declaration body in package body, 
      // e.g. library procedure or procedure declaration with no procedure body;
      for (arg <- callStatementParameters.getAssociations()) {
        val e = arg.asInstanceOf[ParameterAssociation].getActualParameterQ().getExpression()
        v(e)
      }      
      false
    case o @ ReturnStatementEx(sloc, labelNamesQl, returnExpressionQ, checks) =>
      // TODO: now just ignore it as our formalized SPARK subset does not support it now, 
      //       in fact there should be checks for return expressions;
      ctx.pushResult(s"(* Ignore Return Statement ! *)")
      false
    case o @ ImplementationDefinedPragmaEx(sloc, pragmaArgumentAssociationsQl, pragmaName, checks) =>
      // TOOD: just ignore ImplementationDefinedPragma, e.g. pragma Loop_Variant (Decreases => J - I);
      // in order to accept more SPARK tests and reduce manual modifications to those SPARK test cases,
      // as pragma is quite common in practical SPARK programs,
      ctx.pushResult(s"(* Ignore Pragma ! *)")
      false
  }
  
  def expressionH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ IntegerLiteralEx(sloc, litVal, theType, checks) =>
      ctx.add_type("BOTTOM")
      false
    case o @ EnumerationLiteralEx(sloc, refName, ref, theType, checks) =>
      ctx.add_type("BOTTOM")
      false
    case o @ IdentifierEx(sloc, refName, ref, theType, checks) =>
      // Identifier object is used to reference to either
      // - constant, variable, parameter, record field, or 
      // - type name, or subtype / derived type name
      // - package/procedure name
      if(ref.contains("variable")) {
        val t = ctx.fetch_type(refName).getOrElse("Undefined_Type")
        ctx.add_type(t)
      } else if (ref.contains("parameter")) {
        val t = ctx.fetch_type(refName).getOrElse("Undefined_Type")
        ctx.add_type(t)
      } else if(ref.contains("procedure")) {
        // it's used as a procedure call
        ctx.pushResult(refName)
      } else {
        // TODO: to deal with other kind of identifier
        // - ref.contains("package_body")
        // - ...
        val result = "Other_Variables"
        ctx.pushResult(result)
      }
      false
    case o @ FunctionCallEx(sloc, prefixQ, functionCallParameters, isPrefixCall, isPrefixNotation, theType, checks) =>
      // import scala.collection.JavaConversions.asScalaBuffer
      // to do implicit conversion between Java collection and scala collection
      // scala.collection.mutable.Buffer <=> java.util.List
      if (ctx.isBinaryOp(prefixQ)) {
        assert(functionCallParameters.getAssociations().length == 2)
        val e1 = functionCallParameters.getAssociations()(0).asInstanceOf[ParameterAssociation].getActualParameterQ().getExpression()
        val e2 = functionCallParameters.getAssociations()(1).asInstanceOf[ParameterAssociation].getActualParameterQ().getExpression()
        v(e1)
        v(e2)
      } else if (ctx.isUnaryOp(prefixQ)) {
        assert(functionCallParameters.getAssociations().length == 1)
        val e = functionCallParameters.getAssociations()(0).asInstanceOf[ParameterAssociation].getActualParameterQ().getExpression()
        v(e)
      } else {
        println("expressionH: need to handle other Function Call Expression !")
      }
      false
    case o @ OrElseShortCircuitEx(sloc, leftExpressionQ, rightExpressionQ, theType, checks) =>
      // TODO: now represent it as "Or" expression
      v(leftExpressionQ.getExpression())
      v(rightExpressionQ.getExpression())
      false
    case o @ AndThenShortCircuitEx(sloc, leftExpressionQ, rightExpressionQ, theType, checks) =>
      // TODO: now represent it as "And" expression
      v(leftExpressionQ.getExpression())
      v(rightExpressionQ.getExpression())
      false
//  case o =>
//    println("expressionH: need to handle: " + o.getClass.getSimpleName)
//    true
  }

  def associationListH(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ AssociationListEx(associations) =>
      for (association <- associations) {
        v(association)
      }
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
  
  def statementC(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ StatementListEx(statements) =>
      for(statement <- statements)
        v(statement)
      false
    case o @ NullStatementEx(sloc, labelNamesQl, checks) =>
      false
    case o @ AssignmentStatementEx(sloc, labelName, assignmentVariableName, assignmentExpression, checks) =>
      // get the type of the right hand side expression
      v(assignmentExpression.getExpression())
      false
    case o @ IfStatementEx(sloc, labelNames, statementPaths, checks) =>
      def HandleIfStmt(statementPaths: List[org.sireum.bakar.xml.Base]) {
        if(statementPaths.isEmpty)
          return
        
        statementPaths.head match {
          case IfPathEx(sloc, condExp, statements, checks) =>
            // true branch
            v(statements)
            // false branch
            HandleIfStmt(statementPaths.tail)
          case ElsifPathEx(sloc, condExp, statements, checks) =>
            // true branch
            v(statements)
            // false branch
            HandleIfStmt(statementPaths.tail)
          case ElsePathEx(sloc, statements, checks) =>
            v(statements)
        }
      }
      
      HandleIfStmt(statementPaths.getPaths().toList)
      false
    case o @ WhileLoopStatementEx(sloc, labelNames, statementIdentifier, whileCondition, loopStatements, checks) =>
      v(loopStatements)
      false
    case o @ ProcedureCallStatementEx(sloc, labelName, calledName, callStatementParameters, isPrefixNotation, checks) =>
      val args = mlistEmpty[Any]
      v(calledName.getExpression())
      
      // 
      // for a procedure call, if we cannot find its declaration body in package body, 
      // e.g. library procedure or procedure declaration with no procedure body;
      for (arg <- callStatementParameters.getAssociations()) {
        val e = arg.asInstanceOf[ParameterAssociation].getActualParameterQ().getExpression()
        v(e)
      }      
      false
    case o @ ReturnStatementEx(sloc, labelNamesQl, returnExpressionQ, checks) =>
      false
    case o @ ImplementationDefinedPragmaEx(sloc, pragmaArgumentAssociationsQl, pragmaName, checks) =>
      false
  }
  
  def expressionC(ctx : Context, v : => BVisitor) : VisitorFunction = {
    case o @ IntegerLiteralEx(sloc, litVal, theType, checks) =>
      false
    case o @ EnumerationLiteralEx(sloc, refName, ref, theType, checks) =>
      false
    case o @ IdentifierEx(sloc, refName, ref, theType, checks) =>
      // Identifier object is used to reference to either
      // - constant, variable, parameter, record field, or 
      // - type name, or subtype / derived type name
      // - package/procedure name
      if(ref.contains("variable")) {
        if(ctx.Tg.get(refName).isEmpty)
          ctx.add_modVar(refName)
      } else if (ref.contains("parameter")) {
       
      } else if(ref.contains("procedure")) {
        // it's used as a procedure call
        
      } else {
        
      }
      false
    case o @ FunctionCallEx(sloc, prefixQ, functionCallParameters, isPrefixCall, isPrefixNotation, theType, checks) =>
      false
    case o @ OrElseShortCircuitEx(sloc, leftExpressionQ, rightExpressionQ, theType, checks) =>
      false
    case o @ AndThenShortCircuitEx(sloc, leftExpressionQ, rightExpressionQ, theType, checks) =>
      false
//  case o =>
//    println("expressionH: need to handle: " + o.getClass.getSimpleName)
//    true
  }  
  
  // =================================================
  //  Generate Type Constraints
  // =================================================  
  
  val policy_file = ""
  val policy = PolicyReader.ParsePolicy(policy_file)
  
  def theVisitor : BVisitor = visit
  val ctx = new Context {}
  ctx.accept_policy(policy)
  
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

  // =================================================
  //  Collect Maybe-Modified Local Variables
  // =================================================
  def theCollector : BVisitor = collect
  
  val collect = Visitor.build(
    Visitor.first(
      ivector(
        statementC(ctx, theCollector),
        expressionC(ctx, theCollector),
        everythingElseH(ctx, theCollector)
      )))       
  
  // for multiple source files, do translation one by one  
  
  // now only allow one .ads file and one .adb file, otherwise there will be
  // name conflicts, as the spark subset we have formalized in Coq is still
  // quite small, and in order to be accepted by Coq type check, we put together
  // declared items in .ads and .adb together connected with constructor: D_Seq_Declaration;
  // and .ads file should be analyzed first, otherwise the identifiers used 
  // in .adb may not be found;
  val xmlResults = mlistEmpty[CompilationUnit]
  this.parseGnat2XMLresults.foreach{
    case (key, value) if (key.endsWith(".ads")) =>
      xmlResults += value
    case _ =>
  }
  this.parseGnat2XMLresults.foreach{
    case (key, value) if (key.endsWith(".adb")) =>
      xmlResults += value
    case _ =>
  }

  // cus: Compilation Units
  val it = xmlResults.iterator
  while(it.hasNext){
    val value = it.next()
    visit(value)
  }
  
  
  val ret = mlistEmpty[String]
  
  // store the program translation results as PipelineJob's properties
  // so the result can be used by the following pipeline modules  
  this.jagoProgramResults = ret.toList
}

