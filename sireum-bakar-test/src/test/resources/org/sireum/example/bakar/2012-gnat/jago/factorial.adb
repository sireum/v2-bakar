function Factorial (N : Integer) return Integer
is 
   Result: Integer := 1;
   T: Integer;
begin
   if N < 0 then
      Result := -1;
   else
      T := N;
      while T > 0 loop
	 Result := Result * T;
	 T := T - 1;
      end loop;
    end if;
    return Result;
end Factorial;
