package body calc is
    
    OpCounter, Result : Integer := 0;
    
    procedure add (a : in Integer; b : in Integer)
            is
    begin
        Result := a + b;
        OpCounter := OpCounter + 1;
    end Add;
    
    procedure sub (a : in Integer; b : in Integer)
            is
    begin
        Result := a - b;
        OpCounter := OpCounter + 1;
    end Sub;
    
    procedure mul (a : in Integer; b : in Integer)
            is
    begin
        Result := a * b;
        OpCounter := OpCounter + 1;  
    end Mul;
    
    procedure divide (a : in Integer; b : in Integer)
            is
    begin
        Result := a / b;    
        OpCounter := OpCounter + 1;  
    end Divide;
    
end calc;