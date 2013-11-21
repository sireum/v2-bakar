package Array_One_Dim
  with SPARK_Mode        
        
  -- visible variables are not state abstractions          
  --# own V, F, G;
  --# initializes V, F, G;
is
  -- resolves 'elaboration code may access <global> before it is initialized'
  pragma Elaborate_Body;
    
  I : constant := 3;
  F : Integer;

  subtype Index is Integer range 1..100;
  subtype subIndex is Index range 5..9;
  subtype highIndex is Index range 50..60;
  
  type Vector is array(Integer range <>) of Integer;
  subtype constrainedVector is Vector (Index);
  
  V : constrainedVector;
  G : Index;
    
  procedure dummy(X : in highIndex) with 
    Global => (In_Out => V),
    Depends => (V => (V, X));
    --# global in out V;
    --# derives V from V, X;
  
  procedure dummy2(X : in highIndex) with
    Global => (In_Out => V),
    Depends => (V => (V, X));
    --# global in out V;
    --# derives V from V, X;
   
end Array_One_Dim;