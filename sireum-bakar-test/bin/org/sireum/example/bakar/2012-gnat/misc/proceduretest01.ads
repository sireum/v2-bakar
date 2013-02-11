package ProcedureTest01 is

  procedure P(a: in Integer; b: in out Integer; c: out Integer);
  --# derives c from a, b &
  --#         b from a, b;

  procedure helper(x: in out Integer; y: out Integer);
  --# derives x from *, x &
  --#         y from x;

  procedure Q(S: in Integer; T: out Integer; R: out Integer);
  --# derives T from S &
  --#         R from ;

end ProcedureTest01;
