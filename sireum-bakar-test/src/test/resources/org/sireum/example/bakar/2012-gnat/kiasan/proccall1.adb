package body ProcCall1 is

  function Dummy return Boolean is begin return True; end Dummy;

  procedure ProcB(X : Integer; Y : out Integer; Z : in out Integer) is
  begin
    if(Z > 0) then
      Z := Z + 1;
    else
      Z := Z - 1;
    end if;
    Y := X + Z;
  end ProcB;

  procedure ProcA(M : in out Integer; N : out Integer) is
  begin
    ProcB(7, N, M);
  end ProcA;

end ProcCall1;
