package body MailBox
is   
   procedure Scrub(V: in Integer; R: out Integer) is
   begin
      R := V - 10;
   end Scrub;
   
   procedure Encrypt1(V: in Integer; R: out Integer) is
   begin
      R := V * V;
   end Encrypt1;

   procedure Machine_Step is
      T1 : Integer;
      T2 : Integer;
   begin
      if IN_0_RDY and not OUT_1_RDY then
	 Scrub(IN_0_DAT, T1);
	 Encrypt1(T1, T2);
	 OUT_1_DAT := T2;
	 IN_0_RDY := False;
	 OUT_1_RDY := True;
      end if;
   end Machine_Step;

end MailBox;
