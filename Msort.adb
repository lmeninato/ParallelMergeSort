with Text_IO;
use Text_IO;

package body Msort is

    procedure sort(Arr: in out t_Array; low: Index; high: Index) is
        package Int_IO is new Integer_IO(Integer);
        use Int_IO;
        middle: Index;
    begin
        if low + 1 <= high then
            middle := (high+low)/2;
            declare
                Left: t_Array(Arr'First .. middle) := Arr(Arr'First .. middle);
                Right: t_Array(middle+1 .. Arr'Last) := Arr(middle+1 .. Arr'Last);
            begin
                sort(Left, Arr'First, middle);
                sort(Right, middle+1, Arr'Last);
                Arr := merge(Left, Right);
            end;
        end if;
    end sort;

    function merge(Left: t_Array; Right: t_Array) return t_Array is
        package Int_IO is new Integer_IO(Integer);
        use Int_IO;

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
