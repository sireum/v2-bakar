
package body P_Simple_Call_Two is
  B: Integer;

  procedure R(X: in Integer; Z: out Integer) is
  begin
     Z := ((X + Y) + B) + C;
  end R;

  procedure Q(X: in Integer; Z: out Integer)
  is
  begin
     R(X,Z);
     Z := Z + X;
  end Q;

begin
   Y := 1;
   B := 0;
   C := 0;
end P_Simple_Call_Two;


