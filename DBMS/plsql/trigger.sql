
drop table joker;

create table joker(name varchar2(20));

---- 
--- DML Trigger
set serveroutput on;
create or replace trigger t1 
before insert on joker
for each row
enable
declare
    user varchar2(20);
begin
    select name into user from dual;
    dbms_output.put_line(name);
end;
/