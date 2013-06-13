package RefExample
    --# own Elements : Integer;
    --# GlobalArray : Item_List_Type;
    --# initializes GlobalArray;
is
    Max_Items : constant := 3;
    
    type Item_Type is record
        ID           : Integer;
        Value        : Integer;
        Value_Length : Natural;
    end record;
    
    subtype Item_List_Index_Type is Natural range 0 .. Max_Items - 1;
    
    type Item_List_Type is array (Item_List_Index_Type) of Item_Type;    
    
    procedure CreateArray(x : in Integer);
    --# global out Elements;
    --# derives Elements from x;
    
    procedure ChangeArray(A : in out Item_List_Type);
    
    procedure ChangeGlobalArray;
    --# global in out GlobalArray;
    --# derives GlobalArray from GlobalArray;
end RefExample;