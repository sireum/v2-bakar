package body Array_Dim_Fun is
  procedure dummy(A : in out Matrix; X,Y,Z : Index)
  is
    Q : Matrix;
    -- P : thirdDim;
  begin
    Q := A;

    -- Note: this (or something like it) is disallowed in Ada.  You can only
    --       select individual elements of a multi-dim array whereas you can
    --       select an entire one-dim array from an array of arrays (see below)
    -- P := Q(X,Y);

    A(X,Y,Z) := Q(Z, Y, X);
  end dummy;
  
  procedure dummy2(A : in out rank3; X,Y,Z : Index)
  is
    M : rank2;
    N : rank1;
  begin
    M := A(X);
    N := M(Y);
    A(X)(Y)(Z) := N(Z);
  end dummy2;

  procedure dummy3(A : in out mix2; X,Y,Z : Index)
  is
    Q : mix1;
  begin
    Q := A(X);
    A(X)(Y,Z) := Q(Y,Z);
  end dummy3;
end Array_Dim_Fun;