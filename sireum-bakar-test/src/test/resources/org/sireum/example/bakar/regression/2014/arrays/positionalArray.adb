package body PositionalArray is
        
  procedure dummy(X : in Index) is
  begin
    Box(X) := Box(X) - 1;
  end dummy;
        
  begin
    Box2 := Square'(77, others => 5); -- 1st pos will be 77, all others will be 5
end PositionalArray;