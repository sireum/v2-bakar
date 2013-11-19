
--# inherit P_Public_Child;
package P_Public_Child.P2
--# own Q;
--# initializes Q;
is
  Q: Integer;
  procedure Q2(X: in Integer; Y: out Integer; Z: out Integer);
  --# global in P_Public_Child.Y, P_Public_Child.C;
  --# derives Y from X &
  --#         Z from P_Public_Child.Y, P_Public_Child.C;

end P_Public_Child.P2;
