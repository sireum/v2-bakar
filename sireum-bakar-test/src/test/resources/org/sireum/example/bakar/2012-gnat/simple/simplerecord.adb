package body SimpleRecord is
   type Rec is record
      A : Integer;
      B : Integer;
   end record;

   type NestedRec is record
     X : Rec;
   end record;
    
   function Dummy return Boolean is begin return True; end Dummy;

   procedure Add(I : Integer; R : in out Rec) is
   begin
      R.B := R.A + I;
   end  Add;
    
   procedure NAdd(NR : in out NestedRec) is
   begin
     NR.X.A := NR.X.B + 7;
   end NAdd;
    
end SimpleRecord;
