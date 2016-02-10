package Password_Check_System
is
   Key: Integer := 123;
   Password: Integer := 12345678;
   
   Display: String := "Empty";
   
   procedure PasswordMatch(UserInput: in Integer; Result: out Boolean);
   
   procedure PasswordChecking (InputValue : in Integer; OutputValue : out String);
   
   procedure CheckingSystem;
   
end Password_Check_System;
