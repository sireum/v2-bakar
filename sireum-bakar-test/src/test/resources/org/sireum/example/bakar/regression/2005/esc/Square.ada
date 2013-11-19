--# main_program;
procedure Square(InX: in Integer; OutX: out Integer)
   --# derives OutX from InX;
   --# pre InX > 0;
   --# post OutX = InX * InX;
is
   Y: Integer;
begin
   Y := InX;
   OutX := Y * InX;
end Square;
