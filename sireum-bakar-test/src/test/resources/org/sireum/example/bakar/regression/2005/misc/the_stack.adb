

package body The_Stack
--# own State is S, Pointer;  -- refinement definition
is
   Stack_Size : constant := 100;
   type Pointer_Range is range 0 .. Stack_Size;
   subtype Index_Range is Pointer_Range range 1..Stack_Size;
   type Vector is array(Index_Range) of Integer;
   S : Vector;
   Pointer : Pointer_Range;

   AuditInfo : AuditInfoType;

   procedure Push(X : in Integer)
   --# global in out S, Pointer, AuditInfo;
   --# derives S       from S, Pointer, X &
   --#         Pointer from Pointer &
   --#         AuditInfo from AuditInfo;
   --# pre Pointer < Stack_Size;
   --# post Pointer = Pointer~ + 1 and
   --#      S = S~[Pointer => X];
   is
   begin
      Pointer := Pointer + 1;
      S(Pointer) := X;
      AuditInfo.PushOps := AuditInfo.PushOps + 1;
   end Push;

   procedure Pop(X : out Integer)
   --# global in S; in out Pointer, AuditInfo;
   --# derives Pointer from Pointer &
   --#         X       from S, Pointer &
   --#         AuditInfo from AuditInfo;
   --# pre Pointer /= 0;
   --# post Pointer = Pointer~ - 1 and
   --#      X = S(Pointer~);
   is
   begin
      X := S(Pointer);
      Pointer := Pointer - 1;
      AuditInfo.PopOps := AuditInfo.PopOps + 1;
   end Pop;

   -- non-public function
   function Value_Present (X : Integer) return Boolean
   --# global in S;
   --# return for some M in Index_Range => (S(M) = X);
   is
      Result : Boolean;
   begin
      Result := False;
      for I in Index_Range loop
         if S(I) = X then
            Result := True;
            exit;
         end if;
         
         --# assert I in Index_Range and
         --#        not Result and 
         --#        (for all M in Index_Range range Index_Range'First .. I => (S(M) /= X));
      end loop;
      return Result;
   end Value_Present;

   -- non-public function
   function Find_Stack_Pos (X : Integer) return Index_Range
   --# global in S;
   --# pre for some M in Index_Range => (S(M) = X);
   --# return Z => (S(Z) = X) and
   --#    (for all M in Index_Range range Index_Range'First .. Z-1 => (S(M) /= X));
   is
     -- static initialization of local variable
     Result_Pos : Index_Range := Index_Range'First;
   begin
      for I in Index_Range loop
         if S(I) = X then
            Result_Pos := I;
            exit;
         end if;
      end loop;
      return Result_Pos;
   end Find_Stack_Pos;

  function aPrivateFunction return Boolean
  is
  begin
    return True;
  end aPrivateFunction;

begin  -- initialization
   Pointer := 0;
   -- aggregate notation (Barnes, p. 109 -- 113)
   S := Vector'(Index_Range => 0);
   AuditInfo := AuditInfoType'(0,0);
end The_Stack;

