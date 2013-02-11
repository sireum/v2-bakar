package body Minpackage is
   function MinFunc(X, Y : Integer) return Integer is
      Min, Max : Integer;
   begin
      if(X >= Y) then
         Min := Y;
         Max := X;
      else
         Min := X;
         Max := Y;
      end if;

      pragma Assert(Min <= X and then Min <= Y and then X <= Max and then Y <= Max);

      return Min;
   end MinFunc;
end MinPackage;
