package body Paper_Example
is   
   procedure Encrypt(K: in Integer; V: in Integer; R: out Integer) is
   begin
      R := K * V;
   end Encrypt;
   
   procedure Write is
      Result : Integer;
   begin
      Encrypt(Key, SSN, Result);
      Disk := Result;
   end Write;

   procedure Write_E is
      Result : Integer;
   begin
      Encrypt(Key, BankAccount, Result);
      Disk := Result;
   end Write_E;

end Paper_Example;
