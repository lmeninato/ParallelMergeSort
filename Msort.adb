with Text_IO;
use Text_IO;

package body Msort is

    task type t_sort is
        entry start(Arr: in out t_Array; low: Index; high: Index);
    end t_sort;

    task body t_sort is
    begin
        loop
            select
                accept start(Arr: in out t_Array; low: Index; high: Index) do
                    mergesort(Arr, low, high);
                end start;
                or
                    terminate;
            end select;
        end loop;
    end t_sort;

    procedure call_t_sort(Arr: in out t_Array; low: Index; mid: Index; high: Index) is
    leftsort:t_sort;
    rightsort:t_sort;
    begin
        leftsort.start(Arr, low, mid);
        rightsort.start(Arr, mid+1, high);
    end call_t_sort;

    procedure mergesort(Arr: in out t_Array; low: Index; high: Index) is
    middle : Index;
    begin
        if low + 1 <= high then
            middle := (high+low)/2;
            call_t_sort(Arr, low, middle, high);
            declare
                Left: t_Array(low .. middle) := Arr(low .. middle);
                Right: t_Array(middle+1 .. high) := Arr(middle+1 .. high);
            begin
                Arr(low .. high) := merge(Left, Right);
            end;
        end if;
    end mergesort;

    procedure sort(Arr: in out t_Array) is
    begin
        mergesort(Arr, Arr'First, Arr'Last);
    end sort;

    function merge(Left: t_Array; Right: t_Array) return t_Array is
        left_i: Integer := Integer(Left'First);
        right_i: Integer := Integer(Right'First);
        arr_i: Integer := Integer(Left'First);
        Arr: t_Array(Left'First .. Right'Last);
    begin
        while left_i <= Integer(Left'Last) and right_i <= Integer(Right'Last) loop
           if Left(Index(left_i)) <= Right(Index(right_i)) then
              Arr(Index(arr_i)) := Left(Index(left_i));
              left_i := left_i + 1;
           else
              Arr(Index(arr_i)) := Right(Index(right_i));
              right_i := right_i + 1;
           end if;
           arr_i := arr_i + 1;
        end loop;
        if left_i <= Integer(Left'Last) then
           Arr(Index(arr_i)..Arr'Last) := Left(Index(left_i)..Left'Last);
        end if;
        if right_i <= Integer(Right'Last) then
           Arr(Index(arr_i)..Arr'Last) := Right(Index(right_i)..Right'Last);
        end if;
        return Arr;
    end merge;

end Msort;
