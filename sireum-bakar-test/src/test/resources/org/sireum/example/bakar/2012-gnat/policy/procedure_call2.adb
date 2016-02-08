package body Procedure_Call2
is   
   procedure Filter_And_Clean(X: in Integer; Y: out Integer) is
   begin
      Y := X;
   end Filter_And_Clean;

   procedure Call_Test2 is
   begin
      Filter_And_Clean(SSN, Disk);
      Filter_And_Clean(BankAccount, Disk);
   end Call_Test2;

end Procedure_Call2;
