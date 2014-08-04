package Array_Record_Package
is
   type RecordT is record
      X: Integer;
   end record;

   subtype I is Integer range 0 .. 5;
   type ArrayT is array (I) of Integer;

   procedure Increase(X: Integer; Y: out Integer);

   procedure Test (N : Integer; M: out Integer);

end Array_Record_Package;
