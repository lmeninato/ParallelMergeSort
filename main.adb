with Text_IO;
use Text_IO;
with Msort;

procedure Main is
    package Int_IO is new Integer_IO(Integer);
    use Int_IO;
    use Msort;

    val: Integer;
    Arr: t_Array (Index(1) .. Index(LENGTH));

    task Printer is
        entry Start;
    end Printer;

    task body Printer is
    begin
        accept Start;
        for i in Arr'Range loop
            Put_Line(t_Int'Image (Arr(i)));
        end loop;
    end Printer;

    task Sum is
        entry Start;
    end Sum;

    task body Sum is
        count : Integer := 0;
    begin
        accept Start;
        for i in Arr'Range loop
            count := Integer(Arr(i));
        end loop;
    end Sum;

    task Reader;

    task body Reader is
    begin
        for i in Arr'Range loop
            Get(val);
            Arr(i) := t_Int(val);
        end loop;
    end Reader;

begin
    null;
    sort(Arr);
    Printer.Start;
    Sum.Start;
end Main;
