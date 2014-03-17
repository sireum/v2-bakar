with ArraySetDefs;
with ArraySetUnsigned;
use type ArraySetDefs.ID_Type;
use type ArraySetDefs.Response_Type;

package body ArraySet
  with Refined_State => (State => (Item_List, Next_List, Used_Head, Free_Head))
is
  Max_Items : constant := 3;

  type Item_Type is record
    ID           : ArraySetDefs.ID_Type;
    Value        : ArraySetDefs.Value_Type;
  end record;

  subtype Item_List_Index_Type is ArraySetUnsigned.Word range 0 .. Max_Items - 1;
  subtype Link_Type is ArraySetUnsigned.Word range 0 .. Max_Items;

  type Item_List_Type is array (Item_List_Index_Type) of Item_Type;
  type Next_List_Type is array (Item_List_Index_Type) of Link_Type;

  Item_List : Item_List_Type;
  Next_List : Next_List_Type;

  Terminator : constant := Link_Type'Last;
  Inf_Length : constant := Max_Items + 1;
  Free_Head : Link_Type;
  Used_Head : Link_Type;

  function Size_Of_List(head : Link_Type) return ArraySetUnsigned.Word
  is
    Cursor : Link_Type;
    Result : ArraySetUnsigned.Word := 0;
  begin
    Cursor := head;
    while Cursor /= Terminator and Result < Inf_Length loop
      Result := Result + 1;
      Cursor := Next_List(Cursor);
      end loop;
      return Result;
  end Size_Of_List;

  function Is_Cyclic(head : Link_Type) return Boolean
  is begin
    return size_of_list(head) = Inf_Length;
  end Is_Cyclic;

  function Used_Elements_Invariant return Boolean
  is
    Cursor, Cursor2 : Link_Type;
    Result : Boolean := True;
  begin
    Cursor := Used_Head;
    while Result and then Cursor /= Terminator loop
      Result := Item_List(Cursor).ID /= ArraySetDefs.Null_ID
                and then Item_List(Cursor).Value /= ArraySetDefs.Null_Value;

      Cursor2 := Next_List(Cursor);

      while Result and then Cursor2 /= Terminator loop
        -- check for uniqueness of used element IDs
        Result := Item_List(Cursor).ID /= Item_List(Cursor2).ID;
        Cursor2 := Next_List(Cursor2);
      end loop;

      Cursor := Next_List(Cursor);
    end loop;
    return Result;
  end Used_Elements_Invariant;

  function Free_Elements_Invariant return Boolean
  is
    Cursor : Link_Type;
    Result : Boolean := True;
  begin
    Cursor := Free_Head;
    while Result and then Cursor /= Terminator loop
      Result := Item_List(Cursor).ID = ArraySetDefs.Null_ID
                and then Item_List(Cursor).Value = ArraySetDefs.Null_Value;
      Cursor := Next_List(Cursor);
    end loop;
    return Result;
  end Free_Elements_Invariant;

  function Invariant return Boolean is (
    not Is_Cyclic(Free_Head)
    and then not Is_Cyclic(Used_Head)
    and then Used_Elements_Invariant
    and then Free_Elements_Invariant
    and then Size_Of_List(Free_Head) + Size_Of_List(Used_Head) = Max_Items)
  with Refined_Global => (Input => (Next_List, Free_Head, Used_Head, Item_List));
        
  function contains(ID : ArraySetDefs.ID_Type;
    E_Used_Head : Link_Type; 
    E_Item_List : Item_List_Type;
    E_Next_List : Next_List_Type) return Boolean
  is
    Result : Boolean := false;
    Cursor : Link_Type;
  begin
    Cursor := E_Used_Head;
    while not Result and then Cursor /= Terminator loop
      Result := E_Item_List(Cursor).ID = ID;
      Cursor := E_Next_List(Cursor);
    end loop;
    return Result;
  end contains;
        
  procedure Get_Value (ID    : in ArraySetDefs.ID_Type;
                       Value : out ArraySetDefs.Value_Type;
                       Found : out Boolean)
    with Refined_Global => (Input => (Item_List, Next_List, Used_Head)),
         Refined_Depends => ((Value, Found) => (ID, Item_List, Next_List, Used_Head)),
         Refined_Post => (Invariant and then
           contains(ID, Used_Head, Item_List, Next_List) = Found and then
           (if Found then Value /= ArraySetDefs.Null_Value
           else Value = ArraySetDefs.Null_Value))
  is
    Curr_Index  : Link_Type;
  begin
    Value := ArraySetDefs.Null_Value;
    Curr_Index := Used_Head;
    Found := False;

    while not Found and then Curr_Index /= Terminator loop
      if Item_List (Curr_Index).ID = ID then
        Value := Item_List (Curr_Index).Value;
        Found := True;
      else
        Curr_Index := Next_List (Curr_Index);
      end if;
    end loop;
  end Get_Value;

  procedure Add(ID           : in  ArraySetDefs.ID_Type;
                Value        : in  ArraySetDefs.Value_Type;
                Response     : out ArraySetDefs.Response_Type)
    with Refined_Global => (In_Out => (Item_List, Next_List, Used_Head, Free_Head)),
         Refined_Depends => (Item_List => (ID, Value, Item_List, Next_List),
          (Response, Next_List, Free_Head, Used_Head) =>
            (ID, Item_List, Next_List, Free_Head, Used_Head)),
        Refined_Post => (Invariant and then
          
          (if Response = ArraySetDefs.DB_No_Room then
            (Free_Head'Old = Terminator and then Free_Head'Old = Free_Head))
          and then
          (if Response = ArraySetDefs.DB_Success then (
            (for all I in Item_List_Index_Type => (ID /= Item_List'Old(I).ID))
             and then
             (for some I in Item_List_Index_Type => (ID = Item_List(I).ID))
            ))
          and then
          (if Response = ArraySetDefs.DB_Already_Exists then (
              for some I in Item_List_Index_Type => (
                 ID = Item_List'Old(I).ID and then ID = Item_List(I).ID))))
  is
    Curr_Index : Link_Type;
    Temp_Value : ArraySetDefs.Value_Type;
    Found : Boolean;
  begin
    if ID /= ArraySetDefs.Null_ID then

      -- Check for full used list
      if Free_Head /= Terminator then

        -- Ensure the ID is not already in the list
        Get_Value(ID, Temp_Value, Found);

        if not Found then
          -- Use the entry at the head of the free list
          Curr_Index := Free_Head;

          -- Remove this entry from the free list
          Free_Head := Next_List (Free_Head);

          -- Fill in the values
          Item_List (Curr_Index).ID := ID;
          Item_List (Curr_Index).Value :=  Value;

          -- Insert this entry into the used list
          Next_List (Curr_Index) := Used_Head;
          Used_Head              := Curr_Index;

          Response := ArraySetDefs.DB_Success;

        else
          Response := ArraySetDefs.DB_Already_Exists;
        end if;

      else
        Response := ArraySetDefs.DB_No_Room;
      end if;

    else
      Response := ArraySetDefs.DB_Input_Check_Fail;
    end if;
  end Add;
                
  procedure Delete(ID          : in  ArraySetDefs.ID_Type;
                   Response    : out ArraySetDefs.Response_Type)
    with Refined_Global => (In_Out => (Item_List, Next_List, Free_Head, Used_Head)),
      Refined_Depends => (
        (Next_List, Free_Head ) => (ID, Item_List, Next_List, Free_Head, Used_Head),
        ( Response, Used_Head, Item_List) => (ID, Item_List, Next_List, Used_Head)),
      Refined_Post => (Invariant and then
        (if Response = ArraySetDefs.DB_Does_Not_Exist then
          contains(ID, Used_Head'Old, Item_List'Old, Next_List'Old) = False)
        and then
        (if contains(ID, Used_Head'Old, Item_List'Old, Next_List'Old) = False then
          Response = ArraySetDefs.DB_Does_Not_Exist)
        and then
        (if Response = ArraySetDefs.DB_Success then
          (contains(ID, Used_Head'Old, Item_List'Old, Next_List'Old) = true
           and then
           contains(ID, Used_Head, Item_List, Next_List) = false)))       
  is
    Curr_Index : Link_Type;
    Prev_Index : Link_Type;
  begin

    Prev_Index := Terminator;
    Curr_Index := Used_Head;

    while Curr_Index /= Terminator and then Item_List (Curr_Index).ID /= ID loop
      Prev_Index := Curr_Index;
      Curr_Index := Next_List (Curr_Index);
    end loop;

    if Curr_Index /= Terminator then

      -- Not necessary but may help debug - impacts SPARK annotations
      -- belt: this is needed when the package invariant is included
      Item_List (Curr_Index).ID := ArraySetDefs.Null_ID;
      Item_List (Curr_Index).Value := ArraySetDefs.Null_Value;

      -- Update the used list to remove the deleted entry
      if Prev_Index = Terminator then
        Used_Head := Next_List (Curr_Index);
      else
        Next_List (Prev_Index) := Next_List (Curr_Index);
      end if;

      -- Move deleted entry to the head of the free list
      Next_List (Curr_Index) := Free_Head;
      Free_Head := Curr_Index;

      Response := ArraySetDefs.DB_Success;
    else
      Response := ArraySetDefs.DB_Does_Not_Exist;
    end if;
  end Delete;

  procedure Init
    with Refined_Global => (Output => (Item_List, Next_List, Free_Head, Used_Head)),
         Refined_Depends => ((Item_List, Next_List, Free_Head, Used_Head) => null)
  is begin
    for I in Item_List_Index_Type loop
      Item_List (I).ID := ArraySetDefs.Null_ID;
      Item_List (I).Value := ArraySetDefs.Null_Value;
    end loop;
        
    for I in Link_Type range 0 .. Link_Type'Last - 1 loop
      Next_List (I) := I + 1;
    end loop;
        
    Next_List (Link_Type'Last-1) := Terminator;
    Free_Head := Link_Type'First;
    Used_Head := Terminator;
  end Init;
end ArraySet;
