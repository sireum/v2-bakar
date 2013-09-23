package body Proc2 is
   function Dummy return Boolean is begin return True; end Dummy;

   procedure A(X : out Integer; Y : in Integer; Z : in out Integer)
   is begin
      X := Z + Y;
      Z := 3;
   end A;

   procedure B(M : in out Integer; N : out Integer)
   is begin
      A(N, 3, M);
   end B;
end Proc2;
