package body SimpleRecord is
      
   type Rec is record
      A : Integer;
      B : Integer;
   end record;
   
   RG : Rec;
   
   function Dummy return Boolean is begin return True; end Dummy;

   procedure Add(R : in out Rec) is
   begin
      R.A := R.A + 1;
   end  Add;
   
   procedure Del is
     T : Integer;
   begin
     T := RG.A;
     RG.A := RG.B - RG.A - 7;
   end Del;
   
end SimpleRecord;
