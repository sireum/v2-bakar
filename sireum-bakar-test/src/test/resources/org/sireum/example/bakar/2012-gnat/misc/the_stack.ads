package The_Stack
-- own/initializes (Barnes, p. 161-168)
--# own AuditInfo,                   -- concrete variables
--#     State;                       -- abstract variable
--# initializes AuditInfo, State;
is

   -- private type  (Barnes, pp. 171 -- 174)
   type StackID is private;
   -- deferred constant (Barnes, p. 174)
   InitID: constant StackID;

   -- Enumeration types and subtypes (Barnes, p. 102 -- 104)
   type Status is (Empty, Full, Normal);
   subtype BoundaryStatus is Status range Empty .. Full;

   -- Range types with constants and range attribute
   --  in range constraints  (Barnes, p. 102 -- 104)
   AuditCount_LowerLimit : constant := 0;
   AuditCount_UpperLimit : constant := 200;
   subtype AuditCountType is
     Integer range AuditCount_LowerLimit .. AuditCount_UpperLimit;

   -- records (Barnes, p. 102 -- 104)
   --   need to add example with record extension
   type AuditInfoType is record
      PushOps: AuditCountType;
      PopOps: AuditCountType;
   end record;

   procedure Push(X : in Integer);
   --# global in out State, AuditInfo;
   --# derives State from State, X
   --#       & AuditInfo from AuditInfo;

   procedure Pop(X : out Integer);
   --# global in out State, AuditInfo;
   --# derives State, X from State
   --#       & AuditInfo from AuditInfo;

-- private types, (Barnes, pp. 171 -- 174)
-- Note: private subtypes not allowed (per SPARK grammar)
private
   type StackID is range 1..1000;
   -- deferred constant (Barnes, p. 174)
   InitID: constant StackID := 1;
   
   function aPrivateFunction return Boolean;
end The_Stack;
