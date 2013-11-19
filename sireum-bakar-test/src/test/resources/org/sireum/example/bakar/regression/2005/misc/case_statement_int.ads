package Case_Statement_Int
is
  type Activity is (Work, Party, Drink);
  subtype IntType is Integer range 1 .. 3;
  subtype SixType is Integer range 6 .. 6;

  function isWorkDay (d : Integer) return Activity;

end Case_Statement_Int;
