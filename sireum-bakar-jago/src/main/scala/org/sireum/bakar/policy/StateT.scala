package org.sireum.bakar.policy

import org.sireum.bakar.xml._
import org.sireum.util._
import scala.collection.JavaConversions.asScalaBuffer
import org.sireum.bakar.xml.SourceLocation
import org.sireum.bakar.policy.parser.T_Policy

/**
 * @author zhi
 */
/*
class TypeConstraint(t1: MList[String], t2: String) {
  // e.g. t1 <= t2, where t1 maybe the union of a list of types, such as t' v t''
  
}

class TypeConstraint_of_Subprogram(
    f_name: String, 
    f_param_t: MMap[String, String], 
    f_param_mode: MMap[String, String], 
    f_param_constraints: MList[TypeConstraint]) {
  // subprogram name
  
  // type mapping of parameters
  
  // in/out mode of parameters
  
  // type constraints between types of parameters
  
}

class StateT {
  // Tf: mapping from function name to its parameter types and type constraints between them
  // Tg: mapping from global variables to types
  // Tl: mapping from local variables to types
  // Tp: type of the program counter
  // fresh_n: fresh variables
  // Cs:   type constraint set
  val Tf = mmapEmpty[String, TypeConstraint_of_Subprogram];
  val Tg = mmapEmpty[String, String];
  val Tl = mmapEmpty[String, String];
  val Tp = mlistEmpty[String];
  var fresh_n = 0;
  val Cs = mlistEmpty[Tuple2[String, String]];
  
  // help functions
  def gen_fresh(): Int = {
    fresh_n += 1;
    return fresh_n;
  }
  
  def fetch_type(x: String, lhs_or_rhs: Boolean): Option[String] = {
    if(Tg.get(x) != None)
      return Tg.get(x)
    
    if(lhs_or_rhs) {
      // if it's a lhs variable
      val fresh_t = "t" + gen_fresh
      Tl += (x -> fresh_t)
    }
    return Tl.get(x)
  }
}
*/

final case class TypeConstraint(lhs_type: String, rhs_type: IList[String]) {
  // e.g. rhs_type <= lhs_type, where rhs_type maybe the union of a list of types, such as t' v t''
  
}

final case class TypeConstraint_of_Subprogram(
    f_name: String, 
    f_params: MList[String],
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
  val Domain_Ordering = mlistEmpty[(String, String)] // value._1 <= value._2
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
    policy.get_domains.get_domain_ordering.foreach(
        kv => {
          val p = (kv._1, kv._2)
          Domain_Ordering += p
          })
    policy.get_domain_bindings.foreach(kv => Tg += (kv._1 -> kv._2))
    policy.get_declassifiers.foreach(
        kv => {
          val f_name = kv._1
          val f_params = mlistEmpty[String]
          val f_param_type = mmapEmpty[String, String]
          val f_param_mode = mmapEmpty[String, String]
          val f_param_constraints = mlistEmpty[TypeConstraint]
          kv._2.get_params.foreach(param => f_params += param)
          kv._2.get_param_types.foreach(pt => f_param_type += (pt._1 -> pt._2))
          kv._2.get_param_mode.foreach(pm => f_param_mode += (pm._1 -> pm._2))
          val declassifier_constraint = 
            new TypeConstraint_of_Subprogram(f_name, f_params, f_param_type, f_param_mode, f_param_constraints)
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
  
  def typeConstraint_substitute(typeConstraint: TypeConstraint, x: String, y: String) = {
    val lhs_type1 = 
      if(typeConstraint.lhs_type == x)
        y
      else
        typeConstraint.lhs_type
    val rhs_type1 = mlistEmpty[String]
    typeConstraint.rhs_type.foreach(
        t => {
          val t1 = 
            if(t == x)
              y
            else
              t
          rhs_type1 += t1
        })
    TypeConstraint(lhs_type1, rhs_type1.toList)
  }
  
  def Cs_substitute(Cs: MList[TypeConstraint], x: String, y: String) = {
    // replace x with y in constraint set Cs
    val Cs1 = mlistEmpty[TypeConstraint]
    val n = Cs.size
    var i = 0
    while(i < n) {
      Cs1 += typeConstraint_substitute(Cs(i), x, y)
      i += 1
    }
    Cs1
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