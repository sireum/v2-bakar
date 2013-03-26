function Prime (N : Integer) return Integer
is 
   Result: Integer;
   I: Integer;
   T: Integer;
begin
   -- N > 0
   -- current SPARK subset considers only conditional statement without else branch
   Result := 0;
   if N = 1 or N = 2 then
      Result := 1;
   end if;
   I := 2;
   while I < N and Result = 0 loop
      T := N / I;
      if N = T * I then
	 Result := 1;
      end if;
    end loop;	    
   return Result;
end Prime;
