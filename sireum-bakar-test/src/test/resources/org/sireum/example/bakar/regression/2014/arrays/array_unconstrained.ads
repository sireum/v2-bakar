package Array_Unconstrained
  with SPARK_Mode
is
  type Vector is array(Integer range <>) of Integer;
  
  function isSorted(Z : Vector) return Boolean;
  function indexIsValue(Z : Vector; Index, V : Integer) return Boolean;
end Array_Unconstrained;