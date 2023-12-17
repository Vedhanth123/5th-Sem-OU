set serveroutput on;

declare
    str varchar2(20);
    str2 varchar2(20);
    len number;
begin

    str := '&str';

    len := length(str);

    for i in reverse 1..len 
    loop
        str2 := str2 || substr(str, i, 1);

    end loop;

    if (str = str2) 
    then
        dbms_output.put_line('They are palindrome');
    else
        dbms_output.put_line('They are not palindrome');
    end if;

end;
/
