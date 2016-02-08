package body Seq_Stmt
is   
   procedure Test is
      X : Integer;
   begin
      X := high;
      X := low1;
      low2 := X;
   end Test;

end Seq_Stmt;
