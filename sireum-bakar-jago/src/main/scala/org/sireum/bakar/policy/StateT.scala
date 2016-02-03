package org.sireum.bakar.policy

/**
 * @author zhi
 */
class StateT {
  // T_g: type of global variables
  // T_l: type of local variables
  // p:   type of the program counter
  // fresh: fresh variables
  // C:   type constraint set
  val Tg = new scala.collection.mutable.HashMap[String, String]();
  val Tl = new scala.collection.mutable.HashMap[String, String]();
  
}