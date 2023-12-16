
PROMPT -- 1 question
select Lower(ename) from emp;

PROMPT -- 2 question
select initcap(ename) from emp;

PROMPT -- 3 question
select upper(ename) from emp;

PROMPT -- 4 question
select concat(ename, deptno) from emp;

PROMPT -- 5 question
select ename||deptno from emp;

PROMPT -- 6 question
select concat(ename, empno, deptno) from emp; 
--invalid no. of arguments

PROMPT -- 7 question
select length(job), length(ename) from emp;

PROMPT --8 question
select length('string') from dual;

PROMPT --9 question
select lengthb('string') from dual;

PROMPT --19 question
select lengthb(ename) from emp;

PROMPT --11 question
select ename, instr(ename , 'A') from emp;
select ename, instr(ename, 'a') from emp;
PROMPT 'small letters are not detected'


PROMPT --12 question
select ename, lpad(ename,12) from emp;
select ename,lpad(ename,12,'-') from emp;

PROMPT --13 question
select substr(ename, 1, 3) from emp;

PROMPT --14 question
select substr(ename, length(ename)-1, 2) from emp;

PROMPT --15 question
SELECT
  INSTR(ename, 'A', 1, 1) AS FirstOccurrence,
FROM emp;

PROMPT --16 question
select 
  INSTR(ename, 'A', 1, 2) AS SecondOccurrence
from emp;

PROMPT --17 question
select ename from emp where regexp_count(ename, 'A') >= 2;

PROMPT --18 question
SELECT lower(upper(initcap('Hello World') )) FROM dual;
PROMPT hello world

PROMPT --19 question
SELECT lower(upper(initcap('Hello World') )) FROM dual;
PROMPT hello world

PROMPT --20 question
SELECT lower (100+100) FROM dual;

PROMPT --21 question
SELECT upper (lower (sysdate)) FROM dual;
PROMPT 20-MAY-13

PROMPT --22 question
SELECT CONCAT('Today is :', SYSDATE) FROM dual;
PROMPT Today is : 20-FEB-13

PROMPT --23 question
SELECT CONCAT(first_name, CONCAT (last_name, job_id)) FROM dual;
-- Leave it!!!!!!!!!!!!!!!!

PROMPT --24 question
SELECT LENGTH('It is a lovely day today!') FROM dual;


PROMPT 25)	What is the maximum number of input arguments in LPAD and RPAD functions?
PROMPT        Ans) LPAD and RPAD take maximum of 3 arguments. If there are 2 arguments given, the padding
PROMPT                  happens by spaces.

PROMPT --26 question
SELECT lpad (1000 +300.66, 14, '*') FROM dual;

PROMPT --27 question
SELECT replace(9999.00-1,'8',88) FROM dual;
-- replaces 8 with 88

PROMPT --28 question
SELECT round(148.90) FROM dual;

PROMPT --29 question
SELECT trunc (sysdate,'mon') FROM dual;

PROMPT --30 question
SELECT trunc(1902.92,-3) FROM dual;

PROMPT --31 question
SELECT mod(100.23,-3) FROM dual;

32)	 What is the maximum number of parameters the ROUND function can take?
    Ans)  2 , If there is only one parameter present, then the rounding happens to the nearest whole 
             Number


PROMPT --33 question
select ltrim('   name') from dual;
select ltrim('  name    ') from dual;
select ltrim('000123','0') from dual;
select ltrim('1000123','0') from dual;


PROMPT --34 question
select replace('JACK and JUE', 'J','BL') as "Changes" from dual;

PROMPT --35 question
select mod(17,5) from dual;

PROMPT --36 question
select round(399.9299999, 2) from dual;

PROMPT --37 question
SELECT TRUNC(SYSDATE, 'MM') AS TruncatedYear FROM DUAL;

PROMPT --38 question
select sqrt(4) from dual;

PROMPT --39 question
select floor(99.42) from dual;

PROMPT --40 question
select ceil(99.42) from dual;

PROMPT --41 question
select log(10,10) from dual;

PROMPT ----------------------------------------- Aggregrate Functions ---------------------------------
PROMPT --42 question 
select max(sal) from emp;

PROMPT --43 question 
select max(sal) from emp where sal < (select max(sal) from emp);

PROMPT --44 question 
select avg(sal) from emp where dept=30;

PROMPT --45 question 
select count(*) from emp where deptno in (20,30);

PROMPT --46 question 
select deptno, max(sal) from emp group by deptno;

PROMPT --47 question 
select deptno, count(*) from emp group by deptno;

PROMPT --48 question 
select deptno, sum(sal) from emp group by deptno;

PROMPT --49 question
select deptno, count(*) from emp group by deptno having count(*) > 30;

PROMPT --50 question
select deptno, count(*) from emp group by deptno;

PROMPT --51 question
select max(sal) from emp where job='CLERK';

PROMPT --52 question
select max(sal) from emp where deptno=20;

PROMPT --53 question
select min(sal) from emp where job='SALESMAN';

PROMPT --54 question
select avg(sal) from emp where job='MANAGER';

PROMPT --55 question
select sum(sal) from emp where job='ANALYST' AND DEPTNO=40;

PROMPT --56 question
select job,count(*) from emp group by job;