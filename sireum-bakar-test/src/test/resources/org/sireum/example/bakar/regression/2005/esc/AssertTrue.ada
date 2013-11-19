package AssertTrue is
   procedure P;
   --# derives;
end AssertTrue;

package body AssertTrue
is
   procedure P is
   begin
      --# assert true;
  end P;
end AssertTrue;
