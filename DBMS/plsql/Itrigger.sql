set serveroutput on;

create or replace trigger inserttrigger
before insert on emp
for each ROW
when (new.empno > 0)
declare
    new_sal number;
begin
    if(old.sal < 1000) 
    then
        new_sal := :old.sal + 500;
    end if;
    insert into emp values(old.empno, old.ename, old.job, old.mgr, old.hiredate, new_sal, old.comm, old.deptno);
end;
/