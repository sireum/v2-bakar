package Two_Way_Sort is 
   subtype Index is Integer range 0 .. 1_000_000;
   type Arr is array (Index) of Boolean;
   procedure Two_Way_Sort_P (A : in out Arr) with
     Post => A'Last < A'First 
               or else (for some K in A'Range =>
			  (for all J in A'First .. K => not A(J))
			    and then (for all J in K+1 .. A'Last => A(J)));
end Two_Way_Sort;
