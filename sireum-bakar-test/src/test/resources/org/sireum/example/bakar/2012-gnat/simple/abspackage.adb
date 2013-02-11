package body AbsPackage is

  function AbsFunc(x : Integer) return Integer is 
    r : Integer;
  begin
    if(x < 0) then
      r := x * (-1);
    else
      r := x;
    end if;  
    pragma assert (r >= 0);  
    return r;
  end AbsFunc;
     
end AbsPackage;