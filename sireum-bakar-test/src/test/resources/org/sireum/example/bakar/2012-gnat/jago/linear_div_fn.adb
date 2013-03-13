function Linear_Div_Fn (Dividend : Integer;
			      Divisor : Integer) return Integer
--  with 
--  Pre => Divisor > 0 and Dividend >= 0, 
--  Post => Quotient >= 0 
--  and Remainder >= 0
--  and Remainder < Divisor
--  and Divisor * Quotient + Remainder = Dividend;
is 
   Quotient : Integer := 0; 
   Remainder : Integer; 
begin
   --pragma Assume (Dividend /= 0);
   Remainder := Dividend;
   while Remainder >= Divisor loop
      pragma Loop_Invariant
        (Remainder >= 0
         and Quotient >= 0
         and Divisor * Quotient + Remainder = Dividend);
      Quotient := Quotient + 1;
      Quotient := Quotient + 1;
      Remainder := Remainder - Divisor;
   end loop;
   return Remainder;
end Linear_Div_Fn;
