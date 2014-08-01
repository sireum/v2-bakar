package Binary_Search
is
   ----------------------------------------------------
   --     SPARK 2014 - Binary_Search Example         --
   --                                                --
   -- This example illustrates the specification of  --
   -- a simple search function.                      --
   ----------------------------------------------------


   type T is range 0 .. 10;
   subtype U is T range 1 .. 10;

   type Ar is array (U) of Integer;

   procedure Search (A : Ar; I : Integer; Result: out T);

end Binary_Search;
