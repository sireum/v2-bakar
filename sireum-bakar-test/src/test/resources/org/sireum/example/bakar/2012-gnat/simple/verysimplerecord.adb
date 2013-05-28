package body SimpleRecord is
      
   type Rec is record
      A : Integer;
      B : Integer;
   end record;
    
   function Dummy return Boolean is begin return True; end Dummy;

   procedure Add(R : in out Rec) is
   begin
      R.A := R.A + 1;
   end  Add;
   
end SimpleRecord;
