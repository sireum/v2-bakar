------------------------------------------------------------------------------
--                                                                          --
--                             GNAT EXAMPLE                                 --
--                                                                          --
--                      Copyright (C) 2014, AdaCore                         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

package body Tetris_Functional
  
is
   procedure Is_Empty (B : in Board; Y : in Integer; X : in Integer; R: out Boolean) is
   begin
      R := True;
   end Is_Empty;

   procedure Is_Complete_Line (L : in Line; R: out Boolean) is 
   begin
      R := True;
   end Is_Complete_Line;

   procedure Is_Empty_Line (L : in Line; R: out Boolean) is 
   begin
      R := True;
   end Is_Empty_Line;

   procedure No_Complete_Lines (B : in Board; R: out Boolean) is 
   begin
      R := True;
   end No_Complete_Lines;
   
   procedure Possible_I_Shapes (Cur_Piece_D: in Direction; X: in I_Delta; Y: in I_Delta; R: out Boolean) is
   begin
      R := True;
   end Possible_I_Shapes;
   
   procedure Possible_Three_Shapes (Cur_Piece_S: in Shape; Cur_Piece_D: in Direction; X: in I_Delta; Y: in I_Delta; R: out Boolean) is
   begin
      R := True;
   end Possible_Three_Shapes;   
   
   ----------------------------
   -- Include_Piece_In_Board --
   ----------------------------
   
   procedure Include_Piece_In_Board is
      Y : I_Delta := 0;
      X : I_Delta := 0;
      R : Boolean;
   begin
      if Cur_Piece.S = 2 then -- O
	 Cur_Board (Cur_Piece.Y) (Cur_Piece.X)         := Cur_Piece.S;
	 Cur_Board (Cur_Piece.Y + 1) (Cur_Piece.X)     := Cur_Piece.S;
	 Cur_Board (Cur_Piece.Y) (Cur_Piece.X + 1)     := Cur_Piece.S;
	 Cur_Board (Cur_Piece.Y + 1) (Cur_Piece.X + 1) := Cur_Piece.S;	 
      elsif Cur_Piece.S = 1 then -- I
	 while Y <= 3 loop
	    while X <= 3 loop
	       Possible_I_Shapes (Cur_Piece.D, Y, X, R);
	       if R then
		  Cur_Board (Cur_Piece.Y + Y) (Cur_Piece.X + X) := Cur_Piece.S;
	       end if;
	       X := X + 1;
	    end loop;
	    Y := Y + 1;
	 end loop;	 
      else -- Three_Shape
	 while Y <= 2 loop
	    while X <= 2 loop
	       Possible_Three_Shapes (Cur_Piece.S, Cur_Piece.D, Y, X, R);
	       if R then
		  Cur_Board (Cur_Piece.Y + Y) (Cur_Piece.X + X) := Cur_Piece.S;
	       end if;
	       X := X + 1;
	    end loop;
	    Y := Y + 1;
	 end loop;
      end if;

      --  update current state

      Cur_State := 2; -- Board_Before_Clean
   end Include_Piece_In_Board;

   ---------------------------
   -- Delete_Complete_Lines --
   ---------------------------
   procedure Delete_Complete_Lines is
      Empty_Line : Line;

      To_Line : Y_Coord := 10;
      Has_Complete_Lines : Boolean := False;
      Del_Line : Y_Coord := 1;
      From_Line : Y_Coord;
      R: Boolean;
   begin
      --  delete all complete lines, identifying the first complete line from
      --  the bottom (higher value of Y)
      while Del_Line <= 50 loop
	 Is_Complete_Line (Cur_Board (Del_Line), R);
         if R then
            Cur_Board (Del_Line) := Empty_Line;
            Has_Complete_Lines := True;
            To_Line := Del_Line;
         end if;
         Del_Line := Del_Line + 1;
      end loop;

      --  iteratively move non-empty lines to the bottom of the board

      if Has_Complete_Lines then
	 From_Line := 9;
         while From_Line >= 1 loop
	    Is_Empty_Line (Cur_Board (From_Line), R);
            if not R then
               Cur_Board (To_Line) := Cur_Board (From_Line);
               Cur_Board (From_Line) := Empty_Line;
               To_Line := To_Line - 1;
            end if;
	    From_Line := From_Line - 1;
         end loop;
      end if;

      --  update current state

      Cur_State := 3; -- Board_After_Clean;
   end Delete_Complete_Lines;
   
   ---------------------------
   -- Others --
   ---------------------------  
   
   procedure No_Overlap (B : in Board; P : in Piece; R: out Boolean) is
   begin
      R := True;
   end No_Overlap;
   
   procedure Turn_Direction (D : in Direction; T : in Turn_Action; R: out Direction) is
   begin
      if T = 3 then
	 if D = 0 then
	    R := 3;
	 else
	    R := D - 1;
	 end if;
      else
	 if D = 3 then
	    R := 0;
	 else
	    R := D + 1;
	 end if;
      end if;
      
   end Turn_Direction;

   procedure Move_Is_Possible (P : in Piece; A : in Action; R: out Boolean) is
   begin
      if A = 0 then
	 R := (P.X - 1) >= -1 and (P.X - 1) <= 9;
      elsif A = 1 then
	 R := (P.X + 1) >= -1 and (P.X + 1) <= 9;
      elsif A = 2 then
	 R := (P.Y + 1) >= -1 and (P.Y + 1) <= 49;
      else
	 R := True;
      end if;
   end Move_Is_Possible;

   procedure Move (P : in Piece; A : in Action; R: out Piece) is 
   begin
      if A = 0 then
	 R.X := P.X - 1;
      elsif A = 1 then
	 R.X := P.X + 1;
      elsif A = 2 then
	 R.Y := P.Y + 1;
      else
	 Turn_Direction (P.D, A, R.D);
      end if;
   end Move; 
   
   ---------------
   -- Do_Action --
   ---------------

   procedure Do_Action (A : Action; Success : out Boolean) is
      Candidate : Piece;
      Is_Move_OK: Boolean;
      Is_No_Overlap: Boolean;
   begin
      Move_Is_Possible (Cur_Piece, A, Is_Move_OK);
      if Is_Move_OK then
	 Move (Cur_Piece, A, Candidate);
	 
	 No_Overlap (Cur_Board, Candidate, Is_No_Overlap);
         if Is_No_Overlap then
            Cur_Piece := Candidate;
            Success := True;
            return;
         end if;
      end if;

      Success := False;
   end Do_Action;

end Tetris_Functional;
