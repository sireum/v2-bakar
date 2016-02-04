package body If_Stmt
is
   procedure Test (X : in Integer; Y : out Integer) is
      T : Integer;
      M : Integer;
      N : Integer;
   begin
      T := 1;
      M := Disk + T;
      N := Disk * Disk;

      if M < N then
         Y := X + 1;
      else
	 Y := X;
      end if;

   end Test;

end If_Stmt;
