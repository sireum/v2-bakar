

package body Constraints
is

procedure foo(a : in out Integer; dayVar : in Day) is
begin
  if not (dayVar = Tue) then
    a := a + 2;
  elsif Day'Succ(dayVar) = Wed then -- always true as dayVar equals 'Tue'
    a := a - 1;
  else
    a := a * 1; -- unreachable
  end if;
end foo;

end Constraints;