declare
    var emp.ename%TYPE;
begin
    select ename into var from emp where empno = 7844;
    dbms_output.put_line(var);
end;
/

