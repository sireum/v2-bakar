package body multicall is
    
    procedure repository (x : in Integer; result : out Integer)
            is
        temp_repo : Integer;
    begin
        temp_repo := x * 2;
        result := temp_repo + 9;
    end repository;   
    
    procedure service_logic (x : in Integer; result : out Integer)
            is
        temp_service_logic : Integer;
    begin
        temp_service_logic := x + 2;
        repository(temp_service_logic,result);
    end service_logic;
    
    procedure service (x : in Integer; result : out Integer)
            is
        temp_service : Integer;
    begin
        temp_service := x + 1;
        service_logic(temp_service,result);
    end service;
    
    procedure logic (x : in Integer; result : out Integer)
            is
    begin
        service(x,result);
    end logic;
    
    procedure main (x : in Integer; result : out Integer)
            is
    begin
        logic(x,result);
    end main;    
        
end multicall;
