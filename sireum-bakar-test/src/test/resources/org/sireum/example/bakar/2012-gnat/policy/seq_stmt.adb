package body Seq_Stmt
is   
   procedure Seq_Test is
      X : Integer;
   begin
      X := high;
      X := low1;
      low2 := X;
   end Seq_Test;

end Seq_Stmt;
