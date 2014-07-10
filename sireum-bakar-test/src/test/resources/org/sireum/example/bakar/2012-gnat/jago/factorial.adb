procedure Factorial (N : Integer; M : out Integer)
is 
   Result: Integer := 1;
   T: Integer;
begin   
   -- N > 0
   T := N;
   while T > 0 loop
      Result := Result * T;
      T := T - 1;
   end loop;
   M := Result;
end Factorial;
