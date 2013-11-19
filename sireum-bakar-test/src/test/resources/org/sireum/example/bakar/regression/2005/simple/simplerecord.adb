package body SimpleRecord is

   subtype SmallInt is Integer range -10 .. 10;

   type Vector is array (SmallInt) of SmallInt;
      
   type Rec is record
      A : SmallInt;
      B : Vector;
   end record;

   type NestedRec is record
     X : Rec;
   end record;
    
   function Dummy return Boolean is begin return True; end Dummy;

   procedure Add(I : SmallInt; R : in out Rec) is
   begin
      R.A := R.A + I;
   end  Add;
    
   procedure NAdd(I : SmallInt; NR : in out NestedRec) is
   begin
     NR.X.A := NR.X.A + I;
   end NAdd;
    
   procedure AAdd(I : SmallInt; R : in out Rec) is
   begin
     R.B(I) := I + 1;
   end AAdd;
  
   
end SimpleRecord;
