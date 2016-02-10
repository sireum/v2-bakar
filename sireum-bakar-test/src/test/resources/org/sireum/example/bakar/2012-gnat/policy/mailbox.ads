package MailBox
is
   IN_0_RDY : Boolean := True;
   OUT_1_RDY : Boolean := False;
   IN_0_DAT : Integer := 0;
   OUT_1_DAT : Integer := 0;
	 
   procedure Scrub(V: in Integer; R: out Integer);
   
   procedure Encrypt1(V: in Integer; R: out Integer);
   
   procedure Machine_Step;

end MailBox;
