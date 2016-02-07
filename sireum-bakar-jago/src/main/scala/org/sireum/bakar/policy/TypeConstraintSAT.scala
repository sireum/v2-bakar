package org.sireum.bakar.policy

import org.sireum.util._

/**
 * @author zhi
 */
object TypeConstraintSAT {
  // according to the decision algorithm described in the following paper: 
  // J. Tiuryn. Subtype inequalities. In Proceedings of the Seventh Annual Symposium on Logic
  // in Computer Science, pages 308–315, 1992.
  
  def constraint_sat(typeConstraints: TypeConstraintMatrix, domainConstraints: TypeConstraintMatrix) = {
    val b1 = groud_consistent(typeConstraints)
    val b2 = weakly_satisfiable(typeConstraints, domainConstraints)
    typeConstraints.securityViolated = b1 && b2
    typeConstraints
  }
  
  // the constraints C are satisfiable iff:
  // (1) C is ground consistent
  def groud_consistent(typeConstraints: TypeConstraintMatrix) = {
    // this has already be done in type constraint simplification step
    typeConstraints.securityViolated
  }
    
  // (2) C is weakly satisfiable
  def weakly_satisfiable(typeConstraints: TypeConstraintMatrix, domainConstraints: TypeConstraintMatrix) = {
    val constraints = mlistEmpty[(String, String)]
    val matrix = typeConstraints.matrix
    val n = typeConstraints.matrix.size - 1
    
    // collect the type constraints
    for(i <- 0 to n) {
      val t1 = typeConstraints.typeMapR.get(i).getOrElse("")
      val domainValueIndex1 = domainConstraints.typeMap.get(t1).getOrElse(-1)
      for(j <- 0 to n) {
        if(matrix(i)(j)) {
          val t2 = typeConstraints.typeMapR.get(j).getOrElse("")
          val domainValueIndex2 = domainConstraints.typeMap.get(t2).getOrElse(-1)
          if(domainValueIndex1 != -1 && domainValueIndex2 != -1) {
            // do nothing
          }else if(domainValueIndex1 == -1) {
            val t = 
              if(domainValueIndex2 == -1) 
                (t1, t2)
              else
                (t1, "*")
            constraints += t
          }else {
            val t = (t2, "*")
            constraints += t
          }          
        }
      }      
    }
    
    // unification of type constraints
    val unification_mapping = mlistEmpty[(String, String)]
    val m = constraints.size - 1
    for(i <- 0 to m) {
      val x = constraints(i)._1
      val y = constraints(i)._2
      if(x != y){
        // replace x with y in unification_mapping
        val k = unification_mapping.size - 1
        for(j <- 0 to k) {
          val x1 = unification_mapping(j)._1
          val y1 = if(x == unification_mapping(j)._2) y else unification_mapping(j)._2
          unification_mapping(j) = (x1, y1)
        }
        // add (x -> y) into the unification_mapping
        val t1 = (x, y)
        unification_mapping += t1
        
        for(j <- (i+1) to m) {
          // replace x with y in the constraints from index (i+1) until m
          val x1 = if(x == constraints(j)._1) y else constraints(j)._1
          val y1 = if(x == constraints(j)._2) y else constraints(j)._2
          constraints(j) = (x1, y1)
        }        
      }      
    }

    true
  }
}