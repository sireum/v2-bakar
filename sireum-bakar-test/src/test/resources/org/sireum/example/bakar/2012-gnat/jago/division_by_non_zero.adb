procedure Division_By_Non_Zero (X : in out Integer) is
   subtype T1 is Integer range 0 .. 10;
   
   procedure Divide (X: in Integer; Y: in T1; Z: out Integer) is
   begin
      Z := X / (Y + 1);
   end Divide; 
   
   Result: Integer;
begin
   Divide(X, 8, Result);
end Division_By_Non_Zero;
