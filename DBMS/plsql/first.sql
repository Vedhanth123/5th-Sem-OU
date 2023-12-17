set serveroutput on;

declare
    v varchar2(15) := 'hello world';
    b varchar2(15);

begin
    b := 'joker';
    dbms_output.put_line(b);
    dbms_output.put_line(v);
end;
/