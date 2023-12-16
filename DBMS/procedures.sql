set serveroutput on;
declare
    my_var varchar2(20);
begin
    my_var := 'Hello World';
    dbms_output.put_line(my_var);
end;
/