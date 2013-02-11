package SimpleMath1 
--# own B;
--# initializes B;
--@ invariant B >= Integer'First + 1;
is
  procedure Inc(I: in out Integer);
  --# global in B;
  --# derives I from I, B;
  --# pre I < Integer'Last;
  --# post I = I~ + 1;
end SimpleMath1;
