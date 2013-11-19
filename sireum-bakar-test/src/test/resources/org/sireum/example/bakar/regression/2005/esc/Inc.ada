--# main_program;
procedure Inc(I: in out Integer)
  --# derives I from I;
  --# pre I > 0;
  --# post I = I~ + 2;
is
begin
   I := I+1;
   I := I+1;
end Inc;
