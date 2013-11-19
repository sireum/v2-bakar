package body IncPackage is
   function Inc(X : Integer) return Integer
   is
     R : Integer;
   begin
      R := X + 1;
      pragma Assert (R > X);
      return R;
   end Inc;

end IncPackage;
