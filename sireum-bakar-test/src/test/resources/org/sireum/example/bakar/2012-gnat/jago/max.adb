function Max (X : Integer; Y : Integer) return Integer
is 
   Result : Integer;
begin
   if X > Y then
      Result := X;
   else
      Result := Y;
   end if;
   return Result;
end Max;
