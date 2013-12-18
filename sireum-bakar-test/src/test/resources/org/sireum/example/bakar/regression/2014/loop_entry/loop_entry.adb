package body Loop_Entry is

   procedure Array_Loop_Entry (A : in out Array_Of_Int) is
      Temp : Integer;
   begin
     Outer:
     loop
       Inner:
       for Index in A'First .. (A'Last + 1) / 2 loop
         Temp := A (Index);
         A (Index) := A (A'Last - Index + 1);
         A (A'Last - Index + 1) := Temp;
         pragma Loop_Invariant
           (-- Elements that have been visited so far are swapped
            (for all J in A'First .. Index =>
               A (J) = A'Loop_Entry (Inner) (A'Last - J + 1) and
               A (A'Last - J + 1) = A'Loop_Entry (Outer) (J))
            and then
            -- Elements not yet visited are unchanged
            (for all J in Index + 1 .. A'Last - Index =>
               A (J) = A'Loop_Entry (Inner) (J)));
       end loop Inner;
       exit;
     end loop Outer;
   end Array_Loop_Entry ;
   
   procedure Record_Loop_Entry(A : in out Record_Of_Array_Of_Int) is
     Temp : Integer;
   begin
   Temp := 0;
     OuterLoop2:
     loop
       OuterLoop2_Block:
       declare 
         Z : Integer := 3;
       begin
         Temp := Temp + 1;
         A := Record_Of_Array_Of_Int'(3, Z => 5, others => Array_Of_Int'(others => 1));
         InnerLoop2:
         loop
           pragma Loop_Invariant (A'Loop_Entry (OuterLoop2).X = A.X);
           pragma Loop_Invariant (A.X'Loop_Entry(InnerLoop2)(Temp) = A.X(Temp));
           pragma Loop_Invariant (A.X(Z)'Loop_Entry(InnerLoop2) = A.X(Z));

           -- the following is illegal since Z is not local to OuterLoop2
           --pragma Loop_Invariant (A.X(Z)'Loop_Entry(OuterLoop2) = A.X(Z));
         end loop InnerLoop2;           
       end OuterLoop2_Block;
     end loop OuterLoop2;
   end Record_Loop_Entry;
   
end Loop_Entry;
