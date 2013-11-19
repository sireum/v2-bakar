--# main_program;
procedure IncIf(I: in out Integer)
  --# derives I from I;
  --# pre I > 0;
  --# post I = I~ + 2;
is
   X: Integer;
begin
   X := 5;
   if (X = 5) then
      I := I + 1;
   else
      I := I - 10;
   end if;
   I := I + 1;
end IncIf;
