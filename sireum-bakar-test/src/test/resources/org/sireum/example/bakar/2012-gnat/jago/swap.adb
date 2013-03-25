procedure Swap (X : in out Integer; Y : in out Integer)
is 
   T : Integer;
begin
   T := X;
   X := Y;
   Y := T;
end Swap;
