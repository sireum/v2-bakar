
package body SimpleMath1
--@ invariant B >= 0 and then
--@           B <= Integer'Last;
--@ invariant B >= 5;     
is
  B : Integer := 0;
  procedure Inc(I: in out Integer) is
  begin
    I := I+B;
  end Inc;
end SimpleMath1;
