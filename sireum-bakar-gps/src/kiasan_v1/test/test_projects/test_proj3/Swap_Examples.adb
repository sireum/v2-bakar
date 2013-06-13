package body Swap_Examples is
    
    procedure Swap(X, Y : in out Integer)
            is
        T : Integer;
    begin
        T := X; X := Y; Y := T;
    end Swap;
    
end Swap_Examples;