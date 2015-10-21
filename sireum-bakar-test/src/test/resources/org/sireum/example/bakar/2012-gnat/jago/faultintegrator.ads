package FaultIntegrator
is
  type T is record
              Limit   : Integer;
              Counter : Integer;
              Tripped : Boolean;
            end record;   
   
  procedure Test(FI              : in out T;
                 CurrentEvent    : in     Boolean;
                 IntegratedEvent :    out Boolean);
  --# derives IntegratedEvent,
  --#         FI              from FI, CurrentEvent;

end FaultIntegrator;
