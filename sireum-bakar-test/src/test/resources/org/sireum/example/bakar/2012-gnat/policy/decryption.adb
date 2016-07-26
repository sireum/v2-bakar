package body Decryption
is   
   -- example from paper: 
   -- Dependency-Based Information Flow Analysis with Declassification in a Program Logic,
   -- by Bart van Delft and Richard Bube
   procedure Decrypt is
      descryptKey : Integer;
      cipher: Integer;
      msg: Integer;
      paddingOk: Boolean;
      checkSum: Integer;
      result: Integer;
   begin
      cipher := SSN; -- BankAccount; -- "secret" information to be decrypted
      -- defect if BankAccount is assigned to ciper, as BankAccount is TopSecret
      -- cipher := BankAccount;
      descryptKey := Key; -- "secret" key used for decryption
      msg := cipher * descryptKey;
      Padding(msg, paddingOk);
      if (paddingOk) then
	  CheckSumX(msg, checkSum);
          if (checkSum /= -1) then
	     result := 0;
	     -- defect in the following case
	     -- result := Key;
          else
              result := -1;
          end if;
      else
          result := -1;
      end if;
      Display := result; -- Display is accessible to the "public"
   end Decrypt;
   
   procedure Padding(V: in Integer; R: out Boolean) is 
     begin
         R := (V mod 256 = 0);
     end Padding;

   procedure CheckSumX(V: in Integer; R: out Integer) is 
     begin
         R := (V / 256) mod 256;
     end CheckSumX;
end Decryption;

