package body SimpleCall is

  function Dummy return Boolean is begin return True; end Dummy;

  function FuncB(X : Integer) return Integer is
  begin
     pragma Assert (X > 0);
     return X;
  end FuncB;

  --procedure ProcA(X : Integer; R : Out Integer) is
  --begin
  --  R := X;
  --end ProcA;

  function FuncA(X : Integer) return Integer is
    R : Integer;
    Y : Integer;
  begin
    R := FuncB(X);

    --ProcA(X, Y);
        
    return R + Y;
  end FuncA;

end SimpleCall;
