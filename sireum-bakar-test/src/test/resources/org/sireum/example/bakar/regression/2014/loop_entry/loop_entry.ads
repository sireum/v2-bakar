package Loop_Entry is
   type Array_Of_Int is array (1 .. 10) of Integer;

   type Record_Of_Array_Of_Int is
     record
       T : Integer;
       U : Array_Of_Int;
       Z : Integer;
       X : Array_Of_Int;
     end record;
        
   --procedure Int_Loop_Entry (A : in out Array_Of_Int);
                             
   procedure Array_Loop_Entry (A : in out Array_Of_Int)
     with Post => (for all J in A'Range => A (J) = A'Old (A'Last - J + 1) and
                     A (A'Last - J + 1) = A'Old (J));
                     
   procedure Record_Loop_Entry (A : in out Record_Of_Array_Of_Int);
     
end Loop_Entry;

