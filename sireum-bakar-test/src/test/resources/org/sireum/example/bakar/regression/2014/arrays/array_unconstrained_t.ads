with Array_Unconstrained;
--# inherit Array_Unconstrained;
package Array_Unconstrained_T 
  with SPARK_Mode        
is
  subtype Index is Integer range 0 .. 10;
  subtype ConsVector is Array_Unconstrained.Vector(Index);
  
  function isSorted(CV : ConsVector) return Boolean;
  function indexIsValue(Z : ConsVector; I : Index; V : Integer) return Boolean;
end Array_Unconstrained_T;