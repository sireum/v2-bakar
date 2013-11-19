-- This is a SPARK-Ada version of the simple C mailbox example
-- provided by Rockwell Collins. The example is enriched with
-- SPARK annotations. The purpose of this simple program is to
-- transmit data from one entity to another through a mediator
-- (the mailbox).

package Mailbox
--# own INTEGER_INPUT_0_READY, INTEGER_INPUT_0_DATA,
--#     INTEGER_OUTPUT_0_READY, INTEGER_OUTPUT_0_DATA,
--#     INTEGER_INPUT_1_READY, INTEGER_INPUT_1_DATA,
--#     INTEGER_OUTPUT_1_READY, INTEGER_OUTPUT_1_DATA;
--# initializes INTEGER_INPUT_0_READY, INTEGER_INPUT_0_DATA,
--#     INTEGER_OUTPUT_0_READY, INTEGER_OUTPUT_0_DATA,
--#     INTEGER_INPUT_1_READY, INTEGER_INPUT_1_DATA,
--#     INTEGER_OUTPUT_1_READY, INTEGER_OUTPUT_1_DATA;
--@ domain High, Low;
--@ ordering High > Low;
--@ INTEGER_INPUT_0_DATA, INTEGER_INPUT_1_DATA in High;
--@ INTEGER_OUTPUT_0_DATA, INTEGER_OUTPUT_0_READY, INTEGER_INPUT_0_READY, INTEGER_INPUT_1_READY, INTEGER_OUTPUT_1_DATA, INTEGER_OUTPUT_1_READY in Low;
--@ declassify ( INTEGER_INPUT_0_DATA on (INTEGER_INPUT_0_READY and (not INTEGER_OUTPUT_1_READY)), 
--@              INTEGER_INPUT_1_DATA on (INTEGER_INPUT_1_READY and (not INTEGER_OUTPUT_0_READY)): High -> Low );
  
is

  INTEGER_INPUT_0_READY : BOOLEAN := TRUE;
  INTEGER_INPUT_0_DATA : INTEGER := -1;
  INTEGER_OUTPUT_0_READY : BOOLEAN := TRUE;
  INTEGER_OUTPUT_0_DATA : INTEGER := -1;

  INTEGER_INPUT_1_READY : BOOLEAN := TRUE;
  INTEGER_INPUT_1_DATA : INTEGER := -1;
  INTEGER_OUTPUT_1_READY : BOOLEAN := TRUE;
  INTEGER_OUTPUT_1_DATA : INTEGER := -1;

  procedure MACHINE_STEP ;
    --# global in out INTEGER_INPUT_0_READY,
    --#               INTEGER_INPUT_1_READY,
    --#               INTEGER_OUTPUT_0_READY,
    --#               INTEGER_OUTPUT_1_READY,
    --#               INTEGER_OUTPUT_0_DATA,
    --#               INTEGER_OUTPUT_1_DATA;
    --#        in     INTEGER_INPUT_0_DATA,
    --#               INTEGER_INPUT_1_DATA;
    --@ derives INTEGER_OUTPUT_0_DATA from INTEGER_INPUT_1_DATA on (INTEGER_INPUT_1_READY and (not INTEGER_OUTPUT_0_READY)),
    --@                                              INTEGER_OUTPUT_0_READY on true,
    --@                                              INTEGER_OUTPUT_0_DATA on not (INTEGER_INPUT_1_READY and (not INTEGER_OUTPUT_0_READY)),
    --@                                              INTEGER_INPUT_1_READY on true &
    --@         INTEGER_OUTPUT_1_DATA from INTEGER_INPUT_0_DATA on (INTEGER_INPUT_0_READY and (not INTEGER_OUTPUT_1_READY)),
    --@                                              INTEGER_INPUT_0_READY on true,
    --@                                              INTEGER_OUTPUT_1_DATA on not (INTEGER_INPUT_0_READY and (not INTEGER_OUTPUT_1_READY)),
    --@                                              INTEGER_OUTPUT_1_READY on true &
    --@         INTEGER_INPUT_0_READY from INTEGER_INPUT_0_READY on true,
    --@                                              INTEGER_OUTPUT_1_READY on true &
    --@         INTEGER_INPUT_1_READY from INTEGER_INPUT_1_READY on true,
    --@                                              INTEGER_OUTPUT_0_READY on true &
    --@         INTEGER_OUTPUT_0_READY from INTEGER_OUTPUT_0_READY on true,
    --@                                               INTEGER_INPUT_1_READY on true &
    --@         INTEGER_OUTPUT_1_READY from INTEGER_OUTPUT_1_READY on true,
    --@                                               INTEGER_INPUT_0_READY on true;


end Mailbox;

package body Mailbox
is
  procedure MACHINE_STEP
  is
      DATA_0 : INTEGER;
      DATA_1 : INTEGER;
  begin 
     if INTEGER_INPUT_0_READY and not INTEGER_OUTPUT_1_READY 
     then 
	DATA_0 := INTEGER_INPUT_0_DATA;
	INTEGER_INPUT_0_READY := FALSE;
	INTEGER_OUTPUT_1_DATA := DATA_0;
	INTEGER_OUTPUT_1_READY := TRUE; 
     else 
	null;
     end if;
     
     if INTEGER_INPUT_1_READY and not INTEGER_OUTPUT_0_READY 
     then 
	DATA_1 := INTEGER_INPUT_1_DATA;
	INTEGER_INPUT_1_READY := FALSE;
	INTEGER_OUTPUT_0_DATA := DATA_1;
	INTEGER_OUTPUT_0_READY := TRUE; 
     else
	null;
     end if;
  end MACHINE_STEP;
end Mailbox;
