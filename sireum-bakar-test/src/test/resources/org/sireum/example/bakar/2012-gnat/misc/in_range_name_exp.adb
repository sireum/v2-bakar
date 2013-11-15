
package body in_range_name_exp
is

  function test(Z : Integer) return Boolean
  is
    ret : Boolean;
  begin
    ret := Z in Natural;
        
    if ret then
      ret := Z in 1 .. 10;
    end if;
    
    if ret then
      ret := Z not in Positive;
    end if;
    
    if ret then
      ret := Z not in Positive | 4 | 5..7 | 3 + 5;
    end if;
    
    return ret;
  end test;

end in_range_name_exp;