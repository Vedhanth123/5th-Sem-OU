@emp.sql;
set wrap off;
set lines 50;
set linesize 150;


-- 1st question 
select * from emp;
select lower(ename) from emp;

-- 2nd question
select initcap(ename) from emp;

-- 3rd question
select upper(ename) from emp;

-- 4th question
select concat(ename, deptno) from emp;

-- 5th question
select ename||deptno from emp;

-- 6th question 
select concat(ename, empno, deptno) from emp;
prompt concat function accepts only two arguments;

select concat(ename, empno) from emp;

-- 7th question
select LENGTH(job), LENGTH(ename) from emp;

-- 8th question 
select length('string') from dual;

-- 9th question 
select lengthb('String121') from dual;

-- 10th question
select ename, lengthb(ename) from emp;

-- 11th question
select ename, instr(ename ,'A') from emp;
select ename, instr(ename ,'a') from emp;

prompt Observation: 'a' is not detected from the table but 'A' is detected. Because in the table values are in the uppercase;

-- 12th question
select ename,lpad(ename,12) from emp;
select ename,lpad(ename,12,'-') from emp;

prompt lpad function making the string length to 12 by adding the specified character at the left 

-- 13th question
select substr(ename,1,3) from emp;

-- 14th question
select substr(ename, length(ename)-1,2) from emp;

-- 15th question
select ename, instr(ename,'A',1,1) from emp;

-- 16th question
select ename, instr(ename,'A',1,2) from emp;

-- 17th question
select ename from emp where (regexp_count(ename,'A'))>=2;

-- 18th question
SELECT lower(upper(initcap('Hello World'))) FROM dual;
prompt Observation: all the letters are in lowercase;

-- 19th question
SELECT lower(upper(initcap('Hello World') )) FROM dual;
--prompt Observation: all the letters are in lowercase;

-- 20th question
SELECT lower (100+100) FROM dual;
prompt Observation: addition is result is displayed;

-- 21th question
SELECT upper (lower (sysdate)) FROM dual;
prompt Observation: sysdate is in uppercase;

-- 22nd question
SELECT CONCAT ('Today is :', SYSDATE) FROM dual;
prompt concated string is displayed;

-- 23rd question
SELECT CONCAT(first_name, CONCAT (last_name, job_id)) FROM dual;

-- 24th question 
SELECT LENGTH('It is a lovely day today!') FROM dual;

-- 25th question
prompt LPAD and RPAD take maximum of 3 arguments. If there are 2 arguments given, the padding happens by spaces;


-- 26th question
SELECT lpad (1000 +300.66, 14, '*') FROM dual;

-- 27th question
SELECT replace(9999.00-1,'8',88) FROM dual;

-- 28th question
select round(148.50) FROM dual;

-- 29th question
SELECT SYSDATE,trunc(sysdate,'mon') FROM dual;

-- 30th question
SELECT trunc(1902.92,-3) FROM dual;

-- 31st question
SELECT mod(100.23,-3) FROM dual;

-- 32nd question
prompt first parameter is th number to rounded and second parameter is no. of decimals to be rounded;

-- 33rd question
select ltrim('   name') from dual;
select ltrim('  name    ') from dual;
select ltrim('000123','0') from dual;
select ltrim('1000123','0') from dual;

-- 34th question
select replace('JACK and JUE', 'J','BL') Changes from dual;

-- 35th question
select mod(333,2) from dual;

-- 36th question
select round(3344.45324,3) from dual;
select round(3344,-1) from dual;

-- 37th question
select trunc(SYSDATE,'y') from dual;

-- 38th question
select sqrt(242342) from dual;

-- 39th question
select floor(1423.9942) from dual;

-- 40th question
select ceil(1423.9942) from dual;

-- 41th question
select log(10,10) from dual;

prompt ------------------------- Aggregate function -------------------------;

-- 42nd question
select max(sal) from emp;

-- 43rd question
select max(sal) from emp where sal<(select max(sal) from emp);

-- 44th question
select avg(sal) from emp where deptno=30;

-- 45th question
select count(*) from emp where deptno in (20,30);

-- 46th question
select deptno,max(sal) from emp group by deptno;

-- 47th question
select deptno, count(*) from emp group by deptno;

-- 48th question
select deptno, sum(sal) from emp group by deptno;

-- 49th question
select deptno, count(*) from emp group by deptno having count(*) > 30;

-- 50th question
select deptno, count(*) from emp group by deptno;

-- 51th question
select max(sal) from emp where job='CLERK';

-- 52nd question
select max(sal) from emp where deptno=20;

-- 53rd question
select min(sal) from emp where job='SALESMAN';

-- 54th question
select avg(sal) from emp where job = 'MANAGER';

-- 55th question 
select sum(sal) from emp where job = 'ANALYST' and deptno=40;

-- 56th question
select job,count(*) from emp group by job;