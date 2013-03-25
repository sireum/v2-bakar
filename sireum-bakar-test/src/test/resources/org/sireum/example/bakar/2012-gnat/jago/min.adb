function Min (X : Integer; Y : Integer) return Integer
is 
   Result : Integer;
begin
   if X > Y then
      Result := Y;
   else
      Result := X;
   end if;
   return Result;
end Min;
