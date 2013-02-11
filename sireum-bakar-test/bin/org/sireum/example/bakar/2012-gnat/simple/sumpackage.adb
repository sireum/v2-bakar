package body SumPackage is

  function Sum(N : Integer) return Integer is
    R, T : Integer;
  begin
    -- requires -gnatd.V
    --pragma Assume (N >= 0);
    R := 0;
    if (N >= 0) then 
      T := N - 1;
      while (T >= 0) loop
        R := R + 1;
        T := T - 1;
      end loop;
      pragma Assert (N = R);
    end if;
    return R;
  end Sum;
            
  procedure Sum2(N : Integer; R : out Integer)
    -- with Pre => N >= 0;
  is
    T : Integer;
  begin
    R := 0;
    if (N >= 0) then
      T := N - 1;
      while (T >= 0) loop
        R := R + 1;
        T := T - 1;
      end loop;
      pragma Assert (N = R);
    end if;
  end Sum2;
            
end SumPackage;
