function Gcd (M : Integer; N : Integer) return Integer
is 
   C, D : Integer;
   T: Integer;
   R: Integer;
begin
   C := M;
   D := N;
   while D /= 0 loop
      -- the SPARK subset does not include Rem, so here we use Div and Mul to implement it
      T := C / D;
      R := C - T * D;
      C := D;
      D := R;
   end loop;
   return C;
end Gcd;
