
package body P_Complex
  --# own AbsD is P2.D &
  --#     AbsAbsQ is P2.AbsQ;
is

   B: Integer;

   --# inherit P_Complex;
   package P2
     --# own D, AbsQ;
     --# initializes D, AbsQ;
   is
      procedure R(X: out Integer);
      --# global in P_Complex.Y, P_Complex.B, P_Complex.C, D, AbsQ;
      --# derives X from P_Complex.Y, P_Complex.B, P_Complex.C, D, AbsQ;
   end P2;

   package body P2
     --# own AbsQ is P3.Q;
   is
     D: Integer;

     --# inherit P_Complex, P2;
     package P3
       --# own Q;
       --# initializes Q;
     is
        Q: Integer;
        procedure Q2(X: in Integer; Y: out Integer; Z: out Integer);
        --# global in P_Complex.Y, P_Complex.C, P2.D;
        --# derives Y from X &
        --#         Z from P_Complex.Y, P_Complex.C, P2.D;
     end P3;

     package body P3 is

        procedure Q2(X: in Integer; Y: out Integer; Z: out Integer) is
        begin
           Y := X;
           Z := (P_Complex.Y + P_Complex.C) + P2.D;
        end Q2;

     begin
        Q := 3;
     end P3;

     procedure R(X: out Integer)
       --# global in P_Complex.Y, P_Complex.B, P_Complex.C, D, P3.Q;
       --# derives X from P_Complex.Y, P_Complex.B, P_Complex.C, D, P3.Q;
     is
     begin
        X := (((P_Complex.Y + P_Complex.B) + P_Complex.C) + D) + P3.Q;
     end R;

  begin
     D := 0;
  end P2;

  procedure Q(X: in Integer; Z: out Integer)
  is
  begin
     Z := X + B;
  end Q;

begin
   Y := 1;
   B := 0;
   C := 0;
end P_Complex;
