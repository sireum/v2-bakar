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
  
  def build_typeConstraint_of_Subprogram(
      f_name: String, 
      f_param_type: MMap[String, String], 
      f_param_mode: MMap[String, String], 
      typeConstraints: TypeConstraintMatrix,
      domains : MList[String],
      domainConstraints: TypeConstraintMatrix) = {
    // domains: contains the defined domain values
    // typeConstraints: the generated type constraints for the program, which may include type variables
    // for locally defined variables within the program; and we want the type constraints between
    // parameter's types, so here we only keep those type constraints containing only parameter's types
    val f_param_constraints = mlistEmpty[TypeConstraint]
    val param_types = msetEmpty[String]
    f_param_type.foreach(t => param_types += t._2)

    val matrix = typeConstraints.matrix
    val typeMapR = typeConstraints.typeMapR
    val n = matrix.size - 1
    for(i <- 0 to n) {
      // each column
      val t1 = typeMapR.get(i).getOrElse("")
      if(param_types.contains(t1) || domains.contains(t1)) {
        val rhs_types = mlistEmpty[String]
        for(j <- 0 to n) {
          // each row
          if(matrix(j)(i)) {
            val t2 = typeMapR.get(j).getOrElse("")
            if(param_types.contains(t2) || domains.contains(t2))
              rhs_types += t2         
          }
        }
        if(!rhs_types.isEmpty) {
          val lub = TypeConstraintSimplification.least_upper_bound(rhs_types, domainConstraints)
          f_param_constraints += TypeConstraint(t1, lub.toList) 
        }
      }
    }    
    TypeConstraint_of_Subprogram(f_name, f_param_type, f_param_mode, f_param_constraints)
  }  
}


