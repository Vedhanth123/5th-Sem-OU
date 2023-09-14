conn system/ora1234;
drop table student;
drop table school;
drop table test1;
drop table test3;
drop table test;
drop table test2;

alter session set "_oracle_script"=true;
drop user sai;
drop user shiva;
drop user kumar;
drop role schl_student;
drop role schl_admin;



-- default constraint
create table test(id number, city varchar(20) default 'Hyderabad');

insert into test values(1, 'pune');
insert into test(id) values(2);

select * from test;

-- read-only tables

alter table test read only;
prompt ------After table changed to read only-------;
insert into test values(1, 'pune');

alter table test read write ;
prompt ------After table changed to read write-------;

insert into test(id) values(2);

-- GTT with ON COMMIT andd ON ROLLBACK
-- default is on commit delete rows is set

-- ON COMMIT
create GLOBAL TEMPORARY TABLE test1 (id number, name varchar(10));

insert into test1 values(11,'alan');
insert into test1 values(12,'jeffos');

select * from test1;

create GLOBAL TEMPORARY TABLE test2 (id number, name varchar(10)) on commit PRESERVE ROWS;

insert into test2 values(11,'alan');
insert into test2 values(12,'jeffos');

select * from test2;

create GLOBAL TEMPORARY TABLE test3 (id number, name varchar(10)) on commit DELETE ROWS;

insert into test3 values(11,'alan');
insert into test3 values(12,'jeffos');

select * from test3;

commit;

select * from test3;
-- undefine command

define jerry = 'Jerry variable';

prompt This is a variable created with define statement : &jerry;
prompt  -------------------------------------;
undefine jerry;
define jerry;
prompt  -------------------------------------;

-- foreign key on delete set null and cascade

create table student(id number, name varchar(20), schl_id number);

insert into student values(1, 'Sai', 101);
insert into student values(2, 'Nithin', 101);
insert into student values(3, 'Nikhil', 102);
insert into student values(4, 'Chinnu', 103);
insert into student values(5, 'Harsha', 103);
insert into student values(6, 'Siri', 101);
insert into student values(7, 'CHandana', 102);


select * from student;


create table school (schl_id number, schl_name varchar(30), loc varchar(20), constraint schl_pk primary key(schl_id));

insert into school values (101,'Shine','Hyderabad');
insert into school values (102,'Cambridge','Warangal');
insert into school values (103,'geetha','Mumbai');

select * from school;
prompt ---------- on delete set null ----------;
alter table student add constraint student_fk foreign key(schl_id) references school(schl_id) on delete set null;

delete from school where schl_name='geetha';

select * from school;
select * from student;

alter table student drop constraint student_fk;
prompt ---------- on delete cascade ----------;
alter table student add constraint student_fk foreign key(schl_id) references school(schl_id) on delete cascade;

delete from school where schl_name = 'Cambridge';

select * from school;
select * from student;

-- unused keyowrd

alter table school set unused(loc);

select * from school;


prompt ---------- invisible keyword ----------

alter table student add (address varchar(20));

update student set address = 'Hyderabad';
select * from student;

alter table student modify (address INVISIBLE);
select * from student;

alter table student modify (address VISIBLE);
select * from student;

alter session set "_oracle_script"=true;



prompt ---------- creating user ----------;
create user sai identified by sai1234;
create user shiva identified by shiva1234;
create user kumar identified by kumar1234;

grant connect, resource to sai,shiva,kumar;

select username from dba_users;


prompt ---------- creating role ----------;
create role schl_admin;
create role schl_student;

prompt ---------- Assigning roles to user ----------;

grant schl_admin to kumar;
grant schl_student to sai, shiva; 



prompt ---------- granting select to schl_student role ----------;

grant select on student to schl_student;
show user;

conn sai/sai1234;
show user;

select * from system.student;
insert into system.student(id,name, schl_id) values (1, 'Sai', 101);

conn system/ora1234;
show user;

alter session set "_oracle_script"= true;

revoke select on student from sai;

conn sai/sai1234;
show user;
select * from system.student;