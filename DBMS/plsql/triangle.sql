-- find are of triangle scalene triangle

-- a,b,c 
-- s = a+b+c/2
-- sqrt(s*s-a*s-b*s-c)

set serveroutput on;

declare
    a number;
    b number;
    c number;
    s number;
    area number;
begin
    a := &a;
    b := &b;
    c := &c;
    s := a+b+c/2;
    area := sqrt(s*(s-a)*(s-b)*(s-c));
    dbms_output.put_line('The area of triangle ' || area);
end;
/

