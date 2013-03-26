function Min (X : Integer; Y : Integer) return Integer
is 
   Result : Integer;
begin
   -- current SPARK subset considers only conditional statement without else branch
   Result := X;
   if X > Y then
      Result := Y;
   end if;
   return Result;
end Min;
