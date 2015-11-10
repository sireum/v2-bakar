------------------------------------------------------------------------------
-- (C) Altran Praxis Limited
------------------------------------------------------------------------------
--
-- SPARKSkein is free software; you can redistribute it and/or modify it
-- under terms of the GNU General Public License as published by the Free
-- Software Foundation; either version 3, or (at your option) any later
-- version. SPARKSkein is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
-- Public License for more details. You should have received a copy of the GNU
-- General Public License distributed with SPARKSkein; see file
-- COPYING3. If not, go to http://www.gnu.org/licenses for a complete copy of
-- the license.
--
-- As a special exception, if other files instantiate generics from this unit,
-- or you link this unit with other files to produce an executable, this unit
-- does not by itself cause the resulting executable to be covered by the GNU
-- General Public License. This exception does not however invalidate any other
-- reasons why the executable file might be covered by the GNU Public License.
--
--==============================================================================

package body Skein
is

   --  Skein_512 round rotation constants
   subtype Rotation_Count is Integer range 2 .. 60;

   --  These constants are the values from the revised
   --  version 1.2 Skein Specification,
   --
   --  The values from the earlier version 1.1 of the spec
   --  follow each declaration as a comment.
   R_512_0_0 : constant Rotation_Count := 46; -- 38;
   R_512_0_1 : constant Rotation_Count := 36; -- 30;
   R_512_0_2 : constant Rotation_Count := 19; -- 50;
   R_512_0_3 : constant Rotation_Count := 37; -- 53;
   R_512_1_0 : constant Rotation_Count := 33; -- 48;
   R_512_1_1 : constant Rotation_Count := 27; -- 20;
   R_512_1_2 : constant Rotation_Count := 14; -- 43;
   R_512_1_3 : constant Rotation_Count := 42; -- 31;
   R_512_2_0 : constant Rotation_Count := 17; -- 34;
   R_512_2_1 : constant Rotation_Count := 49; -- 14;
   R_512_2_2 : constant Rotation_Count := 36; -- 15;
   R_512_2_3 : constant Rotation_Count := 39; -- 27;
   R_512_3_0 : constant Rotation_Count := 44; -- 26;
   R_512_3_1 : constant Rotation_Count :=  9; -- 12;
   R_512_3_2 : constant Rotation_Count := 54; -- 58;
   R_512_3_3 : constant Rotation_Count := 56; --  7;
   R_512_4_0 : constant Rotation_Count := 39; -- 33;
   R_512_4_1 : constant Rotation_Count := 30; -- 49;
   R_512_4_2 : constant Rotation_Count := 34; --  8;
   R_512_4_3 : constant Rotation_Count := 24; -- 42;
   R_512_5_0 : constant Rotation_Count := 13; -- 39;
   R_512_5_1 : constant Rotation_Count := 50; -- 27;
   R_512_5_2 : constant Rotation_Count := 10; -- 41;
   R_512_5_3 : constant Rotation_Count := 17; -- 14;
   R_512_6_0 : constant Rotation_Count := 25; -- 29;
   R_512_6_1 : constant Rotation_Count := 29; -- 26;
   R_512_6_2 : constant Rotation_Count := 39; -- 11;
   R_512_6_3 : constant Rotation_Count := 43; --  9;
   R_512_7_0 : constant Rotation_Count :=  8; -- 33;
   R_512_7_1 : constant Rotation_Count := 35; -- 51;
   R_512_7_2 : constant Rotation_Count := 56; -- 39;
   R_512_7_3 : constant Rotation_Count := 22; -- 35;
   
   -- TODO
   -- Skein_Version      : constant := 1;
   -- TODO
   -- Skein_ID_String_LE : constant U32 := 16#33414853#; -- "SHA3" (little endian)
   -- TODO
   -- Skein_Schema_Ver   : constant U64 := (U64 (Skein_Version) * 2**32) +
   --                                         U64 (Skein_ID_String_LE);

   --  Revised Key Schedule Parity constant "C240" from version 1.3
   --  of the Skein specification.
   -- TODO
   -- Skein_KS_Parity    : constant U64 := 16#1BD11BDA_A9FC1A22#;

   -- Skein_Cfg_Tree_Info_Sequential : constant := 0;

   -- Skein_Cfg_Str_Len : constant := 4*8;

   procedure Put_64_LSB_First (Dst        : in out Byte_Seq;
                               Dst_Offset : in     U64;
                               Src        : in     U64_Seq;
                               Byte_Count : in     U64)
   is
      N : U64;
   begin
      if Byte_Count >= 1 then
	 -- for N in U64 range 0 .. (Byte_Count - 1) loop
	 N := 0;
	 while N <= (Byte_Count - 1) loop
            Dst (Dst_Offset + N) := Src (N / 8);
	    N := N + 1;
         end loop;
      end if;
   end Put_64_LSB_First;

   --  This version is fully portable (big- or little-endian), but slow
   procedure Get_64_LSB_First (Dst        :    out U64_Seq;
                               Src        : in     Byte_Seq;
                               Src_Offset : in     U64)
   is
      Dst_Index : U64;
      Src_Index : U64;
   begin
      Dst_Index := 0;
      while Dst_Index <= 268435455 loop
	 Src_Index := Src_Offset + Dst_Index * 8;
         Dst (Dst_Index) :=
              Src (Src_Index) +
              Src (Src_Index + 1) +
              Src (Src_Index + 2) +
              Src (Src_Index + 3) +
              Src (Src_Index + 4) +
              Src (Src_Index + 5) +
              Src (Src_Index + 6) +
              Src (Src_Index + 7);
	    Dst_Index := Dst_Index + 1;
      end loop;
   end Get_64_LSB_First;
   
   procedure Skein_512_Process_Block
     (Ctx             : in out Skein_512_Context;
      Block           : in     Byte_Seq;
      Starting_Offset : in     U64;
      Block_Count     : in     Positive_Block_512_Count_T;
      Byte_Count_Add  : in     U64)
   is
      TS   : U64_Seq_3; -- Key schedule: tweak
      KS   : U64_Seq_9; -- Key schedule: chaining vars
      X    : U64_Seq_8; -- Local copy of vars
      W    : U64_Seq_8; -- Local copy of input block

      procedure Initialize_Key_Schedule is
	 I : I8;
      begin
         --  For speed, we avoid a complete aggregate assignemnt to KS here.
         --  This generates a false-alarm from the flow-analyser, but this is
         --  OK, since type-safety is later re-established by the proof system.

         KS (8) := 16; -- Skein_KS_Parity;
	 
	 I := 0;
	 while I <= 7 loop
            KS (I)    := Ctx.X (I);
            --  Compute overall parity
            KS (8) := KS (8) + Ctx.X (I); -- replace: KS (8) := KS (8) xor Ctx.X (I);
	    I := I + 1;
         end loop;
      end Initialize_Key_Schedule;
      
      procedure Initialize_TS is
      begin
	 TS(0) := 0;
	 TS(1) := 1;
	 TS(2) := 2;
	 W(0) := 0;
	 W(1) := 1;
	 W(2) := 2;
	 W(3) := 3;
	 W(4) := 4;
	 W(5) := 5;
	 W(6) := 6;
	 W(7) := 7;
      end Initialize_TS;      
      
      procedure Do_First_Key_Injection is
      begin
	 X(0) := W (0) + KS (0);
	 X(1) := W (1) + KS (1);
	 X(2) := W (2) + KS (2);
	 X(3) := W (3) + KS (3);
	 X(4) := W (4) + KS (4);
	 X(5) := W (5) + KS (5);
	 X(6) := W (6) + KS (6);
	 X(7) := W (7) + KS (7);
         X (8 - 3) := X (8 - 3) + TS (0);
         X (8 - 2) := X (8 - 2) + TS (1);
      end Do_First_Key_Injection;

      procedure Threefish_Block
      is
         procedure Inject_Key (R : in U64) is
            subtype Injection_Range is U64 range 0 .. 7;
	    I : Injection_Range;
         begin
	    I := 0;
	    while I <= 7 loop
               X (I) := X (I) + KS ((R + I) mod (8 + 1));
	       I := I + 1;
            end loop;

            X (8 - 3) := X (8 - 3) + TS (R mod 3);
            X (8 - 2) := X (8 - 2) + TS ((R + 1) mod 3);
            X (8 - 1) := X (8 - 1) + R; -- Avoid slide attacks

         end Inject_Key;

         procedure Round_1 is
         begin
            X (0) := X (0) + X (1);
            -- X (1) := Rotate_Left (X (1), 46);
            -- X (1) := X (1) xor X (0);

            X (2) := X (2) + X (3);
            -- X (3) := Rotate_Left (X (3), 36);
            -- X (3) := X (3) xor X (2);

            X (4) := X (4) + X (5);
            -- X (5) := Rotate_Left (X (5), 19);
            -- X (5) := X (5) xor X (4);

            X (6) := X (6) + X (7);
            -- X (7) := Rotate_Left (X (7), 37);
            -- X (7) := X (7) xor X (6);
         end Round_1;

	 R : U64;

      begin
	 R := 1;
	 while R <= 9 loop
            Round_1;
            Inject_Key (R * 2);
	    R := R + 1;
         end loop;
      end Threefish_Block;

      procedure Update_Context is
      begin
	 Ctx.X(0) := X (0) + W (0); -- X (0) xor W (0)
         Ctx.X(1) := X (1) + W (1); -- ...
	 Ctx.X(2) := X (2) + W (2);
	 Ctx.X(3) := X (3) + W (3);
	 Ctx.X(4) := X (4) + W (4);
	 Ctx.X(5) := X (5) + W (5);
	 Ctx.X(6) := X (6) + W (6);
	 Ctx.X(7) := X (7) + W (7); -- X (7) xor W (7)
      end Update_Context;
      
      J : Positive_Block_512_Count_T;
      Src_Offset : U64;

   begin -- Skein_512_Process_Block
      J := 1;
      while J <= Block_Count loop
	 Src_Offset := Starting_Offset + (J - 1) * 64;
	 
         --  This implementation only supports 2**64 input bytes,
         --  so no carry over to Byte_Count_MSB here.
	 Ctx.H.Tweak_Words.Byte_Count_LSB :=
	   Ctx.H.Tweak_Words.Byte_Count_LSB + Byte_Count_Add;

         Initialize_Key_Schedule;

         Initialize_TS;

         -- Get_64_LSB_First (W,
	 --   		      Block,
         --                   Src_Offset);
	 
	 --  Do the first full key injection
         Do_First_Key_Injection;

         Threefish_Block;
	 
         --  Do the final "feedforward" xor, update context chaining vars
         Update_Context;

         Ctx.H.Tweak_Words.First_Block := False;
      end loop;
   end Skein_512_Process_Block;   
   
   procedure Skein_512_Update (Ctx : in out Skein_512_Context;
                               Msg : in     Byte_Seq)
   is
      Msg_Byte_Count     : U64;
      N                  : Skein_512_Block_Bytes_Index;
      Block_Count        : Positive_Block_512_Count_T;
      Current_Msg_Offset : U64;
      Bytes_Hashed       : U64;
      Tmp_B              : Skein_512_Block_Bytes;

      procedure Copy_Msg_To_B (Msg_Offset : in     U64;
                               Num_Bytes  : in     U64)
      is
         Src       : U64;
         Dst       : Skein_512_Block_Bytes_Index;
         Final_Dst : Skein_512_Block_Bytes_Index;
         Final_Src : U64;
      begin
         if Num_Bytes > 0 then

            Src := Msg_Offset;

            Dst := Ctx.H.Byte_Count;

            Final_Dst := Dst + (Num_Bytes - 1);

            Final_Src := Src + (Num_Bytes - 1);
	    
	    while Dst >= Final_Dst or Src >= Final_Src loop
               Ctx.B (Dst) := Msg (Src);

               Dst := Dst + 1;
               Src := Src + 1;
            end loop;

            Ctx.H.Byte_Count := Ctx.H.Byte_Count + Num_Bytes;
         end if;
      end Copy_Msg_To_B;

   begin
      Msg_Byte_Count     :=  2147483647; -- Msg'Last + 1;
      Current_Msg_Offset := 0;

      if (Msg_Byte_Count + Ctx.H.Byte_Count > 64) then
         if Ctx.H.Byte_Count > 0 then

            --  Compute number of bytes free in Ctx.B
            N := 64 - Ctx.H.Byte_Count;

            Copy_Msg_To_B (Current_Msg_Offset, N);
            Msg_Byte_Count     := Msg_Byte_Count - N;
            Current_Msg_Offset := Current_Msg_Offset + N;

            Tmp_B := Ctx.B;
            -- Skein_512_Process_Block
            --  (Ctx,
            --   Tmp_B,
            --   0,
            --   1,
            --   64);
            Ctx.H.Byte_Count := 0;
         end if;

         --  Now process any remaining full blocks,
         --  directly from input message data
         if Msg_Byte_Count > 64 then

            --  Number of full blocks to process
            Block_Count := (Msg_Byte_Count - 1) / 64;

            -- Skein_512_Process_Block
            --   (Ctx,
            --    Msg,
            --    Current_Msg_Offset,
            --    Block_Count,
            --    64);

            Bytes_Hashed := Block_Count * 64;

            Msg_Byte_Count     := Msg_Byte_Count     - Bytes_Hashed;

            Current_Msg_Offset := Current_Msg_Offset + Bytes_Hashed;
         end if;

      end if;

      --  Finally, there might be fewer than Skein_512_Block_Bytes_C bytes left
      --  over that are not yet hashed. Copy these to Ctx.B for processing
      --  in any subsequent call to _Update or _Final.
      Copy_Msg_To_B (Current_Msg_Offset, Msg_Byte_Count);

   end Skein_512_Update;   
   
   procedure Skein_512_Final (Ctx  : in     Skein_512_Context)
   is
      subtype Output_Byte_Count_T  is U64
        range 1 .. 15;
      subtype Output_Block_Count_T is U64
        range 0 .. 2;
      subtype Positive_Output_Block_Count_T is Output_Block_Count_T
        range 1 .. 2;

      Local_Ctx          : Skein_512_Context;
      N                  : U64;
      Blocks_Required    : Positive_Output_Block_Count_T;
      Byte_Count         : Output_Byte_Count_T;
      X                  : Skein_512_State_Words;
      Tmp_B              : Skein_512_Block_Bytes;
      Tmp_Byte_Count_Add : U64;

      procedure Zero_Pad is
	 I : Skein_512_Block_Bytes_Index;
      begin
	 I := Local_Ctx.H.Byte_Count;
	 while I <= 63 loop
            Local_Ctx.B (I) := 0;
	    I := I + 1;
         end loop;
      end Zero_Pad;

      procedure Set_Counter (Counter : in U64) is
      begin
         Local_Ctx.B (0) := Counter; -- Byte (Counter and 16#FF#);
         Local_Ctx.B (1) := Counter; -- Byte (Shift_Right (Counter, 8)  and 16#FF#);
         Local_Ctx.B (2) := Counter; -- Byte (Shift_Right (Counter, 16) and 16#FF#);
         Local_Ctx.B (3) := Counter; -- Byte (Shift_Right (Counter, 24) and 16#FF#);
         Local_Ctx.B (4) := Counter; -- Byte (Shift_Right (Counter, 32) and 16#FF#);
         Local_Ctx.B (5) := Counter; -- Byte (Shift_Right (Counter, 40) and 16#FF#);
         Local_Ctx.B (6) := Counter; -- Byte (Shift_Right (Counter, 48) and 16#FF#);
         Local_Ctx.B (7) := Counter; -- Byte (Shift_Right (Counter, 56) and 16#FF#);
      end Set_Counter;
      
      Blocks_Done : Positive_Output_Block_Count_T;
   begin
      Local_Ctx := Ctx;

      Local_Ctx.H.Tweak_Words.Final_Block := True; -- Tag as the final block
      if (Local_Ctx.H.Byte_Count < 64) then
         Zero_Pad;
      end if;

      Tmp_B := Local_Ctx.B;
      Tmp_Byte_Count_Add := Local_Ctx.H.Byte_Count;

      -- Skein_512_Process_Block (Ctx             => Local_Ctx,
      --                          Block           => Tmp_B,
      --                          Starting_Offset => 0,
      --                          Block_Count     => 1,
      --                          Byte_Count_Add  => Tmp_Byte_Count_Add);

      --  Now output the result
      --  Compute the yotal number of output bytes
      Byte_Count := (Local_Ctx.H.Hash_Bit_Len + 7) / 8;

      --  Run Threefish in "counter mode" to generate more output

      --  Zero out Local_Ctx.B, so it can hold the counter
      -- Local_Ctx.B := Skein_512_Block_Bytes'(others => 0);
      X := Local_Ctx.X; -- Keep a local copy of counter mode "key"

      Blocks_Required := (Byte_Count + 63) / 64;
      
      Blocks_Done := 1;
      while Blocks_Done <= Blocks_Required - 1 loop
	 
         Set_Counter (Blocks_Done);

         --  Run "Counter Mode"
         Tmp_B := Local_Ctx.B;
         -- Skein_512_Process_Block (Ctx             => Local_Ctx,
         --                         Block           => Tmp_B,
         --                         Starting_Offset => 0,
         --                         Block_Count     => 1,
         --                         Byte_Count_Add  => 8);

         --  Number of output bytes left to go
         N := Byte_Count - (Blocks_Done * 64);
         if (N >= 64) then
            N := 64;
         end if;
	 
	 Blocks_Done := Blocks_Done + 1;
         --  Push the output Local_Ctx.X into output buffer Hash
         -- Put_64_LSB_First
         --  (Dst          => Hash,
         --   Dst_Offset   => Blocks_Done * Skein_512_Block_Bytes_C,
         --   Src          => Local_Ctx.X,
         --   Byte_Count   => N);

         Local_Ctx.X := X; -- restore the counter mode key for next time
	 
      end loop;

   end Skein_512_Final;
   
end Skein;
