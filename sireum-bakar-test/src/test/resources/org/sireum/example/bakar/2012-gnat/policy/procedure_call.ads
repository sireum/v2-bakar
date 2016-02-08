package Procedure_Call
is

   Key: Integer := 0;
   SSN: Integer := 0;
   BankAccount: Integer := 0;
   Disk: Integer := 0;
   
   procedure Encrypt(K: in Integer; V: in Integer; R: out Integer);
   
   procedure Polymorphic_Write(X: in Integer; Y: out Integer);
   
   procedure Encrypt_Wrapper(K: in Integer; V: in Integer; R: out Integer);   
   
   procedure Call_Test;   

end Procedure_Call;
