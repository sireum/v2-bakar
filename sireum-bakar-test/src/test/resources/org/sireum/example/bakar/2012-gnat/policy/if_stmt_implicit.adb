package body If_Stmt_Implicit
is
   procedure Filter_And_Clean(X: in Integer; Y: out Integer) is
   -- Declassifier,
   -- Domain => (X => TopSecret, Y => Public);      
   begin
      Y := X - 1;
   end Filter_And_Clean;
   
   procedure Implicit_Flow (X : in Integer; Y : out Integer) is
   begin
      if X > high then
         -- Filter_And_Clean(top, high); -- secure implicit flow
	 Filter_And_Clean(top, low); -- implicit flow from high to low, which violate security policy
	 Y := low;
      else
	 Y := X;
      end if;

   end Implicit_Flow;

end If_Stmt_Implicit;
