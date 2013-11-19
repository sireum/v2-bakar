-- WORK IN PROGRESS

package WrappingCounterX
  --# own Count: Integer;
  --# initializes Count;
  --@ invariant 0 <= Count and Count <= MAX;

  -- Make this a package invariant ... or a where clause over constants?
  --@ invariant 0 < MAX and MAX < Integer'Last and MAX mod 2 = 0;  
is
   MAX: constant Integer;

   function Read_MAX return Integer;
   --# return x =>
   --#   Integer'First < x and 0 < x and x < Integer'Last and x mod 2 = 0;

   function Read_Count return Integer;
   --# global in Count;
   --# return result =>
   --#   result = Count and 0 <= result and result <= MAX;

   procedure Inc;
     --# global in out Count;
     --# derives Count from Count;
     --# pre true;
     --!# post (Count < MAX -> Count = Count~ + 1) and
     --!#      (Count >= MAX -> Count = 0);
private
  MAX: constant Integer := 100;
  --!@ assert 0 < MAX and MAX < Integer'Last and MAX mod 2 = 0;
end WrappingCounterX;

package body WrappingCounterX is

   Count : Integer;

   function Read_MAX return Integer is
   begin
      --!@ assume Integer'First <= Integer'Last;
      return MAX;
   end Read_MAX;

   function Read_Count return Integer is
   begin
      return Count;
   end Read_Count;

   procedure Inc is
   begin
        --# assert 0 < Read_MAX and Read_MAX < Integer'Last and MAX mod 2 = 0;
      if (Count < Read_MAX) then
         Count := Count + 1;
      else
         Count := 0;
      end if;
   end Inc;
begin
  Count := 0;
  --# assert 0 < MAX and MAX < Integer'Last and MAX mod 2 = 0;
end WrappingCounterX;
