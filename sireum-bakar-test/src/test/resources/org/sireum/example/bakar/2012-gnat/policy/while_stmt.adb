package body While_Stmt
is
   procedure Encrypt(K: in Integer; V: in Integer; R: out Integer) is
   begin
      R := K * V;
   end Encrypt;
   
   procedure While_Test (U, V : in Integer; W : out Integer) is
      X : Integer;
      Y : Integer;
      Z : Integer;
      I : Integer;      
   begin
      X := U;
      Y := V;
      I := 0;
      
      while i < 10 loop
         Z := X;
	 X := high + Y;
	 Y := X + top;
	 I := I + 1;
      end loop;
      W := Z;
      
   end While_Test;

end While_Stmt;
