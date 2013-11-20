package Sort is
  Max_Elements : constant := 3;

  subtype Base_Index_Type is Integer range 0 .. Max_Elements;
  subtype Index_Type is Base_Index_Type range 1 .. Base_Index_Type'Last;

  type Contents_Type is range -1000 .. 1000;
  type Array_Type is array(Index_Type) of Contents_Type;

  function Ordered(A : Array_Type; L,U : Index_Type) return Boolean;

  function Perm(A, B : Array_Type; L,U : Index_Type) return Boolean;

  procedure BubbleSort(Table : in out Array_Type) with
    Depends => (Table => Table),
    Post => Ordered(Table, Index_Type'First, Index_Type'Last) and
            Perm(Table, Table'Old, Index_Type'First, Index_Type'Last);
   --# derives Table from Table;
   --# post Ordered(Table, Index_Type'First, Index_Type'Last) and 
   --#      Perm(Table, Table~, Index_Type'First, Index_Type'Last);

  procedure BubbleSortFast(Table : in out Array_Type) with
    Depends => (Table => Table),
    Post => Ordered(Table, Index_Type'First, Index_Type'Last) and
            Perm(Table, Table'Old, Index_Type'First, Index_Type'Last);
    --# derives Table from Table;
    --# post Ordered(Table, Index_Type'First, Index_Type'Last) and
    --#   Perm(Table, Table~, Index_Type'First, Index_Type'Last);
    
  procedure InsertionSort(Table : in out Array_Type) with
    Depends => (Table => Table),
    Post => Ordered(Table, Index_Type'First, Index_Type'Last) and
            Perm(Table, Table'Old, Index_Type'First, Index_Type'Last);
    --# derives Table from Table;
    --# post Ordered(Table, Index_Type'First, Index_Type'Last) and
    --#   Perm(Table,Table~, Index_Type'First, Index_Type'Last);
    
  procedure ShellSort(Table : in out Array_Type) with
    Depends => (Table => Table),
    Post => Ordered(Table, Index_Type'First, Index_Type'Last) and
            Perm(Table, Table'Old, Index_Type'First, Index_Type'Last);    
  --# derives Table from Table;
  --# post Ordered(Table, Index_Type'First, Index_Type'Last) and
  --#      Perm(Table, Table~, Index_Type'First, Index_Type'Last);
  
end Sort;
