package body call_test
        is
    
    procedure R0(A: in Integer; B: out Integer)
            is
    begin
        B := A;
    end R0;
    
    procedure R1(Q: in Integer; R: in out Integer)
            is
    begin
        R0(Q,R);
    end R1;
    
    function Dummy return Boolean is begin return True; end Dummy;
    
end call_test;
