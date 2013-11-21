package body Array_Two_Dim is
   procedure dummy(X : in Index; Y: in Index) is
   begin
      Box(X, Y) := Box(X, Y) - 1;
   end dummy;

  procedure dummy2(M: in Board_Index; N: in Board_Index) is
  begin
    aBoard(M)(N) := aBoard(M)(N) - 1;
  end dummy2;
  
begin 
   Box := Square'(-- RangeChoice
                  1..constThree => (Index => 0, others => 1),

                  -- SubTypeChoice
                  Index range constThree + 1 .. 5 => (1..3 => 1, others => 2), 

                  -- SubTypeChoice (though parser will see this as an ExpChoice                  
                  subIndexRange => (others => 3),
                  
                  -- ExpChoice
                  10 - 2 + 1 => (others => 5),
                  
                  -- default
                  others => (others => 3));
end Array_Two_Dim;