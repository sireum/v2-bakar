package body Odometer is
    Trip : Natural;
    Total : Natural;
    Num_Mark : Mark_Array_Size_Type;
    Mark : Mark_Array_Type;
    
    procedure Zero_Trip is
    begin
        Trip := 0;
        Num_Mark := 0;
    end Zero_Trip;
    
    function Read_Trip return Natural is
    begin
        return Trip;
    end Read_Trip;
    
    function Read_Total return Natural is
    begin
        return Total;
    end Read_Total;
    
    procedure Inc is
    begin
        Trip := Trip + 1;
        Total := Total + 1;
    end Inc;
    
    function Invariant return Boolean is
        Result : Boolean := True;
    begin
        for I in Mark_Array_Size_Type range 1 .. Num_Mark - 1 loop
            if Mark(I) >= Mark(I+1) then
                Result := False;
                exit;
            end if;
        end loop;
        return Result;
    end Invariant;
    
    procedure Set_Mark is
    begin
        Num_Mark := Num_Mark + 1;
        Mark(Num_Mark) := Trip;
    end Set_Mark;
    
    procedure Factory_Reset is
    begin
        Zero_Trip;
        --disable# assert Invariant(Num_Mark, Mark);
        Total := 0;
        Mark := Mark_Array_Type'(others => 0);
    end Factory_Reset;
    
end Odometer;