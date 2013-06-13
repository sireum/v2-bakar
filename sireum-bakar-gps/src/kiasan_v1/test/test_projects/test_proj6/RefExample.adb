package body RefExample
         
is
    GlobalArray : Item_List_Type := Item_List_Type'(others => Item_Type'(ID => 0, Value => 0, Value_Length => 0));
    Elements : Integer;
    
    procedure CreateArray(x : in Integer) is
        Temp : Item_List_Type;
    begin
        Temp := Item_List_Type'(others => Item_Type'(ID => 0, Value => 0, Value_Length => 0));             
        Temp(1).ID := 2;
        Temp(1).Value := 3;
        Temp(1).Value_Length := 1;
        
        if x > Temp(0).Value then
            Elements := 0;
        else
            Elements := 1;
        end if;
    end CreateArray;
    
    procedure ChangeArray(A : in out Item_List_Type) is
    begin
        A(1).Value := 2;
    end ChangeArray;
    
    procedure ChangeGlobalArray is
    begin
        GlobalArray(0).Value := 10;
        GlobalArray(0).Value_Length := 2;
        GlobalArray(2).Value := 30;
        GlobalArray(2).Value_Length := 2;
    end ChangeGlobalArray;
    
end RefExample;