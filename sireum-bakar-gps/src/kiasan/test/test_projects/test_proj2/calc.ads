package calc
    --# own OpCounter, Result : Integer;
    --# initializes OpCounter, Result;
    is
    
    procedure add ( a : in Integer; b : in Integer );
    --# global in out OpCounter; out Result;
    --# derives OpCounter from OpCounter & Result from a, b;
    --# post OpCounter = OpCounter~ + 1;
    
    procedure sub ( a : in Integer; b : in Integer );    
    --# global in out OpCounter; out Result;
    --# derives OpCounter from OpCounter & Result from a, b;
    --# post OpCounter = OpCounter~ + 1;
    
    procedure mul ( a : in Integer; b : in Integer );
    --# global in out OpCounter; out Result;
    --# derives OpCounter from OpCounter & Result from a, b;
    --# post OpCounter = OpCounter~ + 1;
    
    procedure divide ( a : in Integer; b : in Integer );
    --# global in out OpCounter; out Result;
    --# derives OpCounter from OpCounter & Result from a, b;
    --# post OpCounter = OpCounter~ + 1;
    
end calc;