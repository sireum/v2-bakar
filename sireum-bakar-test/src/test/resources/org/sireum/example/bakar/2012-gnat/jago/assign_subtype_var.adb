procedure Assign_Subtype_Var (I : in out Integer) is
   
   type T is range 0 .. 10;
   subtype U is T range 1 .. 10;
   Left  : U;

begin
   Left  := 0;
   I := I + 1;
end Assign_Subtype_Var;
