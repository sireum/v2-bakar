
package body QuantifierTest
is

  procedure dummy(I: in Index) is
  begin
    --# assert for some J in Index range 1..2 => (V(J) > 0 and V(J) < 7);
    V(I) := V(I) + 3;
    --# assert 3=3 and then (for all J in Index => (V(J) > 0 or V(J) < 7)); 
  end dummy;
  
begin
  V := Vector'(others=>0);
end QuantifierTest;
