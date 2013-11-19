package InlineAssertArith1 is
   procedure Q;
   --# derives;
end InlineAssertArith1;

package body InlineAssertArith1
is
   procedure Q is
   begin
      --# assert 1 + 1 = 2;
  end Q;
end InlineAssertArith1;
