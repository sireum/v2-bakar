

package body for_loops is

   procedure Stupid(Z : in Index_Range) is
   begin
     
     for I in Index_Range loop
       A(I) := 1;
     end loop;
     
     for I in reverse Index_Range loop
       A(I) := 1;
     end loop;
     
     for I in Index_Range range 1 .. 3 loop
       A(I) := 1;
     end loop;
     
     for I in reverse Index_Range range 1 .. Z loop
       A(I) := 1;
     end loop;
     
     -- note that Z could be <= Index_Range'First + 10
     for I in Index_Range range Index_Range'First + 10 .. Z loop
       A(I) := A(I);
     end loop;
     
     -- note that Z could be <= Index_Range'First + 10
     for I in reverse Index_Range range Index_Range'First + 10 .. Z loop
       A(I) := A(I);
     end loop;
     
     -- why whould you ever do the following ????
     for I in Index_Range range A'Range loop
       A(I) := A(I);
     end loop;
     
     for I in reverse Index_Range range A'Range loop
       A(I) := A(I);
     end loop;
     
     for I in Index_Range range A'Range(1) loop
       A(I) := A(I);
     end loop;
     
     for I in reverse Index_Range range A'Range(1) loop
       A(I) := A(I);
     end loop;
     
   end Stupid;
   
 end for_loops;