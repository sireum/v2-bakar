package P_Complex
--# own Y, B : Integer; C : Integer; AbsD, AbsAbsQ;
--# initializes Y, B, C, AbsD, AbsAbsQ;
is
  Y: Integer;
  procedure Q(X: in Integer; Z: out Integer);
  --# global in B;
  --# derives Z from X, B;
private
   C: Integer;
end P_Complex;
