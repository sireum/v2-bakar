package body Sort is
      
   subtype Index_Type is Integer range 1 .. 3;
   type Vector is array(Index_Type) of Integer;
   
   --A : Vector;
    
   procedure Dummy(X: in out Integer)
   is 
   begin 
      X := X + 1;
   end Dummy;

   procedure SelectionSort (A : in out Vector)
    --with global => (In_Out => (A))
   is
     Min : Integer;
     Temp : Integer;
     Pos : Integer;
     I : Integer;
   begin
     Pos := 1;
     while(Pos >= 1 and Pos <= 3) loop
       Min := Pos;
       I := Pos + 1;
       while (I >= Pos + 1 and I <= 3) loop
         if A(I) < A(Min) then
           Min := I;   
         end if;
         I := I + 1; 
       end loop; 
        
       if Pos /= Min then
         Temp := A(Pos);
         A(Pos) := A(Min);
         A(Min) := Temp; 
       end if;
        
       Pos := Pos + 1;
    end loop;
   end SelectionSort; 

end Sort;
