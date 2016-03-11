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

package Tetris_Functional
  
is
   --  possible content of the board cells
   -- type Cell is (Empty, I, O, J, L, S, T, Z);
   type Cell is new Integer range 0 .. 8;

   --  subset of cells that correspond to a shape
   -- subtype Shape is Cell range I .. Z;
   subtype Shape is Cell range 1 .. 8;

   --  subset of shapes that fits in a 3 x 3 box, that is, all expect I and O
   -- subtype Three_Shape is Cell range J .. Z;
   subtype Three_Shape is Cell range 3 .. 8;

   --  the board is a matrix of X_Size x Y_Size cells, where the origin (1,1)
   --  is at the top left corner

   --X_Size : constant := 10;
   --Y_Size : constant := 50;

   subtype X_Coord is Integer range 1 .. 10;
   subtype Y_Coord is Integer range 1 .. 50;

   type Line is array (X_Coord) of Cell;
   type Board is array (Y_Coord) of Line;

   Cur_Board : Board;

   --  the current piece has a shape, a direction, and a coordinate for the
   --  top left corner of the square box enclosing the piece:
   --    a 2 x 2 box for shape O
   --    a 3 x 3 box for all shapes except I and O
   --    a 4 x 4 box for shape I

   subtype PX_Coord is Integer range -1 .. 9;
   subtype PY_Coord is Integer range -1 .. 49;

   -- type Direction is (North, East, South, West);
   type Direction is new Integer range 0 .. 3;

   type Piece is record
      S : Shape;
      D : Direction;
      X : PX_Coord;
      Y : PY_Coord;
   end record;

   Cur_Piece : Piece;

   --  the game loops through the following states:
   --    . a piece is falling, in which case Cur_Piece is set to this piece
   --    . the piece Cur_Piece is blocked by previous fallen pieces in the
   --      board Cur_Board
   --    . the piece has been included in the board, which may contain complete
   --      lines that need to be deleted
   --    . complete lines have been deleted from the board

   -- type State is (Piece_Falling, Piece_Blocked, Board_Before_Clean, Board_After_Clean) with Ghost;
   type State is new Integer range 0 .. 3;

   -- Cur_State : State with Ghost;
   Cur_State : State;

   --  orientations of shapes are taken from the Super Rotation System at
   --  http://tetris.wikia.com/wiki/SRS
   --    shape O has no orientation
   --    shape I has 4 orientations, which all fit in the 4 x 4 box
   --    shapes except I and O have 4 orientations, which all fit in the 3 x 3 box

   --  Note that Possible_I_Shapes and Possible_Three_Shapes should be accessed
   --  with Y component first, then X component, so that higher value for
   --  Direction correspond indeed to clockwise movement.

   subtype I_Delta is Integer range 0 .. 3;
   type Oriented_I_Shape is array (I_Delta, I_Delta) of Boolean;
   subtype Three_Delta is Integer range 0 .. 2;
   type Oriented_Three_Shape is array (Three_Delta, Three_Delta) of Boolean;
   
   procedure Possible_I_Shapes (Cur_Piece_D: in Direction; X: in I_Delta; Y: in I_Delta; R: out Boolean);
   
   procedure Possible_Three_Shapes (Cur_Piece_S: in Shape; Cur_Piece_D: in Direction; X: in I_Delta; Y: in I_Delta; R: out Boolean);   
   
   --  the configuration of the board and piece should always be valid, meaning
   --  the piece and the board should not overlap, and the piece should fit in
   --  the board limits.
   
   procedure Is_Empty (B : in Board; Y : in Integer; X : in Integer; R: out Boolean);

   procedure Is_Complete_Line (L : in Line; R: out Boolean);

   procedure Is_Empty_Line (L : in Line; R: out Boolean);

   procedure No_Complete_Lines (B : in Board; R: out Boolean);
   
   
   procedure No_Overlap (B : in Board; P : in Piece; R: out Boolean);

   --  movements of the piece in the 3 possible directions

   -- type Action is (Move_Left, Move_Right, Move_Down, Turn_Counter_Clockwise, Turn_Clockwise);
   type Action is new Integer range 0 .. 4;

   subtype Move_Action is Action range 0 .. 1;
   subtype Turn_Action is Action range 3 .. 4;

   procedure Turn_Direction (D : in Direction; T : in Turn_Action; R: out Direction);

   procedure Move_Is_Possible (P : in Piece; A : in Action; R: out Boolean);

   procedure Move (P : in Piece; A : in Action; R: out Piece);

   procedure Do_Action (A : Action; Success : out Boolean);
   
   procedure Include_Piece_In_Board;
   --  transition from state where a piece is falling to its integration in the
   --  board when it cannot fall anymore.

   procedure Delete_Complete_Lines;   
   
end Tetris_Functional;
