set serveroutput on;

-- 3 blocks

-- 1) declare
-- 2) execution section
-- 3) exeception

declare
    -- we create variables in this blocks
    var varchar2(20); -- declare
    var2 varchar2(40) := 'Lavanya is a good girl';

begin
    -- we write code in here
    var := 'Vedhanth';
    dbms_output.put_line(var || '  ' || var2);
end;
/
