set serveroutput on;

declare
    cent number;
    fah number;
begin
    fah := &fah;
    cent := ((fah-32)/1.8);
    dbms_output.put_line(cent);
end;
/