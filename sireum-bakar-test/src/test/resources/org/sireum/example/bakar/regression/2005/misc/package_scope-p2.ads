
--#inherit Package_Scope;
package Package_Scope.P2
--# own Q;
--# initializes Q;
is
  Q: Integer;
  procedure Q2(X: in Integer; Y: out Integer; Z: out Integer);
  --# global in Package_Scope.Y;
  --# derives Y from X &
  --#         Z from Package_Scope.Y;

end Package_Scope.P2;
