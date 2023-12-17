SET serveroutput ON;
declare
    v number(8); 
begin
    select SAL into v from EMP where EMPNO = 7844;
    dbms_output.put_line(V);

end;
/

declare
    V_SAL NUMBER(8);
    V_FNAME VARCHAR(20);
begin
    select SAL,ENAME into V_SAL, V_FNAME from EMP where EMPNO = 7844;
    dbms_output.put_line(V_SAL || ' HAS NAME ' || V_FNAME);
END;
/