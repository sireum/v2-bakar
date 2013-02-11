
package body Package_Scope.P2 is

  procedure Q2(X: in Integer; Y: out Integer; Z: out Integer) is
  begin
    Y := X;
    Z := Package_Scope.Y;
  end Q2;

begin
  Q := 3 + 2;
end Package_Scope.P2;
  
  