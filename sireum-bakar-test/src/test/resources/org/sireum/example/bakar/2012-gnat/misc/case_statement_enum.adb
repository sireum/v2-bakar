package body Case_Statement_Enum
is

  function isWorkDay (d : Week) return Activity
  is
    ret : Activity;
  begin

    case d is
      when WeekDay range Mon .. Tue =>
        ret := Work;
      when HumpDay =>
        ret := Sleep;
      when Thur =>
        ret := Sleep;
      when Fri | FriPart2 =>
        ret := Party;
      when WeekEnd =>
        ret := Drink;
    end case;

    return ret;
  end isWorkDay;

end Case_Statement_Enum;

