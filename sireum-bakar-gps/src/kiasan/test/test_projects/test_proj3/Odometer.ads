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
    type Mark_Array_Type is array (Mark_Array_Index_Type) of Natural;

    function Invariant return Boolean; -- All marked trip values are in strictly increasing order.
    --# global in Num_Mark, Mark;
    --# return M => (((for all Ind in Mark_Array_Size_Type range 1 .. Num_Mark-1 => (Mark(Ind) < Mark(Ind+1))) -> M = true) and
    --#             ((for some Ind in Mark_Array_Size_Type range 1 .. Num_Mark-1 => (Mark(Ind) >= Mark(Ind+1))) -> M = false));

    procedure Zero_Trip; -- sets Trip to 0 and clears all saved Trip marks.
    --# global out Trip, Num_Mark;
    --# derives Trip from & Num_Mark from;
    --# post Trip = 0 and Num_Mark = 0;

    function Read_Trip return Natural; -- returns value of Trip.
    --# global in Trip;
    --# return Trip;

    function Read_Total return Natural; -- returns value of Total
    --# global in Total;
    --# return Total;

    procedure Inc; -- increments each of Trip and Total by 1.
    --# global in out Trip, Total;
    --# derives Trip from Trip & Total from Total;
    --# pre Trip < Integer'Last and Total < Integer'Last;
    --# post Trip = Trip~ + 1 and Total = Total~ + 1;

    procedure Set_Mark;
    -- requires that the current value of Trip have not already be saved as a mark.
    -- saves the current trip value as a new mark.
    --# global in out Mark, Num_Mark;
    --# in Trip;
    --# derives Num_Mark from Num_Mark & Mark from Num_Mark, Trip, Mark;
    --# pre Num_Mark < Max_Num_Mark and Mark(Num_Mark) < Trip and
    --#     Invariant(Num_Mark, Mark);
    --# post Num_Mark = Num_Mark~ + 1 and Mark(Num_Mark) = Trip and
    --#         (for all Ind in Mark_Array_Size_Type range Mark'First .. Num_Mark-1 => (Mark(Ind) = Mark~(Ind))) and
    --#         Invariant(Num_Mark, Mark);

    procedure Factory_Reset;
    --# global out Total, Mark, Num_Mark, Trip;
    --# derives Trip from & Num_Mark from & Total from & Mark from;
    --# post Trip = 0 and Num_Mark = 0 and Total = 0 and
    --#         (for all Ind in Mark_Array_Size_Type range Mark'First .. Mark'Last => (Mark(Ind) = 0));

end Odometer;
        