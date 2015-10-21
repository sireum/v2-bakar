
package body Dependence_Test_Suite_02 is

   procedure Success0 (O : out Integer)
   is
   begin
      O := 5;
   end Success0;

   -- direct copy from input to output
   procedure Success1 (I : in Integer; O : out Integer)
   --# derives O from I ;
   is
   begin
      O := I;
   end Success1;

   -- simple indirect copy through a local variable
   procedure Success2 (I : in Integer; O : out Integer)
   --# derives O from I ;
   is
      L : Integer;
   begin
      L := I;
      O := L;
   end Success2;

   -- simple indirect copy through a chain of local variables
   procedure Success3 (I : in Integer; O : out Integer)
   --# derives O from I ;
   is
      L1, L2, L3 : Integer;
   begin
      L1 := I;
      L2 := L1;
      L3 := L2;
      O := L3;
   end Success3;

   -- indirect copies from multiple inputs
   procedure Success4 (I1, I2 : in Integer; O : out Integer)
   --# derives O from I1, I2 ;
   is
      L1, L2, L3 : Integer;
   begin
      L1 := I1;
      L2 := I2;
      L3 := L1 + L2;
      O := L3;
   end Success4;

   -- kill of an input variable
   procedure Success5 (I1, I2 : in Integer; O1, O2 : out Integer)
    --# derives O1 from I1
    --#       & O2 from I2 ;
   is
      L1, L2, L3 : Integer;
   begin
      O1 := I2; -- this def is killed; O1 does not derive from I2
      L1 := I1;
      L2 := L1;
      L3 := L1 + L2;
      O2 := O1;
      O1 := L3;
   end Success5;

   -- simple control dependence
   procedure Success6 (I1, I2 : in Integer; O1, O2 : out Integer)
    --# derives O1 from I1
    --#       & O2 from I2 ;
   is
   begin
      O1 := I1;
      if I2 > 5
      then -- note: SPARK is cannot detect both branches give same value
         O2 := 5;
      else
         O2 := 5;
      end if;
   end Success6;

   -- control chained through data dependence for I1
   procedure Success7 (I1, I2 : in Integer; O : out Integer)
    --# derives O from I1, I2;
   is
      L1 : Integer;
   begin
      L1 := I1;
      if L1 > I2
      then
         O := 6;
      else
         O := 7;
      end if;
   end Success7;

   -- mixed control and data dependence
   procedure Success8 (I1, I2 : in Integer; O : out Integer)
   --# derives O from I1, I2;
   is
      L1, L2 : Integer;
   begin
      L1 := I1;
      if L1 > 5
      then
         L2 := 6;
      else
         L2 := I2;
      end if;
      O := L2;
   end Success8;

   -- nested conditionals (transitive control dependence)
   procedure Success9 (I1, I2, I3 : in Integer; O : out Integer)
   --# derives O from I1, I2, I3;
   is
      L1, L2 : Integer;
   begin
      L1 := I1;
      if L1 > 5
      then
         L2 := 6;
      else
         if I2 < 0
         then
            L2 := I3;
         else
            L2 := 7;
         end if;
      end if;
      O := L2;
   end Success9;

      -- nested conditionals, killing definitions
   procedure Success10 (I1, I2, I3 : in Integer; O1, O2 : out Integer)
     --# derives O1 from I1, I2
     --#       & O2 from I3;
   is
      L1, L2 : Integer;
   begin
      L2 := 5;
      L1 := I3;
      O2 := L1;
      L1 := I2; -- kill I3
      if L1 > 5
      then
         if I1 < 0
         then
            L2 := 8;
         else
            L2 := 7;
         end if;
      end if;
      O1 := L2;
   end Success10;

   -- simple while loop, summing values from 1 to I1
   procedure Success11 (I1 : in Integer; O1 : out Integer)
     --# derives O1 from I1;
   is
      Sum, J : Integer;
   begin
      J := 1;
      Sum := 0;
      while J <= I1 loop
         Sum := Sum + J;
         J := J + 1;
      end loop;

      O1 := Sum;
   end Success11;

   -- simple while loop with if in body,
   --   summing values from 1 to I1 but bounded by I2
   procedure Success12 (I1, I2 : in Integer; O1 : out Integer)
     --# derives O1 from I1, I2;
   is
      Sum, J : Integer;
   begin
      J := 1;
      Sum := 0;
      while J <= I1 loop
         Sum := Sum + J;
         if Sum > I2 then -- reset Sum if value exceeds I2
            Sum := 0;
         end if;
         J := J + 1;
      end loop;

      O1 := Sum;
   end Success12;

   -- nested while
   procedure Success13 (I1, I2 : in Integer; O1 : out Integer)
     --# derives O1 from I1, I2;
   is
      Sum, J1, J2 : Integer;
   begin
      J1 := 1;
      J2 := 1;
      Sum := 0;
      while J1 <= I1 loop
         while J2 <= I2 loop
            Sum := Sum + J1*J2;
            J2 := J2 + 1;
         end loop;
         J1 := J1 + 1;
      end loop;

      O1 := Sum;
   end Success13;

   -- simple while loop for test (non)-loop-carried dependences
   procedure Success14 (I1 : in Integer; O1 : out Integer)
     --# derives O1 from I1;
   is
      Sum, J, L1, L2 : Integer;
   begin
      J := 1;
      Sum := 0;
      L2 := 0;
      while J <= I1 loop
         Sum := Sum + J; -- Sum has one loop-carried, and one non-carried dep.
         L1 := Sum; -- non-loop carried
         L2 := L1;  -- non-loop carried
         J := J + 1;
      end loop;

      O1 := Sum + L2;
   end Success14;

   -- simple while loop with conditional exit in body
   --   summing values from 1 to I1 but bounded by I2
   procedure Success26 (I1 : in Integer; O1 : out Integer)
   is
      Sum, J : Integer;
   begin
      J := 1;
      Sum := 0;
      while J <= I1 loop
         Sum := Sum + J;
         -- exit when Sum > I2;
         J := J + 1;
      end loop;

      O1 := Sum;
   end Success26;

end Dependence_Test_Suite_02;
