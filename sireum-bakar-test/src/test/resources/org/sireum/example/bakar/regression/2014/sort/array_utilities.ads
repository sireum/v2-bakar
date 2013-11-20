package Array_Utilities is
  Max_Table_Size : constant := 100;
  type Base_Index_Type is range 0..Max_Table_Size;
  subtype Index_Type is Base_Index_Type range 1..Max_Table_Size;
  type Contents_Type is range -1000 .. 1000;
  type Array_Type is array(Index_Type) of Contents_Type;

  function Ordered(A : Array_Type; L,U : Index_Type) return Boolean with
    Pre => 1 <= L and L <= U and U <= Max_Table_Size; 
    --# pre 1 <= L and L <= U and U <= Max_Table_Size;

  function Perm(A, B : Array_Type) return Boolean;


  procedure Sort(Table : in out Array_Type) with
    Depends => (Table => Table),
    Post => Ordered( Table, 1, Max_Table_Size) and
        Perm(Table, Table'Old);
    --# derives Table from Table;
    --# post Ordered(Table,1,Max_Table_Size) and
    --#   Perm(Table,Table~);
end Array_Utilities;
