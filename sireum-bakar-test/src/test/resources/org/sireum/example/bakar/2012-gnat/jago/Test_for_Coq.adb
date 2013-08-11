-- check whether the number N is a prime;
-- with Ada.Text_IO; use Ada.Text_IO;
-- with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Test_for_Coq
is 
   N: Integer := 25;
   Result: Boolean;
   I: Integer;
   X: Integer;
begin
   -- current SPARK subset considers only conditional statement without else branch
   Result := true;
   -- N := 1;
   -- Put(N);
   if N <= 1 then
      Result := false;
   end if;
   I := 2;
   while I*I <= N loop
      X := N / I;
      if N = X * I then
         Result := false;
      end if;
      I := I + 1;
   end loop;
   
--   if Result = true then    
--      Put_Line("Yes, it's a prime number !");
--   else
--      Put_Line("No, it's not a prime number !");
--   end if;
   
end Test_for_Coq;
