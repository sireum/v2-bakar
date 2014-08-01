procedure Binary_Search (I : Integer) is
   
   type T is range 0 .. 10;
   subtype U is T range 1 .. 10;
   
   type Ar is array (U) of Integer;
   
   A: Ar;
   R: T;
   
   -- added by Zhi
   type T1 is new Integer range 1 .. 10;
   type T2 is new T range 2 .. 5;
   subtype T3 is Integer range 1 .. 10;
   subtype T4 is Integer range 5 .. 10;
   type RT is record
      X: Integer;
      Y: Integer;
   end record;
   
   procedure increase (X: Integer; Y: out Integer) is
   begin
      Y := X + 1;
   end increase; 
   B: Boolean := True;
   --
   
   procedure Search (A : Ar; I : Integer; R: out T) is
      Left  : U;
      Right : U;
      Med   : U;
   begin
      Left  := 0;
      Right := 10;
   
      R := 0;
      if A (Left+1) > I or A (Right) < I then
	 R := 0;
      end if;

      while Left <= Right loop
	 Med := Left + (Right - Left) / 2;
	 if A (Med) < I then
	    Left := Med + 1;
	 else
	    if A (Med) > I then
	       Right := Med - 1;
	    else
	       R := Med;
	    end if;
	 end if;
      end loop;
   end Search;   


   X1: T1 := 2;
   X2: T2 := 3;
   X3: T3 := 4;
   X4: T4 := 6;
begin
   -- added by Zhi
   increase(10, X4);
   X1 := X1 + 1;
   X2 := X2 + 2;
   X4 := X3 + X4;
   --
   A(0) := 0;
   A(1) := 10;
   Search(A, I, R);
end Binary_Search;
