procedure Odd (X : in Integer; R : out Boolean)
is 
   T: Integer;
begin
   -- (1) the SPARK subset does not include Rem, so here we use Div and Mul to implement it
   -- (2) current SPARK subset considers only conditional statement without else branch
   R := True;
   T := X / 2;
   if X = T * 2 then
      R := False;
   end if;
end Odd;
