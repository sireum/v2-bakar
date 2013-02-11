
package body P_Public_Child is

   B: Integer;
  --# inherit P_Public_Child;
  package P2
  is
    procedure R(X: out Integer);
    --# global in P_Public_Child.Y, P_Public_Child.B, P_Public_Child.C;
    --# derives X from P_Public_Child.Y, P_Public_Child.B, P_Public_Child.C;
  end P2;

  -- NOTE: Child packages may be declared only at library level
  --       so the following is illegal in SPARK
  -- package P2.P3 is
  --   procedure D(X: in out Integer);
  --     --# derives X from X;
  -- end P2.P3;

  -- package body P2.P3 is
  --   procedure D(X: in out Integer) is
  --   begin
  --       X := X + 1;
  --   end D;
  -- end P2.P3;

  package body P2 is

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

    procedure R(X: out Integer)
    is
      -- NOTE: this is valid spark but the compiler doesn't currently
      --       emit the correct pilar code for packages embedded
      --       within procedures (it will think P3's parent is P2 and
      --       not R).  This package should only be visible within R
      --package P3 is
      --  procedure D(X: in out Integer);
      --    --# derives X from X;
      --end P3;

      --package body P3 is
      --  procedure D(X: in out Integer) is
      --    begin
      --      X := X + 1;
      --    end D;
      --end P3;

    begin
      X := (P_Public_Child.Y + P_Public_Child.B) + P_Public_Child.C;
    end R;
  end P2;



  procedure Q(X: in Integer; Z: out Integer)
  is
  begin
    Z := X + B;
  end Q;

begin
   Y := 1;
   B := 0;
   C := 0;
end P_Public_Child;
