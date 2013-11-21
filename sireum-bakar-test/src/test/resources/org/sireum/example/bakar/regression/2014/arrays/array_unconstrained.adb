package body Array_Unconstrained is
  function isSorted(Z : Vector) return Boolean is
    B : Boolean := True;
  begin
    for I in Integer range Z'First .. Z'Last - 1  loop
      B := Z(I) <= Z(I + 1);
      exit when not B;
    end loop;
    return B;
  end isSorted;

  function indexIsValue(Z : Vector; Index, V : Integer) return Boolean is
  begin
    return Z(Index) = V;
  end indexIsValue;
end Array_Unconstrained;
