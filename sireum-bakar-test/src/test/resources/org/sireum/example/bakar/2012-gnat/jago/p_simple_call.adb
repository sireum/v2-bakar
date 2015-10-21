

package body P_Simple_Call is
  B: Integer;

  procedure R(X: out Integer) is
  begin
     X := (Y + B) + C;
  end R;

  procedure incX(X : in Integer; Z: out Integer)
  is
    result: Integer;
  begin
    if(X = 0) then
      result := X + 1;
    else
      result := X - 1;
    end if;
    Z := result;
  end incX;

  procedure Q(X: in Integer; Z: out Integer)
  is
     V: Integer;
  begin
     R(Z);
     IncX(X, V);
     Z := Z + V;
  end Q;

begin
   Y := 1;
   B := 0;
   C := 0;
end P_Simple_Call;
