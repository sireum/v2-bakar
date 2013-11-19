package Search is

  type IntArray is array (Integer range <>) of Integer;

  procedure Linear_Search
    (Table : in IntArray;
     Value : in Integer;
     Found : out Boolean;
     Index : out Integer);

end Search;

package body Search is

  procedure Linear_Search
    (Table : in IntArray;
     Value : in Integer;
     Found : out Boolean;
     Index : out Integer)
  is
     I : Integer := 0;
  begin
     Found := False;

     while I <= Table'Last loop
        if Table(I) = Value then
           Found := True;
           Index := I;
           exit;
        end if;
        I := I + 1;
     end loop;
  end Linear_Search;

  --  procedure Linear_Search
  --    (Table : in IntArray;
  --     Value : in Integer;
  --     Found : out Boolean;
  --     Index : out Integer) is
  --  begin
  --     Found := False;
  --     Index := 0;

  --     for I in Integer range TableÕRange loop
  --        if Table(I) = Value then
  --           Found := True;
  --           Index := I;
  --            exit;
  --        end if;
  --     end loop;
  --  end Linear_Search;

end Search;
