package multicall is
    
    procedure repository ( x : in Integer; result : out Integer);

    procedure logic ( x : in Integer; result : out Integer);
        
    procedure service_logic ( x : in Integer; result : out Integer);
    
    procedure service ( x : in Integer; result : out Integer);
    
    procedure main ( x : in Integer; result : out Integer);
    
end multicall;