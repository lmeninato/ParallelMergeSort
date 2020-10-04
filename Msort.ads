package Msort is
    LENGTH: constant Integer := 40;
    type t_Int is range -300 .. 300;
    type Index is range 1 .. LENGTH;
    type t_Array is array (Index range <>) of t_Int;
    procedure call_t_sort(Arr: in out t_Array; low: Index; mid: Index; high: Index);
    procedure mergesort(Arr: in out t_Array; low: Index; high: Index);
    procedure sort(Arr: in out t_Array);
    function merge(Left: t_Array; Right: t_Array) return t_Array;
end Msort;
