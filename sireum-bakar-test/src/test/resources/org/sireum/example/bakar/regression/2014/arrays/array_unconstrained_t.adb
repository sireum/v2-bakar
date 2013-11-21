package body Array_Unconstrained_T is
  function isSorted(CV : ConsVector) return Boolean is
  begin
    return Array_Unconstrained.isSorted(CV);
  end isSorted;
  
  function indexIsValue(Z : ConsVector; I : Index; V : Integer) return Boolean is
  begin
    return Array_Unconstrained.indexIsValue(Z, I, V);
  end indexIsValue;  
end Array_Unconstrained_T;
