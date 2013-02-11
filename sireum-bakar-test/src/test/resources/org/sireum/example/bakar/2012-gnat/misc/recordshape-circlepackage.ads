

--# inherit RecordShape;
package RecordShape.CirclePackage
is
  type Circle is new RecordShape.Object with
  record
    Radius: Float;
  end record;
  
  aCircle: constant Circle := Circle'(Radius => 1.0, X_Coord => 1.0, Y_Coord => 1.0);
end RecordShape.CirclePackage;
