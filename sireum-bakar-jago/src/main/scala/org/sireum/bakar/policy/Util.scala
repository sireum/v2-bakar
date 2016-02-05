package org.sireum.bakar.policy

import org.sireum.util._

/**
 * @author zhi
 */
object Util {
  def prettyPrint(typeConstraints: MList[TypeConstraint]) {
    typeConstraints.foreach(
        typeConstraint => {
          // TypeConstraint(lhs_type: String, rhs_type: IList[String])
          val t2 = typeConstraint.lhs_type
          typeConstraint.rhs_type.foreach (
              t1 => {
                print(s"$t1 < $t2 ")
              })
          println()
        })
  }
  
  def prettyPrint_atomicTypeConstraints(typeConstraints: MList[(String, String)]) {
    typeConstraints.foreach(
        typeConstraint => {
          val t1 = typeConstraint._1
          val t2 = typeConstraint._2
          println(s"$t1 < $t2 ")
        })    
  }
}