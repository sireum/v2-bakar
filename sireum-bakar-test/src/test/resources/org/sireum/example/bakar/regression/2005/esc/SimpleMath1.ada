package SimpleMath1 is
   procedure Inc(I: in out Integer);
     --# derives I from I;
     --# pre I < Integer'Last;
     --# post I = I~ + 1;
end SimpleMath1;

package body SimpleMath1 is
   procedure Inc(I: in out Integer) is
   begin
      I := I+1;
   end Inc;
end SimpleMath1;
