package QuantifierTest
        
  -- visible variables are not state abstractions  
  --# own V;
  --# initializes V;
is
  -- resolves 'elaboration code may access <global> before it is initialized'
  pragma Elaborate_Body;
    
  type Index is range 1..10;
  type Vector is array (Index) of Integer;
  
  V:Vector;
  
  procedure dummy(I : in Index) with
    Global => (In_Out => V),
    Depends => (V => (V, I));
    --# global in out V;
    --# derives V from V, I;
  
end QuantifierTest;
