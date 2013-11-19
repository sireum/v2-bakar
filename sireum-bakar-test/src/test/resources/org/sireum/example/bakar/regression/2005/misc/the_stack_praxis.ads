package The_Stack_Praxis
  --# own State;   -- abstract variable
  --# initializes State;
is
   procedure Push(X : in Integer);
   --# global in out State;
   --# derives State from State, X;

   procedure Pop(X : out Integer);
   --# global in out State;
   --# derives State, X from State;
end The_Stack_Praxis;
