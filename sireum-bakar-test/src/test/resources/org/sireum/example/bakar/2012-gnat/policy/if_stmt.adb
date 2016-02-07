package body If_Stmt
is
   procedure Encrypt(K: in Integer; V: in Integer; R: out Integer) is
   begin
      R := K * V;
   end Encrypt;
   
   procedure Test (X : in Integer; Y : out Integer) is
      T : Integer;
      M : Integer := 2;
      N : Integer;
   begin
      T := 1;
      M := Disk + T;
      -- N := Disk * Disk;
      -- N := Disk * SSN;
      Encrypt(Key, SSN, N);
      
      if M < N then
         Y := X + 1;
      else
	 Disk := X;
      end if;

   end Test;

end If_Stmt;
