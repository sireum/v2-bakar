
package body Package_Scope is
  --# inherit Package_Scope;
  package P2
  is
    procedure R(X: out Integer);
    --# global in Package_Scope.Y;
    --# derives X from Package_Scope.Y;
  end P2;

  package body P2 is
    procedure R(X: out Integer) is 
    begin
      X := Package_Scope.Y;
    end R;
  end P2;

  procedure Q(X: in Integer; Z: out Integer) is
  begin
    Z := X;
  end Q;

begin
  Y := 1;
end Package_Scope;
