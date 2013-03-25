procedure Odd (X : in Integer; R : out Boolean)
is 
   T: Integer;
begin
   -- the SPARK subset does not include Rem, so here we use Div and Mul to implement it
   T := X / 2;
   if X = T * 2 then
      R := False;
   else
      R := True;
   end if;
end Odd;
