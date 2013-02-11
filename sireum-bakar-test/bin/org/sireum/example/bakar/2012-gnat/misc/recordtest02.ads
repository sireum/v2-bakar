package RecordTest02 is

type Object is
      record
         X, Y : Float;
      end record;

-- type NestedObject is
--      record
--         O : Object;
--      end record;


procedure Test01(Q : in out Object);
   --# derives Q from Q ;

procedure Test02(I1, I2 : in Float; O1, O2 : out Float);
 --# derives O1 from I1
 --#       & O2 from I2;

end RecordTest02;
