set serveroutput on;

declare

var1 number := 100;
var2 number := 200;

begin

dbms_output.put_line(var1 + var2);

end;
/