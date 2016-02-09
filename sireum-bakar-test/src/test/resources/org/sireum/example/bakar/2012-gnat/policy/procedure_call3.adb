package body Procedure_Call3
is   
   procedure Declassifier_TopSecret_Secret(X: in Integer; Y: out Integer) is
   begin
      Y := X;
   end Declassifier_TopSecret_Secret;   
   
   procedure Declassifier_Secret_Public(X: in Integer; Y: out Integer) is
   begin
      Y := X;
   end Declassifier_Secret_Public;
   
   procedure Declassifier_TopSecret_Public(X: in Integer; Y: out Integer) is
      T: Integer;
   begin
      Declassifier_TopSecret_Secret(X, T);
      Declassifier_Secret_Public(T, Y);
   end Declassifier_TopSecret_Public;   
   
   procedure Call_Test3a is
   begin
      Declassifier_TopSecret_Public(BankAccount, Disk);
   end Call_Test3a;

   procedure Call_Test3b is
   begin
      Declassifier_Secret_Public(BankAccount, Disk);
   end Call_Test3b;
   
   procedure Call_Test3c is
   begin
      Declassifier_TopSecret_Secret(BankAccount, Disk);
   end Call_Test3c;   

end Procedure_Call3;
