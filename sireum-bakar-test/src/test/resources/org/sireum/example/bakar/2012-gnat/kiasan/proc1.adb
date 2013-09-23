package body Proc1 is
   function Dummy return Boolean is begin return True; end Dummy;

   procedure A(X : in Integer; Y : out Integer)
   is begin
      Y := X;
   end A;

   procedure B(Q : out Integer)
   is begin
      A(1, Q);
   end B;
end Proc1;
