package body While_Stmt_Leak
is
   -- from paper: A theorem proving approach to analysis of secure information flow
   -- if we observe low = 0 at output, all we can say about input high is 
   -- high >= 0; with output observation low != 0, we can deduce high = 0;
   procedure While_Leak is
   begin      
      while high > 0 loop
         high := high - 1;
	 low := high;
      end loop;      
   end While_Leak;

end While_Stmt_Leak;
