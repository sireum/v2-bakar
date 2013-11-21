package Array_Of_Records_Of_Array
  with SPARK_Mode
  
  -- visible variables are not state abstractions 
  --# own oArray;
  --# initializes oArray;
is
  -- resolves 'elaboration code may access <global> before it is initialized'
  pragma Elaborate_Body;
            
  type Index_Range is range 1..10;
       
  type IntArray is array (Index_Range) of Integer;
        
  type Object is
    record
      X: IntArray;
      Y: IntArray;
    end record;
        
  dummyObject : constant Object := Object'(IntArray'(others=>0), IntArray'(others=>0));
        
  type ObjectArray is array (Index_Range) of Object;
        
  oArray : ObjectArray;
       
  procedure Swap(Q: in out ObjectArray; theIndex: in Index_Range) with
    Depends => (Q => (Q, theIndex)); 
    --# derives Q from Q, theIndex;
        
end Array_Of_Records_Of_Array;