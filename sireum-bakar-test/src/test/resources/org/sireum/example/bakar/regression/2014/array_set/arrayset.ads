with ArraySetDefs;
with ArraySetUnsigned;
use type ArraySetDefs.ID_Type;

package ArraySet
  with Abstract_State => (State)
is

  function Invariant return Boolean
    with Convention => Ghost,
     Global => (Input => State);
    
  procedure Get_Value (ID : in ArraySetDefs.ID_Type;
                       Value : out ArraySetDefs.Value_Type;
                       Found : out Boolean)
    with Global => (Input => State),
        Depends => ((Value, Found) => (ID, State)),
            Pre => (ID /= ArraySetDefs.Null_ID and then Invariant),
           Post => Invariant;
    
  procedure Add(ID          : in  ArraySetDefs.ID_Type;
                Value        : in  ArraySetDefs.Value_Type;
                Response     : out ArraySetDefs.Response_Type)
    with Global => (In_Out => State),
        Depends => (State => (ID, Value, State),
                    Response => (ID, State)),
            Pre => (Invariant and then
                   (ID /= ArraySetDefs.Null_ID) and then
                   (Value /= ArraySetDefs.Null_Value)),
           Post => (Invariant);
    
  procedure Delete(ID      : in  ArraySetDefs.ID_Type;
                   Response : out ArraySetDefs.Response_Type)
    with Global => (In_Out => State),
        Depends => ((Response, State) => (ID, State)),
            Pre => (Invariant and then
                   (ID /= ArraySetDefs.Null_ID)),
           Post => (Invariant);

  procedure Init
      with Global => (Output => State),
          Depends => (State => null),
             Post => Invariant; 
end ArraySet;
