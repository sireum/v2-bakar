
package body example is

  procedure add (x : in out Integer; y : in Integer)
  is
    begin
     x := x + y;
  end add;

  procedure foo (A : in out Integer ; B : in out Integer )
  is
  M : Integer;
     begin
    --# assert A >= 3;
    if(A >= 3) then
       M := 3;
       add(A,M);
       add(B,5);
       A := A + 2;
       B := B + 5;
     end if;
  end foo;
end example;
