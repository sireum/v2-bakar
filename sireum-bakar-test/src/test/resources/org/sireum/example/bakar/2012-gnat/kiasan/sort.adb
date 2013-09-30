package body Sort is

   subtype Index_Type is Integer range 1 .. 3;
   type Vector is array(Index_Type) of Integer;

   function Dummy return Boolean is begin return True; end Dummy;

   procedure InsertionSort (A : in out Vector)
   is
      Value : Integer;
      J : Integer;
      I : Index_Type;
   begin
      I := 1;
      while(I <= 3) loop
        Value := A(I);
        J := I - 1;
        while J >= 1 loop        
          if(A(J) > Value) then
            A(J + 1) := A(J);
          end if;
          J := J - 1;            
        end loop;
        A(J + 1) := Value;
        I := I + 1;
      end loop;
   end InsertionSort;

end Sort;
