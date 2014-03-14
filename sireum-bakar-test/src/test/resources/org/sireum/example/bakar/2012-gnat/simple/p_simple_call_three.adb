package body p_simple_call_three
is
   G: Integer;
   H: Integer;
   X: Integer;
   Y: Integer;
   Z: Integer;
        
    procedure R0(A: in Integer; B: out Integer)
            is
    begin
        B := Y;
        X := H;
        Y := G;
        Z := A;
    end R0;
   
   procedure R1(Q: in Integer; R: in out Integer)
   is
   begin
      R := Y + R;
      G := H + Q;
      Z := Q;
   end R1;
        
   procedure Q1(A: in Integer; B: in out Integer; C: out Integer)
   is
   begin
      C := X + Y;
      R1(A,B);
      C := C + H + B;
   end Q1;
    
   function Dummy return Boolean is begin return True; end Dummy;
        
begin
   G:= 0;
   H:= 0;
   X := 1;
   Y := 0;
   Z := 0;

end p_simple_call_three;
