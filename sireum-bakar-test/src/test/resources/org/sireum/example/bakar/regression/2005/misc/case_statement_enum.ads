package Case_Statement_Enum
is
  type Week is (Mon, Tue, Wed, Thur, Fri, FriPart2, Sat, Sun);
  subtype WeekDay is Week range Week'First .. Fri; -- Week'Pred(Week'Pred(Week'Pred(Week'Last)));
  subtype HumpDay is WeekDay range Wed .. Wed;
  subtype WeekEnd is Week range Sat .. Week'Last;

  type Activity is (Work, Sleep, Party, Drink);

  function isWorkDay (d : Week) return Activity;

end Case_Statement_Enum;
