procedure Test (N : Integer; M: out Integer)
is 
   type RecordT is record
      X: Integer;
   end record;
   type ArrayT is array (0 .. 5) of Integer;
   
   procedure Increase(X: Integer; Y: out Integer) is
   begin
      Y := X + 1;
   end Increase;   
   
   R: RecordT;
   A: ArrayT;
   
   Result: Integer := 1;
   T: Integer := Result;
   T1: Integer;   
   T2: Integer;
begin
   R.X := 1;
   A(0) := 1;
   T1 := R.X + N;
   T2 := A(0) + T1;
   T := T2;
   Increase(T2, T);
   if T > 0 then
      T := T + 1;
   end if;
   
   if T > 1 then
      T := T + 2;
   else
      T := T - 1;
   end if;
   
   while T > 0 loop
      Result := (Result * T) / N;
      T := T - 1;
   end loop;
   M := Result;
end Test;
