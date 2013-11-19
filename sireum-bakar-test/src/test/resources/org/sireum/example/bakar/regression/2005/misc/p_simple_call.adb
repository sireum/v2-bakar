

package body P_Simple_Call is
  B: Integer;

  procedure R(X: out Integer) is
  begin
     X := (Y + B) + C;
  end R;

  function incX(X : Integer) return Integer
    --# return incX(X);
  is
    result: Integer;
  begin
    if(X = 0) then
      result := X + 1;
    else
      result := X - 1;
    end if;
    return result;
  end incX;

  procedure Q(X: in Integer; Z: out Integer)
  is
  begin
     R(Z);
     Z := Z + incX(X);
  end Q;

begin
   Y := 1;
   B := 0;
   C := 0;
end P_Simple_Call;
