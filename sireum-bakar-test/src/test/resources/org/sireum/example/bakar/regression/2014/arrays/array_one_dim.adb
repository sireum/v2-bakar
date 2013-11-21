package body Array_One_Dim is
  
  procedure dummy(X : in highIndex) is
    type Naturals is range 0..Integer'Last;
    subtype Positives is Naturals range 1..Naturals'Last;
    
    subtype locIndex is Index range 1..10;
    type localVector is array(Integer range <>) of Naturals;
    subtype localConsVector is localVector(locIndex);
    
    Vprime : constant localConsVector := 
      localConsVector'(others => Naturals'Last - I); -- can't use F on lhs or rhs here
      
    M : constant Naturals := Naturals'Last;
  begin
     V(X) := Index(Naturals(Integer(Vprime(3)))) - I;
  end dummy;
 
  procedure dummy2(X : in highIndex) is
    subtype locIndex is Index range 1..10;
    subtype localConsVector is Vector(locIndex);
    Vprime : constant localConsVector := 
      localConsVector'(others => locIndex'Last + I); -- can't use F on lhs or rhs here
    locI : highIndex;
  begin
    locI := X + 1;
    V(X) := Vprime(3) - locI;
  end dummy2;
 
begin
   F := 5;
   G := 10;
   V := constrainedVector'(1..(5-2) | 10 => F, -- F is effectively a constant 
                                               -- here. It can be used on the rhs 
                                               -- but not on lhs e.g. F + 6 => F 
                                               -- is illegal (even if G were
                                               -- an Index)
                           3 + 1 => F + 1,
                           subIndex => I, 
                           Index range 11..20 => 20,
                           others => 3);
end Array_One_Dim;

