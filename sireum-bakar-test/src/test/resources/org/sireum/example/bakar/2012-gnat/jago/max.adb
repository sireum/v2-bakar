procedure Max (X : Integer; Y : Integer; R: out Integer)
is 
   Result : Integer;
begin
   -- current SPARK subset considers only conditional statement without else branch
   Result := Y;
   if X > Y then
      Result := X;
   end if;
   R := Result;
end Max;
