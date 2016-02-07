package org.sireum.bakar.policy

import org.sireum.util._

/**
 * @author zhi
 */

// map a type to an integer, matrix(i)(j) denotes a type constraint t1 < t2,
// where typeMap(t1) = i, typeMap(t2) = j
final case class TypeConstraintMatrix(
    matrix: Array[Array[Boolean]],
    typeMap: MMap[String, Int],
    typeMapR: MMap[Int, String],
    var securityViolated: Boolean)

object TypeConstraintSimplification {
  def least_upper_bound(types: MList[String], domainConstraints: TypeConstraintMatrix) = {
    // types: contains both concrete security domain, e.g. Public/Secret, and type variable, e.g. t1/t2
    // domainConstraints: contains the ordering between security domains
    // given: [t1, t2, Public, Secret], return: [t1, t2, Secret]
    val matrix = domainConstraints.matrix
    val typeMap = domainConstraints.typeMap
    val typeMapR = domainConstraints.typeMapR
    val lub = mlistEmpty[String]
    val domainValues = mlistEmpty[String]
    for(t <- types) {
      if(!typeMap.get(t).isEmpty)
        domainValues += t
      else
        lub += t
    }
    
    // compute the least upper bound for domainValues
    while(domainValues.size > 0) {
      val t1 = domainValues(0)
      val i1 = typeMap.get(t1).getOrElse(-1)
      domainValues -= t1
      var keepT1 = true 
      val n = domainValues.size
      var j = 0
      for(i <- 1 to n) {
        val t2 = domainValues(j)
        val j1 = typeMap.get(t2).getOrElse(-1)
        if(matrix(i1)(j1)) {
          keepT1 = false
        }else if(matrix(j1)(i1)){
          domainValues -= t2
        }else{
          j += 1
        }
      }
      if(keepT1)
        lub += t1
    }
    lub
  }
  
  def greatest_lower_bound(types: MList[String], domainConstraints: TypeConstraintMatrix) = {
    // types: contains both concrete security domain, e.g. Public/Secret, and type variable, e.g. t1/t2
    // domainConstraints: contains the ordering between security domains
    // given: [t1, t2, Public, Secret], return: [t1, t2, Secret]
    val matrix = domainConstraints.matrix
    val typeMap = domainConstraints.typeMap
    val typeMapR = domainConstraints.typeMapR
    val glb = mlistEmpty[String]
    val domainValues = mlistEmpty[String]
    for(t <- types) {
      if(!typeMap.get(t).isEmpty)
        domainValues += t
      else
        glb += t
    }
    
    // compute the greatest lower bound for domainValues
    while(domainValues.size > 0) {
      val t1 = domainValues(0)
      val i1 = typeMap.get(t1).getOrElse(-1)
      domainValues -= t1
      var keepT1 = true 
      val n = domainValues.size
      var j = 0
      for(i <- 1 to n) {
        val t2 = domainValues(j)
        val j1 = typeMap.get(t2).getOrElse(-1)
        if(matrix(i1)(j1)) {
          domainValues -= t2
        }else if(matrix(j1)(i1)){
          keepT1 = false
        }else{
          j += 1
        }
      }
      if(keepT1)
        glb += t1
    }
    glb    
  }
  
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
    
    // (1) build a matrix to represent the type constraints
    val types = msetEmpty[String]
    typeConstraints.foreach(
        typeConstraint => {
          types += typeConstraint._1
          types += typeConstraint._2
        })
        
    val typeMap = mmapEmpty[String, Int]
    val typeMapR = mmapEmpty[Int, String]
    var k = 0
    types.foreach(
        t => {
          typeMap += (t -> k)
          typeMapR += (k -> t)
          k = k + 1
        })
    
    val n = types.size
    val matrix = Array.ofDim[Boolean](n,n)
    // initialize the matrix
    for(i <- 0 to (n-1))
      for(j <- 0 to (n-1))
        matrix(i)(j) = false
        
    typeConstraints.foreach(
        typeConstraint => {
          val i = typeMap.get(typeConstraint._1).getOrElse(-1)
          val j = typeMap.get(typeConstraint._2).getOrElse(-1)
          assert(i != -1 && j != -1)
          matrix(i)(j) = true
        })
    
    // (2) compute the transitive closure
    for(k <- 0 to (n-1))
      for(i <- 0 to (n-1))
        for(j <- 0 to (n-1))
          matrix(i)(j) = matrix(i)(j) || (matrix(i)(k) && matrix(k)(j))
    
    TypeConstraintMatrix(matrix, typeMap, typeMapR, false)
  }
  
  // step 3. simplification
  
  // typeConstraints: is type constraints generated for the program
  // domainConstraints: is the ordering between domains defined in security policy
  def simplify(typeConstraints: TypeConstraintMatrix, domainConstraints: TypeConstraintMatrix): TypeConstraintMatrix = {
    val simplified_typeConstraints = mlistEmpty[(String, String)]
    val matrix = typeConstraints.matrix
    val typeMap = typeConstraints.typeMap
    val ib = typeMap.get("BOTTOM").getOrElse(-1)
    val it = typeMap.get("TOP").getOrElse(-1)
    val n = matrix.size - 1
    
    // (1) simplify: BOTTOM < t, t < TOP, t < t
    if(ib != -1)
      for(i <- 0 to n)
        matrix(ib)(i) = false
    if(it != -1)
      for(i <- 0 to n)
        matrix(i)(it) = false
    for(i <- 0 to n)
      matrix(i)(i) = false
    
    val replacement = mmapEmpty[String, String]
    var securityViolated = false
    // (2) if l1 < a and l2 < a and l1 v l2 = TOP, then a = TOP
    // (3) if a < l1 and a < l2 and l1 ^ l2 = BOTTOM, a = BOTTOM
    // (4) if l < a and no l' that l < l', then a = l
    // (5) if a < l and no l' that l' < l, then a = l
    // (6) if a < t and t < a, then a = t
    // (7) simplify: l1 < l2 
    for(i <- 0 to n) {
      val t1 = typeConstraints.typeMapR.get(i).getOrElse("")
      val domainValueIndex1 = domainConstraints.typeMap.get(t1).getOrElse(-1)
      for(j <- 0 to n) {
        if(matrix(i)(j)) {
          val t2 = typeConstraints.typeMapR.get(j).getOrElse("")
          val domainValueIndex2 = domainConstraints.typeMap.get(t2).getOrElse(-1)
          if(domainValueIndex1 != -1 && domainValueIndex2 != -1) {
            // check whether the type constraint, e.g. l1<l2, conforms to the domain ordering
            if(domainConstraints.matrix(domainValueIndex1)(domainValueIndex2)) {
              matrix(i)(j) = false
            } else {
              typeConstraints.securityViolated = true
              return typeConstraints
            }
          }          
        }
      }      
    }
    //
    typeConstraints
  } 
  
  def restoreTypeConstraints(typeConstraints: TypeConstraintMatrix) = {
    val matrix = typeConstraints.matrix
    val typeMapR = typeConstraints.typeMapR
    val constraints = mlistEmpty[(String, String)]
    val n = matrix.size - 1
    for(i <- 0 to n) {
      val t1 = typeMapR.get(i).getOrElse("")
      for(j <- 0 to n) {
        if(matrix(i)(j)) {
          val t2 = typeMapR.get(j).getOrElse("")
          val p = (t1, t2)
          constraints += p          
        }
      }
    }
    constraints
  }
}