package P_Public_Child
--# own Y, B, C;  -- Y is public, B is private (declared in body)
--# initializes Y, B, C;
is
  Y: Integer;
  procedure Q(X: in Integer; Z: out Integer);
  --# global in B;
  --# derives Z from X, B;
private
   C: Integer;
end P_Public_Child;
