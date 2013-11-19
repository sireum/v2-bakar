package Package_Scope
--# own Y;
--# initializes Y;
is
  Y: Integer;
  procedure Q(X: in Integer; Z: out Integer);
  --# derives Z from X;
end Package_Scope;
