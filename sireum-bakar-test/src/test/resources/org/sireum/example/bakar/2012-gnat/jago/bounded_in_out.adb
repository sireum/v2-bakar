procedure Bounded_In_Out (V : in out Integer) is
   subtype T1 is Integer range 0 .. 10;
   subtype T2 is Integer range 5 .. 15;
   
   procedure Decrease (X: in out T1) is
   begin
      X := X - 1;
   end Decrease; 
   
   procedure Call_Decrease (X: in out T2) is
   begin
      Decrease(X);
   end Call_Decrease;    

begin
   Call_Decrease(V);
end Bounded_In_Out;
