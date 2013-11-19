package for_loops 
--# own A;
--# initializes A;
is
   aFloatConst : constant := 3.0 + 7.3;
   aIntConst : constant := 1 + 3;
   type Index_Range is  range 1..100;
   type Vector is array(Index_Range) of Integer;
   A : Vector := Vector'(1..7 => 2, 11=> 3, others => 1);
     
   procedure Stupid(Z : in Index_Range);
   --# global in out A;
   --# derives A from *, Z;
    
end for_loops;
