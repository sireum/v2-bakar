function Max (X : Integer; Y : Integer) return Integer
is 
   Result : Integer;
begin
   -- current SPARK subset considers only conditional statement without else branch
   Result := Y;
   if X > Y then
      Result := X;
   end if;
   return Result;
end Max;
