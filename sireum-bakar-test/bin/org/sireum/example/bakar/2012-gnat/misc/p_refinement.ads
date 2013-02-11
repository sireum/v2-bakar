package P_Refinement
--# own Y, B, C, AbsD;
--# initializes Y, B, C, AbsD;
is
  Y: Integer;
  procedure Q(X: in Integer; Z: out Integer);
  --# global in B;
  --# derives Z from X, B;
private
   C: Integer;
end P_Refinement;
