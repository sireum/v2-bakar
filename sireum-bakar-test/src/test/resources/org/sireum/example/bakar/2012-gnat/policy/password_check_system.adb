package body Password_Check_System
is
   procedure PasswordMatch(UserInput: in Integer; Result: out Boolean) is
   -- Declassifier,
   -- Domain => (UserInput => Secret, Result => Public);      
   begin
      Result := (UserInput = Password);
   end PasswordMatch;
   
   procedure PasswordChecking (InputValue : in Integer; OutputValue : out String) is
      Matched: Boolean;
   begin
      PasswordMatch(InputValue, Matched);
      if Matched then
         OutputValue := "Logic Success !";
      else
	 OutputValue := "Failed, Try Again !";
      end if;

   end PasswordChecking;
   
   procedure CheckingSystem is 
   begin
      PasswordChecking(Key, Display);
   end CheckingSystem;

end Password_Check_System;
