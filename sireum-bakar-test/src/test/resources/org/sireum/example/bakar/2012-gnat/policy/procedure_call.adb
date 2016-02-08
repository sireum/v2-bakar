package body Procedure_Call
is   
   procedure Encrypt(K: in Integer; V: in Integer; R: out Integer) is
   begin
      R := K * V;
   end Encrypt;
   
   procedure Polymorphic_Write(X: in Integer; Y: out Integer) is
   begin
      Y := X;
   end Polymorphic_Write;
   
   procedure Encrypt_Wrapper(K: in Integer; V: in Integer; R: out Integer) is
   begin
      Encrypt(K, V, R);
   end Encrypt_Wrapper;
   
   procedure Call_Test is
      Result : Integer;
   begin
      Encrypt_Wrapper(Key, SSN, Result);
      Polymorphic_Write(Result, Disk);
   end Call_Test;

   procedure Call_Test_Error is
      Result : Integer;
   begin
      Encrypt_Wrapper(Key, BankAccount, Result);
      Polymorphic_Write(Result, Disk);
   end Call_Test_Error;

end Procedure_Call;
