package RecordShape 
is
  type Object is tagged
  record
    X_Coord, Y_Coord : Float;
  end record;
  
  anObject: constant Object := Object'(0.0, 0.0);
  
  anInt: constant := 3;
end RecordShape;
