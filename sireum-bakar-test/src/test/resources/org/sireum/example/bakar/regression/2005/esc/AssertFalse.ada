package AssertFalse is
   procedure P;
   --# derives;
end AssertFalse;

package body AssertFalse
is
   procedure P is
   begin
      --# assert false;
  end P;
end AssertFalse;
