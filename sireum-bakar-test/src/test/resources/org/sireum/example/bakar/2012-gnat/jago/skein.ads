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

package Skein
is
   -- every subtype is devided by 2, as now the formalized SPARK supports 32 bits
   subtype Byte is Integer range 0 .. 16;
   subtype U16 is Integer range 0 .. 256; -- Interfaces.Unsigned_8;
   subtype U32 is Integer range 0 .. 65536; -- Interfaces.Unsigned_16;
   subtype U64 is Integer range 0 .. 2147483647; -- 2^31, Interfaces.Unsigned_32;

   -------------------------------------------------------------------
   --  Types common to all block sizes
   -------------------------------------------------------------------

   subtype I3   is U64 range 0 .. 2;
   subtype I4   is U64 range 0 .. 3;
   subtype I6   is U64 range 0 .. 5;
   subtype I7   is U64 range 0 .. 6;
   subtype I8   is U64 range 0 .. 7;
   subtype I9   is U64 range 0 .. 8;
   subtype I16  is U64 range 0 .. 15;
   subtype I64  is U64 range 0 .. 63;
   subtype I128 is U64 range 0 .. 127;

   type Byte_Seq is array (U64) of Byte;
   -- for Byte_Seq'Alignment use 8;

   type Byte_Seq_4   is array (I4) of Byte; -- Byte_Seq (I4);
   type Byte_Seq_8   is array (I8) of Byte; -- Byte_Seq (I8);
   type Byte_Seq_16  is array (I16) of Byte; -- Byte_Seq (I16);
   type Byte_Seq_64  is array (I64) of Byte; -- Byte_Seq (I64);
   type Byte_Seq_128 is array (I128) of Byte; -- Byte_Seq (I128);

   --  2**31 bytes is 2**28 64-bit words (replace: 2**64 bytes is 2**61 64-bit words)
   subtype Word_Count_T is U64 range 0 .. 268435455;
   subtype Positive_Word_Count_T is U64 range 1 .. 268435455;

   type U64_Seq is array (Word_Count_T) of U64;
   --for U64_Seq'Alignment use 8;

   type U64_Seq_3  is array (I3) of U64; -- U64_Seq (I3);
   type U64_Seq_4  is array (I4) of U64; -- U64_Seq (I4);
   type U64_Seq_8  is array (I8) of U64; -- U64_Seq (I8);
   type U64_Seq_9  is array (I9) of U64; -- U64_Seq (I9);
   type U64_Seq_16 is array (I16) of U64; -- U64_Seq (I16);

   --  We limit the length of the output hash to U64'Last - 7 to
   --  avoid overflow in the calculation of the number of bytes needed
   --  in Skein_512_Final. This is an undocumented limitation of reference
   --  implementation in C.  The value 0 is used to indicate a context
   --  that has not yet been initialized.
   subtype Hash_Bit_Length is U64 range 0 .. 120;

   subtype Initialized_Hash_Bit_Length is Hash_Bit_Length
     range 1 .. 120;

   -------------------------------------------------------------------
   --  Constants and types specific to Skein_512
   -------------------------------------------------------------------


   subtype Skein_512_State_Words_Index is U64
     range 0 .. 7;

   type Skein_512_State_Words is array (Skein_512_State_Words_Index) of U64; -- U64_Seq (Skein_512_State_Words_Index);

   subtype Skein_512_Block_Bytes_Count is U64
     range 0 .. 64;
   subtype Skein_512_Block_Bytes_Index is U64
     range 0 .. 63;
   type Skein_512_Block_Bytes is array (Skein_512_Block_Bytes_Index) of Byte; -- Byte_Seq (Skein_512_Block_Bytes_Index);

   subtype Skein_512_State_Bytes_Index is U64
     range 0 .. 63;
   type Skein_512_State_Bytes is array (Skein_512_State_Bytes_Index) of Byte; -- Byte_Seq (Skein_512_State_Bytes_Index);

   --  2**31 bytes is 2**25 512-bit blocks (to replace: 2**64 bytes is 2**58 512-bit blocks)
   subtype Block_512_Count_T is U64 range 0 .. 33554431;
   subtype Positive_Block_512_Count_T is U64
     range 1 .. 33554431;

   
   procedure Put_64_LSB_First (Dst        : in out Byte_Seq;
                               Dst_Offset : in     U64;
                               Src        : in     U64_Seq;
                               Byte_Count : in     U64);
   
   procedure Get_64_LSB_First (Dst        :    out U64_Seq;
                               Src        : in     Byte_Seq;
                               Src_Offset : in     U64);
   

   Skein_Max_State_Words_C : constant := 16;

   --  number of modifier (tweak) words
   Skein_Modifier_Words_C  : constant :=  2;

   subtype Modifier_Words_Index is U64
     range 0 .. 1;
   type Modifier_Words is array (Modifier_Words_Index) of U64; -- U64_Seq (Modifier_Words_Index);
   
   subtype U6 is Integer range 0 .. 63; -- type U6 is mod 2**6;
   subtype U7 is Integer range 0 .. 127; -- type U7 is mod 2**7;

   --  NOTE - in the declaration of three "one bit" fields here, it seem
   --  more natural to use Boolean than a modular integer types.  To meet
   --  the Skein spec, this relies on the fact that False is represented
   --  by the value 0, and True is represented by the value 1.
   --
   --  This behaviour is implied by AARM 13.4(8) and is known to be OK
   --  for all known implementations.
   type Tweak_Value is record
      Byte_Count_LSB : U64;
      Byte_Count_MSB : U32;
      Reserved       : U16;
      Tree_Level     : U7;
      Bit_Pad        : Boolean;
      Field_Type     : U6;
      First_Block    : Boolean;
      Final_Block    : Boolean;
   end record;

   --  Context header common to all block sizes
   type Context_Header is record
      Tweak_Words  : Tweak_Value;

      --  size of hash result, in bits.  0 = not yet initialized
      Hash_Bit_Len : Hash_Bit_Length;

      --  Current byte count in buffer - actual range depends on
      --  block size.
      --   In Skein_256,  Byte_Count is range 0 .. 32;
      --   In Skein_512,  Byte_Count is range 0 .. 64;
      --   In Skein_1024, Byte_Count is range 0 .. 128;
      --
      --  These constraints are asserted as preconditions
      --  on the specific _Init, _Update, and _Final
      --  procedures above for each block size.
      Byte_Count   : U64;
   end record;

   -------------------------------------------------------------------
   --  Constants and types specific to Skein_512
   -------------------------------------------------------------------

   type Skein_512_Context is record -- 512-bit Skein hash context structure
      H : Context_Header;        -- common header context variables
      X : Skein_512_State_Words; -- chaining variables
      B : Skein_512_Block_Bytes; -- partial block buffer (8-byte aligned)
   end record;

end Skein;
