package Msort is
    LENGTH: constant Integer := 40;
    type t_Int is range -300 .. 300;
    type Index is range 1 .. LENGTH;
    type t_Array is array (Index range <>) of t_Int;
    procedure sort(Arr: in out t_Array; low: Index; high: Index);
    function merge(Left: t_Array; Right: t_Array) return t_Array;
end Msort;
