package Array_Two_Dim
  with SPARK_Mode        
        
  -- visible variables are not state abstractions 
  --# own Box, Box2, aBoard;
  --# initializes Box, Box2, aBoard;
is
  -- resolves 'elaboration code may access <global> before it is initialized'
  pragma Elaborate_Body;
        
  constTwo: constant := 2;
  constThree: constant := constTwo + 1;
  
  highInt: constant := 10;
  subtype Index is Integer range 1..highInt;
  subtype subIndexRange is Index range 6..8;
  
  -- two dim unconstrained array, cannot use this directly, must subtype it
  type Matrix is array (Integer range <>, Integer range <>) of Integer;
  
  -- constraining subtype
  subtype Square is Matrix (Index, Index);

  Box: Square;
  
  -- declaration and initialization of a multidim array.  Inner aggregate 
  -- cannot be qualified as they are not objects of a named types in their own 
  -- right (Barnes 5.6)
  Box2: Square := Square'(others => (others => 0));
  
  -- array of arrays
  type Board_Index is range 1..8;
  type Row is array (Board_Index) of Integer;
  type Board is array (Board_Index) of Row;

  -- declaration and initialization of an array of arrays.  Inner aggregates
  -- have to be qualified 
  aBoard: Board := Board'(others => Row'(others => 1));
        
  procedure dummy(X : in Index; Y: in Index) with
    Global => (In_Out => Box),
    Depends => (Box => (Box, X, Y));
    --# global in out Box;
    --# derives Box from Box, X, Y;

  procedure dummy2(M : in Board_Index; N: in Board_Index) with
    Global => (In_Out => aBoard),
    Depends => (aBoard => (aBoard, M, N));
    --# global in out aBoard;
    --# derives aBoard from aBoard, M, N;
   
end Array_Two_Dim;