package body Recursive_Proc_Pkg 
is
   procedure increasebyone(X: in out Integer) is
   begin
      X := X + 1;
      addup(X);
   end increasebyone;   
   
   procedure addup (X: in out Integer) is 
      Y: Integer;
   begin 
      if X > 0 then
	 Y := X - 1;
	 addup(Y);
	 X := X + Y; 
      end if;
   end addup;
end Recursive_Proc_Pkg;
