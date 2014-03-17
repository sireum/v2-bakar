with ArraySetDefs;
with ArraySetUnsigned;
use type ArraySetDefs.ID_Type;

package ArraySet
  --# own State;
  with Abstract_State => (State)
is

   function Invariant return Boolean
     with Convention => Ghost,
      Global => (Input => State);
    
   procedure Get_Value (ID : in ArraySetDefs.ID_Type;
                        Value : out ArraySetDefs.Value_Type;
                        Found : out Boolean)
     --# global in State;
     --# derives Value, Found from ID, State;

     with Global => (Input => State),
        Depends => ((Value, Found) => (ID, State)),
        Pre => (ID /= ArraySetDefs.Null_ID and then Invariant),
        Post => Invariant;
    
    procedure Add
            (ID          : in  ArraySetDefs.ID_Type;
            Value        : in  ArraySetDefs.Value_Type;
            Response     : out ArraySetDefs.Response_Type)
        --# global in out State;
        --# derives State    from ID, Value, State &
        --#         Response from ID, State ; 
      with Global => (In_Out => State),
        Depends => (State => (ID, Value, State),
                    Response => (ID, State)),
        Pre => (Invariant and then
               (ID /= ArraySetDefs.Null_ID) and then
               (Value /= ArraySetDefs.Null_Value)),
        Post => (Invariant);
    
    procedure Delete
            (ID      : in  ArraySetDefs.ID_Type;
            Response : out ArraySetDefs.Response_Type)
        --# global in out State;
        --# derives Response, State from ID, State;
      with Global => (In_Out => State),
        Depends => ((Response, State) => (ID, State)),
        Pre => (Invariant and then
               (ID /= ArraySetDefs.Null_ID)),
        Post => (Invariant);

    procedure Init
    --# global out State;
    --# derives State from ;
      with Global => (Output => State),
           Depends => (State => null),
           Post => Invariant; 
end ArraySet;
