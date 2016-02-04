package org.sireum.bakar.policy

import org.sireum.util._

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
