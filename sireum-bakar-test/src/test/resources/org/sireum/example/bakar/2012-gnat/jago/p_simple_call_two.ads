package P_Simple_Call_Two
--# own Y, B, C;  -- Y is spec-public, B is body-declared, C is spec-private
--# initializes Y, B, C;

is
  Y: Integer;
  procedure Q(X: in Integer; Z: out Integer);
  --# global in B, Y, C;
  --# derives Z from X, B, Y, C;

  procedure R(X: in Integer; Z: out Integer);
  --# global in Y, B, C;
  --# derives Z from X, Y, B, C;

private
   C: Integer;
end P_Simple_Call_Two;
