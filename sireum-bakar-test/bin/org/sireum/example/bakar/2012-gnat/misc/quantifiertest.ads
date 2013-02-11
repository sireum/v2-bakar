package QuantifierTest 
--# own V;
--# initializes V;
is

  type Index is range 1..10;
  type Vector is array (Index) of Integer;
  
  V:Vector;
  
  procedure dummy(I : in Index);
  --# global in out V;
  --# derives V from V, I;
  
end QuantifierTest;
