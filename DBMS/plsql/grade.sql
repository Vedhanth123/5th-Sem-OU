set serveroutput on;

declare
    names emp.ename%type;
    eno emp.empno%type;
    cursor gradecursor is
        select empno, ename from emp where grade = &grade;
    grade emp.grade%type;

begin
    open gradecursor;
    loop
        fetch gradecursor into eno, names;
        exit when gradecursor%notfound;
        dbms_output.put_line(names || '    ' || eno);
    end loop;
    close gradecursor;
end;
/