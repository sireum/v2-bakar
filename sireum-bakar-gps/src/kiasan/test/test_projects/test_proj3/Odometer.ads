package Odometer
    --# own
    --# Trip,        -- number of miles so far on this trip (can be reset to 0).
    --# Total        -- total mileage of vehicle since the last factory-reset.
    --#   : Natural; -- has range 0 .. Integer'Last.
    --# Mark : Mark_Array_Type; -- array of Trip values saved at user's request.
    --# Num_Mark : Mark_Array_Size_Type; -- number of saved Trip values.
    is
    Max_Num_Mark : constant := 3;
    subtype Mark_Array_Size_Type is Natural range 0 .. Max_Num_Mark;
    subtype Mark_Array_Index_Type is 
        Mark_Array_Size_Type range 1 .. Mark_Array_Size_Type'Last;
    type Mark_Array_Type is array (Mark_Array_Index_Type) of Integer;
    
    
    function Invariant return Boolean;
    -- All marked trip values are in strictly increasing order.
    
    procedure Zero_Trip; -- sets Trip to 0 and clears all saved Trip marks.
    
    function Read_Trip return Natural; -- returns value of Trip.
    --# global in Trip;
    --# return Trip;
    
    function Read_Total return Natural; -- returns value of Total
    --# global in Total;
    --# return Total;
    
    procedure Inc; -- increments each of Trip and Total by 1.
    --# global in out Trip, Total;
    --# derives Trip from Trip & Total from Total;
    --# post Trip = Trip~ + 1 and
    --#      Total = Total~ + 1;
    
    procedure Set_Mark;
    -- requires that the current value of Trip have not already be saved as a mark.
    -- saves the current trip value as a new mark.
    
    procedure Factory_Reset;
    
end Odometer;