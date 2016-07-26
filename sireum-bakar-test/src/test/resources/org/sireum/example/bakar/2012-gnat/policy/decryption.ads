package Decryption
is   
  SSN: Integer;
  BankAccount: Integer;
  Key: Integer;
  Display: Integer;
  
  procedure Decrypt;
  procedure Padding(V: in Integer; R: out Boolean);
  procedure CheckSumX(V: in Integer; R: out Integer);

end Decryption;
