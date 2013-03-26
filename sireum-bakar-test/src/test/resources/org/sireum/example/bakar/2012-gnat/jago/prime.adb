function Prime (N : Integer) return Boolean
is 
   Result: Boolean := False;
   I: Integer;
   T: Integer;
begin
   -- N > 0
   -- current SPARK subset considers only conditional statement without else branch
   Result := False;
   if N = 1 or N = 2 then
      Result := True;
   end if;
   I := 2;
   while I < N and Result = False loop
      T := N / I;
      if N = T * I then
	 Result := True;
      end if;
    end loop;	    
   return Result;
end Prime;
