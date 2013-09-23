package body Globals is
    K : Integer;
    L : Integer;
    M : Integer;
    N : Integer;
    O : Integer;
    P : Integer;
    Q : Integer;
    
    function dummy return Boolean is begin return True; end dummy;
        
    procedure ReadGlobal(I : Integer; R : out Integer)
      with global => (Input => ((L, M)),
                      Output => (((N))),
                      In_Out => (O, (P), Q)) 
    is 
    begin
      R := I;
      N := R + K;
    end ReadGlobal;
    
end Globals;