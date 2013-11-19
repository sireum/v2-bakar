package Sort_Simple_Contract
is
  Max_Elements : constant := 3;
        
  subtype Index_Type is Integer range 1 .. Max_Elements;
  type Vector is array(Index_Type) of Integer;
        
  function isSorted(Z : Vector) return Boolean
      with Post => isSorted'Result;
  
  function isPerm(A, B : Vector) return Boolean;
  function isSet(A : Vector) return Boolean;
        
  procedure BubbleSort(A : in out Vector) with
    Depends => (A => A),
    --Pre => isSet(A),
    Post => isSorted(A) and then isPerm(A, A'Old);
        
  procedure BubbleSort_using_SwapElements(A : in out Vector) with
    Depends => (A => A),
    --Pre => isSet(A),      
    Post => isSorted(A) and then isPerm(A, A'Old);  
            
  procedure InsertionSort(A : in out Vector) with
    Depends => (A => A),
    --Pre => isSet(A),      
    Post => isSorted(A) and then isPerm(A, A'Old);  
        
  procedure SelectionSort(A : in out Vector) with
    Depends => (A => A),
    --Pre => isSet(A),      
    Post => isSorted(A) and then isPerm(A, A'Old);
        
  procedure ShellSort(A : in out Vector) with
    Depends => (A => A),
    --Pre => isSet(A),      
    Post => isSorted(A) and then isPerm(A, A'Old);
            
end Sort_Simple_Contract;