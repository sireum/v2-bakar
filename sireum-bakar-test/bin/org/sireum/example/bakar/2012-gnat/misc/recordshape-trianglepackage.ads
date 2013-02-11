

--# inherit RecordShape;
package RecordShape.TrianglePackage
is
  type Triangle is new RecordShape.Object with
  record
    A, B, C: Float;
  end record;
  
  aTriangle: constant Triangle := Triangle'(0.0, 0.0, 3.0, 4.0, 5.0);
end RecordShape.TrianglePackage;
