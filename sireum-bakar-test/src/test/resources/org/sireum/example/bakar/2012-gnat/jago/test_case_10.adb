    procedure Test_Case_10 (I1, I2, I3 : in Integer; O1, O2 : out Integer)
    is
        L1, L2 : Integer;
    begin
        L2 := 5;
        L1 := I3;
        O2 := L1;
        L1 := I2; -- kill I3
        L1 := I1 + I2;
        if L1 > 5
        then
            if I1 < 0
            then
                L2 := 8;
            end if;
        end if;	
	
        O1 := L2; 	
    end Test_Case_10;
