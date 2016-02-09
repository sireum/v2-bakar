package Procedure_Call3
is

   Key: Integer := 0;
   SSN: Integer := 0;
   BankAccount: Integer := 0;
   Disk: Integer := 0;
   
   procedure Declassifier_TopSecret_Secret(X: in Integer; Y: out Integer);
   
   procedure Declassifier_Secret_Public(X: in Integer; Y: out Integer);
   
   procedure Declassifier_TopSecret_Public(X: in Integer; Y: out Integer);
   
   procedure Call_Test3a;
   
   procedure Call_Test3b;
   
   procedure Call_Test3c;

end Procedure_Call3;
