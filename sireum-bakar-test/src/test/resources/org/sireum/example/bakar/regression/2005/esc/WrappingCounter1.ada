package WrappingCounter1
  --# own Count: CounterRange;
  --# initializes Count;
is
   subtype CounterRange is Integer range 0..100;

   function Read_Count return CounterRange;
   --# global in Count;
   --# return Count;

   procedure Inc;
   --# global in out Count;
   --# derives Count from Count;
   --# pre true;
   --# post (Count~ < CounterRange'Last -> Count = Count~ + 1) and
   --#      (Count~ = CounterRange'Last -> Count = 0);

end WrappingCounter1;


package body WrappingCounter1 is

   Count : CounterRange;

   function Read_Count return CounterRange is
   begin
      return Count;
   end Read_Count;

   procedure Inc is
   begin
      if (Count < CounterRange'Last) then
         Count := Count + 1;
      else
         Count := 0;
      end if;
   end Inc;
begin
   Count := 0;
end WrappingCounter1;
