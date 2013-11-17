package body SimpleArray is

   subtype Index is Integer range 0 .. 5;
   type Vector is array (Index) of Integer;

   A : Vector := Vector'(0, 1, 2, 3, others => 9); -- positional array agg
   B : Vector := Vector'(0 => 0, 1 => 1, 1 + 1 => 2, 8 / 2 => 3, others => 9); -- named array agg
    
   function Dummy return Boolean is begin return True; end Dummy;

   function Max (V : Vector) return Integer is
      M : Integer;
   begin
      M := V(0);
      for I in Index loop
         if (V(I) > M) then
            M := V(I);
         end if;
      end loop;
      return M;
   end Max;
end SimpleArray;
