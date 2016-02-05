package org.sireum.bakar.policy

import org.sireum.util._

/**
 * @author zhi
 */
object TypeConstraintSimplification {
  // step 1. normalization
  //         e.g. t1 v t2 < t3 ===> t1 < t3, t2 < t3
  def normalize(typeConstraints: MList[TypeConstraint]) = {
    val atomic_typeConstraints = mlistEmpty[(String, String)]
    typeConstraints.foreach(
        typeConstraint => {
          // TypeConstraint(lhs_type: String, rhs_type: IList[String])
          val t2 = typeConstraint.lhs_type
          typeConstraint.rhs_type.foreach (
              t1 => {
                val le_constraint = (t1, t2)
                atomic_typeConstraints += le_constraint
              })
        })
    atomic_typeConstraints
  }
  
  // step 2. transitive closure
  def transitive_closure(typeConstraints: MList[(String, String)]) = {
    // Warshall's algorithm to compute transitive closure
    // R(k)[i,j] = R(k-1)[i,j] or (R(k-1)[i,k] and R(k-1)[k,j])
    typeConstraints
  }
  
  // step 3. simplification
  def simplify(typeConstraints: MList[(String, String)]) = {
    val simplified_typeConstraints = mlistEmpty[(String, String)]
    typeConstraints.foreach(
        typeConstraint => {
          // TypeConstraint(lhs_type: String, rhs_type: IList[String])
          val t1 = typeConstraint._1
          val t2 = typeConstraint._2
          if(t1 != "BOTTOM" || t2 != "TOP" || t1 == t2) {
            val le_typeConstraint = (t1, t2)
            simplified_typeConstraints += le_typeConstraint
          }
        })
    simplified_typeConstraints
  }
}