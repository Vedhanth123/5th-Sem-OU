alter session set "_oracle_script"= true;
create user vedh identified by vedh1234;

create or replace PUBLIC synonym stu for student;

create or replace synonym stu_priv for student;

grant connect, resource to vedh;
grant select on stu to vedh;

conn vedh/vedh1234;
show user;

select * from stu;

prompt --------------- Accessing a private synonym ---------------;
select * from stu_priv;


conn system/vedhanth;

drop PUBLIC synonym stu;
drop synonym stu_priv;



/*
insert into student values(1, 'vedhanth', 223);
insert into student values(2, 'vedhanth', 223);
insert into student values(3, 'vedhanth', 223);
insert into student values(4, 'vedhanth', 223);
*/
