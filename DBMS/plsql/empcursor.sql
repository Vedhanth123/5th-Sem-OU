set serveroutput on;

declare

    eno emp.empno%type;
    enam emp.ename%type;
    cursor mgrcursor is
        select empno, ename from emp where mgr = &mgr;
    mgr emp.mgr%type;
    
begin

    open mgrcursor;

    loop
        fetch mgrcursor into eno, enam;
        exit when mgrcursor%notfound;
        dbms_output.put_line(eno || '  ' || enam);
    end loop;
    close mgrcursor;
end;
/
