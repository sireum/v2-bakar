package MyMatrix
  with SPARK_Mode        
is
  type Matrix_Index is limited private;
  type Matrix is limited private;
  
  procedure Multiply(X, Y : in     Matrix;
                     Z    :    out Matrix) with
    Depends => (Z => (X, Y));
    --# derives Z from X, Y;

private
  type Matrix_Index is range 0..9;
  type Matrix is array (Matrix_Index, Matrix_Index) of Integer;
end MyMatrix;