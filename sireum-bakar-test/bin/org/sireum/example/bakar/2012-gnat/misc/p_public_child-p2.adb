
package body P_Public_Child.P2 is

  package P3 is
    procedure D(X: in out Integer);
      --# derives X from X;
    end P3;

  package body P3 is
    procedure D(X: in out Integer) is
      begin
        X := X + 1;
      end D;
  end P3;

  procedure Q2(X: in Integer; Y: out Integer; Z: out Integer) is
  begin
     Y := X;
     Z := P_Public_Child.Y + P_Public_Child.C;
  end Q2;

begin
  Q := 3;
end P_Public_Child.P2;
