
package body Modulus is

  procedure Mod_Test (R : in U64; I : Injection_Range; KS: in out U64_Seq_9)
  is
    begin
       KS (I) := KS ((R + I) mod (8 + 1));
  end Mod_Test;
end Modulus;
