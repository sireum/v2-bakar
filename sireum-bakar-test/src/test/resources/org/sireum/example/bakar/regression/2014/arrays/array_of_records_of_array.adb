package body Array_Of_Records_Of_Array is

   procedure Swap(Q: in out ObjectArray; theIndex: in Index_Range) is
     temp1 : IntArray;
     temp2 : IntArray;
   begin
     temp1 := Q(theIndex).X;
     temp2 := Q(theIndex).Y;
     
     Q(theIndex).X := temp2;
     Q(theIndex).Y := temp1;
   end Swap;

begin
  
  oArray := ObjectArray'(others => dummyObject);
  
end Array_Of_Records_Of_Array;

