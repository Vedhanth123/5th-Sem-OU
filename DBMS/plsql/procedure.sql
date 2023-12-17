set serveroutput on;

declare 

    a number;
    b number;
    c number;
    procedure lavanyaprocedure(x in number, y in number, z out number) is
    begin
        z := x + y;
    end;
begin
    a := &a;
    b := &c;
    lavanyaprocedure(a, b, c);
    dbms_output.put_line(c);
end;
/
