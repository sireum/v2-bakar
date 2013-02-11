package RecordTest01 
--# own aNestedObject, anObject;
--# initializes aNestedObject, anObject;
is

  type Object is
  record
    X, Y : Integer;
  end record;

  type NestedObject is
  record
    O : Object;
  end record;

  procedure Test01(Q : in out Object);
  --# derives Q from Q ;
  
  aNestedObject: NestedObject;
   
  anObject: Object;
  
end RecordTest01;
