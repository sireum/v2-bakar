package PositionalArray
  with SPARK_Mode
                
  -- visible variables are not state abstractions
  --# own Box, Box2;
  --# initializes Box, Box2;
is
  -- resolves 'elaboration code may access <global> before it is initialized'
  pragma Elaborate_Body;
                    
  subtype Index is Integer range 1..5;
  type Square is array (Index) of Integer;
                
  -- note that all positions are defined but we can still do an 'others'
  Box: Square := Square'(-1, -2, 7 ,3 , 2, others=>3);
                
  Box2: Square;
            
  procedure dummy(X : in Index) with
    Depends => (Box => (Box, X)),
    Global => (In_Out => Box);
    --# global in out Box;
    --# derives Box from Box, X;
                
end PositionalArray;