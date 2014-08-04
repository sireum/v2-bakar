package body Two_Way_Sort is
   procedure Swap (A : in out Arr; I : Index; J : Index) with
     Pre  => I in A'Range
               and then J in A'Range,
     Post => A(I) = A(J)'Old and
             A(J) = A(I)'Old and
             (for all K in A'Range =>
                 (if K /= I and K /= J then A(K) = A'Old(K)));

   procedure Swap (A : in out Arr; I : Index; J : Index) is
      T : constant Boolean := A(I);
   begin
      A(I) := A(J);
      A(J) := T;
   end Swap;

   procedure Two_Way_Sort_P (A : in out Arr) is
      I : Index;
      J : Index;
      Fst : Index := 0;
      Lst : Index := 1_000_000;
   begin
      if Lst < Fst then
         return;
      end if;
     
      I := Fst;
      J := Lst;
      while I <= J loop
         pragma Loop_Variant (Decreases => J - I);
         pragma Loop_Invariant
           (I in A'Range
              and then J in A'Range
              and then (for all K in A'First .. I-1 => not A(K))
              and then (for all K in J+1 .. A'Last => A(K)));
         if not A(I) then
            I := I+1;
         else
	    if A(J) then
	       J := J-1;
	    else
	       Swap (A, I, J);
	       I := I+1;
	       J := J-1; 
	    end if;
         end if;
      end loop;
   end Two_Way_Sort_P;
end Two_Way_Sort;
