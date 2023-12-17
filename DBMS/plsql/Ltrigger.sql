set serveroutput on;

create or replace trigger lavanyatrigger
before update on emp
FOR EACH ROW 
WHEN (NEW.empno > 0) 
declare
    sal_diff number;
begin
    dbms_output.put_line('Trigger being executed made by Lavanya ');
    sal_diff := :new.sal - :old.sal;
    dbms_output.put_line(sal_diff);
end;
/