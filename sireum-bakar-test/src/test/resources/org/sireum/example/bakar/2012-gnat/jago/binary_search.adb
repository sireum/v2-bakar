package body Binary_Search
is
   ----------------------------------------------------
   --     SPARK 2014 - Binary_Search Example         --
   --                                                --
   -- This example illustrates the use of loop       --
   -- invariants and variants in the proof of a      --
   -- binary search algorithm.                       --
   ----------------------------------------------------

   procedure Search (A : Ar; I : Integer; Result: out T) is
      Left  : U;
      Right : U;
      Med   : U;
   begin
      Left  := 1;
      Right := 10;
      
      Result := 0;

      if A (Left+1) > I or else A (Right) < I then
         Result := 0;
      end if;

      while Left <= Right loop
         Med := Left + (Right - Left) / 2;

         if A (Med) < I then
            Left := Med + 1;
         else
         	if A (Med) > I then
              Right := Med - 1;
        	else
              Result := Med;
            end if;
         end if;
      end loop;
   end Search;

end Binary_Search;
