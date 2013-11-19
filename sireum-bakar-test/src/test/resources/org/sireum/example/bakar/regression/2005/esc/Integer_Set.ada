-- Realization of a single Integer set using a fixed size array.
-- @author Patrice Chalin

--!!with NeoSpark_Z_Set;
  --!!# inherit NeoSpark_Z_Set;
package Integer_Set
  --# own State --!!@ : NeoSpark_Z_Set.Z_Set
  --# ;
  --!!!@ modelvar State: NeoSpark_Z_Set.Z_Set
is
  subtype Element_Type is Integer;
  subtype Size_Range is Integer range 0 .. 100;

  function Size return Size_Range;
  --# global in State;
  --!!@ return NeoSpark_Z_Set.Size(State);

  procedure Add(E: in Element_Type);
  --# global in out State;
  --# derives State from E, State;
  --!!@ pre NeoSpark_Z_Set.Size(State) < Size_Range'Last;
  --!!@ post State = NeoSpark_Z_Set.Add(E, State~)

  procedure Remove(E: in Element_Type);
  --# global in out State;
  --# derives State from E, State;
  --!!@ pre NeoSpark_Z_Set.Size(State) /= 0;
  --!!@ post State = NeoSpark_Z_Set.Remove(E, State~);

  procedure Empty;
  --# global out State;
  --# derives State from;
  --!!@ post NeoSpark_Z_Set.Size(State) = 0;

  function isMember(E: in Element_Type) return Boolean;
  --# global in State;
  --!!@ return NeoSpark_Z_Set.isMember(E, State);

end Integer_Set;

package body Integer_Set
  --# own State is Elem_Array, Member_Count;
is
  subtype Index_Range is Size_Range range 1 .. Size_Range'Last;
  type Elem_Array_Type is array (Index_Range) of Element_Type;

  Member_Count : Size_Range;
  Elem_Array : Elem_Array_Type;

  function Size return Size_Range
    --# global in Member_Count;
    --# return Member_Count;
  is begin
        return Member_Count;
  end Size;

  function isMember(E: in Element_Type) return Boolean
    --# global in Elem_Array, Member_Count;
    --# return for some I in Integer range
    --#          Index_Range'First .. Member_Count =>
    --#            (Elem_Array(I) = E);
  is
    Found : Boolean := False;
    I : Integer := Index_Range'First;
  begin
      while not Found and then I <= Member_Count loop
         --# assert for all J in Integer range
         --#  Index_Range'First .. Member_Count => (
         --#    Elem_Array(J) /= E);
         if Elem_Array (I) = E then
            Found := True;
         else
            I := I + 1;
         end if;
      end loop;
      return Found;
  end isMember;

  procedure Add(E: Element_Type)
    --# global in out Elem_Array, Member_Count;
    --# derives Elem_Array, Member_Count from E, Elem_Array, Member_Count;
    --# pre Member_Count < Size_Range'Last;
    --# post (isMember(E, Elem_Array, Member_Count) -> (
    --#       Elem_Array = Elem_Array~ and Member_Count = Member_Count~));
    
    --!! jab commenting the following as we don't currently handle array updates
    --!#  and (not isMember(E, Elem_Array, Member_Count) -> (
    --!#       Elem_Array = Elem_Array~[Member_Count => E]
    --!#       and Member_Count = Member_Count~ + 1));
   is
   begin
      if not isMember(E) then
         if Member_Count < Size_Range'Last then
            Member_Count := Member_Count + 1;
            Elem_Array (Member_Count) := E;
         end if;
      end if;
   end Add;

   procedure Remove(E: Element_Type)
     --# global in out Elem_Array, Member_Count;
     --# derives Elem_Array, Member_Count from E, Elem_Array, Member_Count;
     --# pre Member_Count /= 0;
     --!!# post (not isMember(E, Elem_Array, Member_Count) -> (
     --!!#       Elem_Array = Elem_Array~ and Member_Count = Member_Count~))
     --!!#  and (isMember(E, Elem_Array, Member_Count) -> (
     --!!#       -- TBC/FIXME Elem_Array = ... and
     --!!#       Member_Count = Member_Count~ - 1));
   is
      Found : Boolean := False;
   begin
      if isMember(E) then
         --# assert Member_Count > 0 and (for some J in Integer
         --#   range Index_Range'First .. Member_Count
         --#     => (Elem_Array(J) = E));
         for I in Integer range Index_Range'First .. Member_Count - 1 loop
            --# assert for all J in Integer range
            --#  Index_Range'First .. I - 1 => (
            --#    Elem_Array(J) /= E);
            if Elem_Array (I) = E then
               Found := True;
            end if;
            if Found then
               Elem_Array (I) := Elem_Array(I+1);
            end if;
         end loop;
         Member_Count := Member_Count - 1;
      end if;
   end Remove;

  procedure Empty
    --# global out Elem_Array, Member_Count;
    --# derives Elem_Array, Member_Count from;
    --# post Member_Count = 0;
  is
  begin
        Member_Count := 0;
        Elem_Array := Elem_Array_Type'(others => 0);
        -- for I in Integer range Index_Range'First .. Member_Count - 1 loop
        --   --# assert for all J in Integer range
        --   --#  Index_Range'First .. I - 1 => (
        --   --#    Elem_Array(J) = 0);
        --   Elem_Array (I) := 0;
        -- end loop;
  end Empty;

end Integer_Set;
