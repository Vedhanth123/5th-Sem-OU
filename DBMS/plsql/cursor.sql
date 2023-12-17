set serveroutput on;

declare
    eno emp.empno%type;
    enam emp.ename%type;
    cursor lavanyacursor is
        select empno, ename from emp;
    
begin
    open lavanyacursor;
    loop
        fetch lavanyacursor into eno, enam;
        exit when lavanyacursor%notfound;
        dbms_output.put_line(eno || enam);
    end loop;
    close lavanyacursor;
end;
/

