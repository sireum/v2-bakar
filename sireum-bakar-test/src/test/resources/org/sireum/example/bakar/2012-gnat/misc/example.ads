package Example is
    procedure add ( x : in out Integer; y : in Integer );
    --# derives x from x,y;

    procedure foo ( A : in out Integer; B : in out Integer );
end example;
