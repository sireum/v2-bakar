

package body The_Stack
--# own State is S, Pointer;  -- refinement definition
is
   subtype AuditCountType is
     Integer range 0 .. 200;

   -- records (Barnes, p. 102 -- 104)
   --   need to add example with record extension
   type AuditInfoType is record
      PushOps: AuditCountType;
      PopOps: AuditCountType;
   end record;
   
   type Pointer_Range is range 0 .. 100;
   subtype Index_Range is Pointer_Range range 1..100;
   type Vector is array(Index_Range) of Integer;
   S : Vector;
   Pointer : Pointer_Range;

   AuditInfo : AuditInfoType;

   procedure Push(X : in Integer)
   is
   begin
      Pointer := Pointer + 1;
      S(Pointer) := X;
      AuditInfo.PushOps := AuditInfo.PushOps + 1;
   end Push;

   procedure Pop(X : out Integer)
   is
   begin
      X := S(Pointer);
      Pointer := Pointer - 1;
      AuditInfo.PopOps := AuditInfo.PopOps + 1;
   end Pop;

begin  -- initialization
   Pointer := 0;
end The_Stack;

