
package body Type_Conversion is
   procedure Convert(Y : Float; X : out Integer)
   is
   begin
     X := Integer(Y);
   end Convert;
end Type_Conversion;

