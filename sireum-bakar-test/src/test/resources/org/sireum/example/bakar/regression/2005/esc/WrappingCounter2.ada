package WrappingCounter2
  --# own Count: CounterRange;
  --# initializes Count;
is
   --+# invariant Count mod 2 = 0;

   subtype CounterRange is Integer range 0..100;

   function Read_Count return CounterRange;
   --# global in Count;
   --# return c => c = Count and
   --#   c mod 2 = 0;

   procedure Inc;
   --# global in out Count;
   --# derives Count from Count;
   --# post (Count~ + 2 <= CounterRange'Last -> Count = Count~ + 2) and
   --#      (Count~ + 2 > CounterRange'Last -> Count = 0);

end WrappingCounter2;


package body WrappingCounter2 is

   Count : CounterRange;

   function Read_Count return CounterRange is
   begin
      return Count;
   end Read_Count;

   procedure Inc is
   begin
      if (Count < CounterRange'Last) then
         Count := Count + 1;
         if (Count < CounterRange'Last) then
            Count := Count + 1;
         else
            Count := 0;
         end if;
      else
         Count := 0;
      end if;
   end Inc;
begin
   Count := 0;
end WrappingCounter2;
