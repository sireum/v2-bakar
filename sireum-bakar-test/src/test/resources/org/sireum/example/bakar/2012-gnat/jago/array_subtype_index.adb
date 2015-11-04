procedure Array_Subtype_Index (I : in out Integer) is
   
   type T is range 0 .. 10;
   subtype U is T range 1 .. 10;
   
   type Ar is array (U) of Integer;
   
   A: Ar;  
begin
   A(0) := 0;
   I := I + 1;
end Array_Subtype_Index;
