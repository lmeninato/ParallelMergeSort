with Text_IO;
use Text_IO;
with Msort;

procedure Main is
    package Int_IO is new Integer_IO(Integer);
    use Int_IO;
    use Msort;

    val: Integer;
    Arr: t_Array (Index(1) .. Index(LENGTH));

    task Reader;

    task Printer is
        entry Start;
    end Printer;

    task body Reader is
    begin
        for i in Arr'Range loop
            Get(val);
            Arr (i) := t_Int(val);
        end loop;
        sort(Arr, Arr'First, Arr'Last);
        Printer.Start;
    end Reader;

    task body Printer is
    begin
        accept Start;
        for i in Arr'Range loop
            Put_Line(t_Int'Image (Arr (i)));
        end loop;
    end Printer;

begin
    null;
end Main;
