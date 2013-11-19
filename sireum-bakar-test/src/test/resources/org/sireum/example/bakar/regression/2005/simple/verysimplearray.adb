package body VerySimpleArray is

   subtype MyInt is Integer range 10  .. 20;
   subtype Index is Integer range 1 .. 5;
   type Vector is array (Index) of MyInt;

   V : Vector;

   function Dummy return Boolean is begin return True; end Dummy;

   procedure Add(X : in out Vector) is
   begin
      X(1) := X(2);
   end  Add;

   procedure Del is
     T : Integer;
   begin
     T := V(1);
     V(2) := T + V(3);
   end Del;

end VerySimpleArray;
