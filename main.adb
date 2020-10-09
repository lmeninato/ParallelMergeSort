with Text_IO;
use Text_IO;
with Msort;

procedure Main is
    package Int_IO is new Integer_IO(Integer);
    use Int_IO;
    use Msort;

    val: Integer;
    count: Integer := 0;
    Arr: t_Array (Index(1) .. Index(LENGTH));

    task Printer is
        entry Start;
        entry PrintSumStart;
    end Printer;

    task body Printer is
    begin
        accept Start;
        for i in Arr'Range loop
            Put(t_Int'Image (Arr(i)) & " ");
        end loop;
        new_line;
        accept PrintSumStart;
        Put_Line(Integer'Image (count));
    end Printer;

    task Sum is
        entry Start;
    end Sum;

    task body Sum is
    begin
        accept Start;
        for i in Arr'Range loop
            count := count + Integer(Arr(i));
        end loop;
    end Sum;

    task Reader;

    task body Reader is
    begin
        for i in Arr'Range loop
            Get(val);
            Arr(i) := t_Int(val);
        end loop;
        Printer.PrintSumStart;
    end Reader;

begin
    null;
    sort(Arr);
    Printer.Start;
    Sum.Start;
end Main;
