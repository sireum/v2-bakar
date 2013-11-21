-- a few different ways of declaring a 3 dim array

package Array_Dim_Fun
  with SPARK_Mode
is
  subtype Index is Integer range 1 .. 10;
  
  ------------------------------------------------------------------------------
  -- a 3-dimensional multidim array
  ------------------------------------------------------------------------------  
  type Matrix is array(Index, Index, Index) of Integer;
  
  matrixConst : constant Matrix :=
    Matrix'(1 .. 5 => (1 .. 5 => (1 .. 5 =>  10,
                                  others =>  20),
                       others => (others =>  30)),
            6 .. 9 => (others => (others => -66)),
            others => (others => (others => -77))
    );

  ------------------------------------------------------------------------------
  -- a more java like array of arrays of arrays
  ------------------------------------------------------------------------------  
  type rank1 is array(Index) of Integer;
  type rank2 is array(Index) of rank1;
  type rank3 is array(Index) of rank2;
  
  rank3Const : constant rank3 :=
    rank3'(1 .. 5 => rank2'(1 .. 5 => rank1'(1 .. 5 =>  10,
                                             others =>  20),
                            others => rank1'(others =>  30)),
           6 .. 9 => rank2'(others => rank1'(others => -66)),
           others => rank2'(others => rank1'(others => -77))
    );

  ------------------------------------------------------------------------------
  -- an array of 2-dimensional multidim arrays
  ------------------------------------------------------------------------------  
  type mix1 is array(Index, Index) of Integer;
  type mix2 is array(Index) of mix1;
    
  mix2Const : constant mix2 :=
    mix2'(1 .. 5 => mix1'(1 .. 5 => (1 .. 5 =>  10,
                                     others =>  20),
                          others => (others =>  30)),
          6 .. 9 => mix1'(others => (others => -66)),
          others => mix1'(others => (others => -77))
    );
    
  procedure dummy(A : in out Matrix; X,Y,Z : Index) with
    Depends => (A => (A, X, Y, Z));
    --# derives A from A,X,Y,Z;
  
  procedure dummy2(A : in out rank3; X,Y,Z : Index) with
        Depends => (A => (A, X, Y, Z));
    --# derives A from A,X,Y,Z;
    
  procedure dummy3(A : in out mix2; X,Y,Z : Index) with
    Depends => (A => (A, X, Y, Z));
    --# derives A from A,X,Y,Z;
  
end Array_Dim_Fun;
