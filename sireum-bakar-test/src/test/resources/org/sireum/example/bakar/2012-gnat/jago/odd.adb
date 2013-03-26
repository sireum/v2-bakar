function Odd (X : in Integer) return Integer
is 
   Result: Integer;
   T: Integer;
begin
   -- (1) the SPARK subset does not include Rem, so here we use Div and Mul to implement it
   -- (2) current SPARK subset considers only conditional statement without else branch
   Result := 1;
   T := X / 2;
   if X = T * 2 then
      Result := 0;
   end if;
   return Result;
end Odd;
