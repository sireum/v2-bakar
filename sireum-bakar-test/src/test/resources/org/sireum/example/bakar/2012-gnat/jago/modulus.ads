package Modulus is
   
   subtype U64 is Integer range 0 .. 2147483647;
   subtype Injection_Range is U64 range 0 .. 7;
   subtype I9   is U64 range 0 .. 8;
   
   type U64_Seq_9  is array (I9) of U64;
   
   procedure Mod_Test (R : in U64; I : Injection_Range; KS: in out U64_Seq_9);
   
end Modulus;
