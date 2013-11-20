package body Array_Utilities is
  function Num_Repetition(A : Array_Type; E : Contents_Type) return Integer
    is Result: Integer := 0;
  begin
    for I in Index_Type range 1 .. Max_Table_Size loop
      if A(I) = E then
        Result := Result + 1;
      end if;
    end loop;
    return Result;
  end Num_Repetition;

  function Perm(A, B : Array_Type) return Boolean is
    Result: Boolean := True;
  begin
    for I in Index_Type range 1 .. Max_Table_Size loop
      if Num_Repetition(A, A(I)) /= Num_Repetition(B, A(I)) then
        Result := False;
      end if;
    end loop;
    return Result;
  end Perm;

  function Ordered(A: Array_Type; L,U : Index_Type) return Boolean
    is
       Result: Boolean := True;
  begin
    for I in Index_Type range L .. U - 1 loop
       if A(I) > A(I + 1) then
         Result := False;
       end if;
    end loop;
    return Result;
  end Ordered;

  function Partitioned(A : Array_Type;
     L, M, U : Index_Type) return Boolean with
    Pre => 1 <= L and L <= M and M <= U and U <= Max_Table_Size
    --# pre 1 <= L and L <= M and M <= U and U <= Max_Table_Size;
  is
    Result: Boolean := True;
  begin
    for I in Index_Type range L .. M loop
      for J in Index_Type range M+1 .. U loop
        if A(I) > A(J) then
          Result := False;
        end if;
      end loop;
    end loop;
    return Result;
  end Partitioned;

  procedure Sort(Table : in out Array_Type) is
     Key : Index_Type;

    function Find_Smallest(Arr : Array_Type; L,U: Index_Type)
                           return Index_Type with
      Pre => 1 <= L and L <= U and U <= Max_Table_Size,
      Post => (for all J in Index_Type range L .. U => 
        (Arr(J) >= Arr(Find_Smallest'Result)))
      --# pre 1 <= L and L <= U and U <= Max_Table_Size;
      --# return I => (for all J in Index_Type range
      --#        L .. U => (Arr(J) >= Arr(I)));
    is
      K : Index_Type;
    begin
      K := L;
      for I in Index_Type range L+1..U loop
        if Arr(I) < Arr(K) then
          K := I;
        end if;
        pragma Assert (1 <= L and L+1 <= I and
           I <= U and U <= Max_Table_Size and
           K in Index_Type and
           (for all J in Index_Type range
             L .. I => (Arr(J) >= Arr(K))));
        --# assert 1 <= L and L+1 <= I and
        --#   I <= U and U <= Max_Table_Size and
        --#   K in Index_Type and
        --#   (for all J in Index_Type range
        --#     L .. I => (Arr(J) >= Arr(K)));
      end loop;
      return K;
    end Find_Smallest;

    procedure Swap_Elements(T : in out Array_Type;
                            I, J : in Index_Type) with
      Depends => (T => (T, I, J)),
      Post => T = T'Old'Update(I => T'Old(J), J => T'Old(I)) and Perm(T, T'Old)  
      --# derives T from T,I,J;
      --# post T = T~[I => T~(J); J => T~(I)] and Perm(T,T~);
    is
      Temp : Contents_Type;
    begin
      Temp := T(I); T(I) := T(J); T(J) := Temp;
    end Swap_Elements;

  begin -- Sort
    for Low in Index_Type range 1 .. Max_Table_Size-1 loop
      Key := Find_Smallest(Table,Low,Max_Table_Size);
      if Key /= Low then
        Swap_Elements(Table,Low,Key);
      end if;
      pragma Assert(1 <= Low and Low <= Max_Table_Size-1 and
            Ordered(Table, 1, Low) and
            Partitioned(Table, 1, Low, Max_Table_Size) and
            Perm(Table, Table'Loop_Entry));        
      --# assert 1 <= Low and Low <= Max_Table_Size-1 and
      --#      Ordered(Table,1,Low) and
      --#      Partitioned(Table,1,Low,Max_Table_Size) and
      --#      Perm(Table,Table~);
    end loop;
  end Sort;
end Array_Utilities;
