package body Case_Statement_Int
is

  function isWorkDay (d : Integer) return Activity
  is
    ret : Activity;
  begin

    case d is
      when IntType =>
        ret := Work;
      when Integer range 4 .. 5 | SixType | 7 =>
        ret := Party;
      when 8 .. 9 =>
        ret := Party;
      when 10 =>
        ret := Work;
      when others =>
        ret := Drink;
    end case;

    return ret;
  end isWorkDay;

end Case_Statement_Int;

