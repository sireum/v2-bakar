package Function_Simple
--# own Y, B, C;  -- Y is spec-public, B is body-declared, C is spec-private
--# initializes Y, B, C;

is
   Y: Integer;

  function F1(X: in Integer; Z: in Integer) return Integer with 
    Global => (Input => Y);
    --# global in Y;

private
   C: Integer;
end Function_Simple;
