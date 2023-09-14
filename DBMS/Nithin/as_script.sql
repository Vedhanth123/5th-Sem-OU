set lines 100;
set linesize 500;
set wrap off;



--- 1st question
create table student14(stdid number, fname varchar(20), lname varchar(20), dob varchar(14), doj varchar(14), fees float, gender varchar(2));
select * from student14;

set wrap on;
set line 50;
desc student14;

set line 500;

 
set wrap off;
set lines 100;
set linesize 50;



--- 2nd question
create table prodspec(prodid number, prodphoto blob, prodgraphic bfile, proddesc long);
desc prodspec;


set lines 80;
set linesize 100;
set wrap off;

--- 3rd question

insert into student14 values(101, 'Raghavendra', 'swamy', '9-12-232', '18-03-2304',234234.23,'M');
select * from student14;
insert into student14 values(102, 'rama', 'raju', '11-04-2300', '17-03-2304',234234.63,'F');
select * from student14;
insert into student14 values(103, 'mahatma', 'gandhi', '16-06-2300', '12-03-2304',234214.43,'M');
select * from student14;
insert into student14 values(104, 'sai', 'nithin', '14-02-2300', '19-03-2304',234274.23,'F');
select * from student14;
insert into student14 values(105, 'sai', 'mukesh', '14-02-2321', '10-03-2304',234294.23,'M');
select * from student14;

insert into prodspec values(1001,NULL ,NULL ,'Folding Chair');
select * from prodspec;
insert into prodspec values(1002,NULL ,NULL ,'Dressing table');
select * from prodspec;
insert into prodspec values(1003,NULL ,NULL ,'Recliner');
select * from prodspec;
insert into prodspec values(1004,NULL ,NULL ,'Sofa');
select * from prodspec;
insert into prodspec values(1005,NULL ,NULL ,'Portable Chair');
select * from prodspec;

--- 4th question

insert into student14(stdid,lname, dob, doj, fees) values(1001,'reddy','12-04-2004','12-04-2004',234234.23);
insert into student14(stdid,lname, dob, doj, fees) values(1001,'sai','12-04-2004','12-04-2004',234234.23);
insert into student14(stdid,lname, dob, doj, fees) values(1001,'chary','12-04-2004','12-04-2004',234234.23);
select * from student14;


insert into prodspec(prodid, proddesc) values(1006,'Bed');
insert into prodspec(prodid, proddesc) values(1007,'King size bed');
insert into prodspec(prodid, proddesc) values(1008,'Hospital bed');
select * from prodspec;

--- 5th question is done previously inserted implicit and explicit NULL values

--- 6th question 

alter table student14 add (insertby varchar(20));


insert into student14(stdid,lname, dob, doj, fees, insertby) values(1009,'reddy','12-04-2004',SYSDATE,234234.23,USER);
select * from student14;
insert into student14(stdid,lname, dob, doj, fees, insertby) values(1010,'raj','11-03-2004',SYSDATE,2343434.23,USER);
select * from student14;
insert into student14(stdid,lname, dob, doj, fees, insertby) values(1011,'sharma','19-08-2004',SYSDATE,2312234.23,USER);
select * from student14;



alter table student14 add (games varchar(20), activity varchar(20));
desc student14;


--- 7th question (&, &&, ACCEPT and DEFINE)

define game = 'checkers';
insert into student14(games,activity) values('&&game','&activities');
insert into student14(games,activity) values('&&game','&activities');
accept game prompt 'Enter your favourite game : ';
insert into student14(games,activity) values('&&game','&activities');
insert into student14(games,activity) values('&&game','&activities');
select stdid,lname, games, activity  from student14;


--- 8th question (UPDATE COMMAND)
select stdid, fname, lname, doj, fees from student14;
update student14 set &column=&v where stdid=&for_whom;
update student14 set &column='&v' where stdid=&for_whom;
update student14 set &column='&v' where stdid=&for_whom;
update student14 set &column='&v' where stdid=&for_whom;
select stdid, fname, lname, doj, fees from student14;

select prodid, proddesc from prodspec;
update prodspec set proddesc='&proddesc_to_add' where prodid=&for_prodid;
update prodspec set prodid=1231 ;

select prodid, proddesc from prodspec;

select stdid,fees from student14;

--- 9th question (add course and address columns )
alter table student14 add (course varchar(10), address varchar(20));
desc student14;

-- 10th question (modify )
desc student14;
alter table student14 rename column stdid to stdnumber;
alter table student14 rename column lname to lastname;
alter table student14 modify lastname varchar(30);
desc student14;

-- 11th question
create table labspecification (eqid number, eqname varchar(20));
select tname from tab where tname='LABSPECIFICATION';

alter table labspecification rename to labdata;
select tname from tab where tname='LABDATA';
select tname from tab where tname='LABSPECIFICATION';

-- 12th question

delete from student14 where fname='sai';
delete from student14 where lastname='reddy';
delete from student14 where lastname='chary';

-- 13th question
desc student14;
alter table student14 drop column course;
alter table student14 drop column address;
desc student14;

insert into labdata values(101,'computer');
insert into labdata values(102,'mouse');
insert into labdata values(103,'Keyboard');
insert into labdata values(104,'printer');
insert into labdata values(105,'server');

-- 14th question
select * from labdata;
truncate table labdata;
select * from labdata;

-- 15th question
set linesize 30;
set lines 50;
set wrap on;
-- creating comments
comment on table student14 is 'comment to student14';
comment on column student14.fname is 'comment to fname column in student14 table';
-- to view user comments
select comments from user_tab_comments where table_name='STUDENT14';
select column_name, comments from user_col_comments where table_name='STUDENT14';

-- to view all comments
select owner, table_name, comments from all_tab_comments where table_name='STUDENT14';
select owner, table_name, comments from all_col_comments where table_name='STUDENT14';



set lines 80;
set linesize 100;
set wrap off;


-- 16th question (Fly tables)
-- exact copy
create table copy_student as select * from student14;
select * from student14;
select * from copy_student;
desc copy_student;

--- with diff column names
create table diff_student as select stdnumber as sid, fname as firstname, lastname as lname from student14;
desc diff_student


-- required columns
create table with_selected_columns as select stdnumber,fname,lastname from student14;
select * from with_selected_columns;

-- adding new data
alter table student14 add (additional_fees number);
update student14 set additional_fees=10000;
desc student14;

--- invented columns
select * from student14;
create table new_fee_student as select stdnumber,fname,lastname, additional_fees+fees as new_fees from student14; 
select * from new_fee_student;
desc new_fee_student;

-- only stucture
create table new_student as select * from student14 where 1=0;
select * from new_student;
desc student14;
desc new_student

-- 17th question
insert into labdata values(1111,'test equipment');
insert into labdata values(1111,'test equipment');
insert into labdata values(1111,'test equipment');
commit;
select * from labdata;
insert into labdata values(1111,'test equipment');
insert into labdata values(1111,'test equipment');
select * from labdata;
rollback;
select * from labdata;

insert into labdata values(2222,'temp equipment');
insert into labdata values(2222,'temp equipment');
insert into labdata values(2222,'temp equipment');
select * from labdata;
savepoint three_temps;

insert into labdata values(3333,'temp2 equipment');
insert into labdata values(3333,'temp2 equipment');
insert into labdata values(3333,'temp2 equipment');
select * from labdata;
rollback to savepoint three_temps;
select * from labdata;


-- 18th question

-- 18a) not null constriant
create table samplenn01 (sampdate date, sampleid number not null, sampname varchar(20) not null);

insert into samplenn01 values(SYSDATE, 1, 'john');
insert into samplenn01 values(SYSDATE);
select * from samplenn01;
create table samplenn2 (sampdate date, sampid number, sampname varchar(20), constraint nnk NOT NULL (sampid, sampname));

--- 18b) unique constraint
create table sampleunq1 (sampdate date, sampleid number unique, sampname varchar(20) unique );

insert into sampleunq1 values (SYSDATE, 1, 'john');
insert into sampleunq1 values (SYSDATE, 1, 'john');
insert into sampleunq1 values (SYSDATE, 2, 'sam');
insert into sampleunq1 values (SYSDATE, 2, 'sam');
select * from sampleunq1;

create table sampleunq2 (sampdate date,sampleid number, samplename varchar(20),  constraint unc unique(sampleid, samplename));


insert into sampleunq2 values (SYSDATE, 1, 'john');
insert into sampleunq2 values (SYSDATE, 1, 'john');
insert into sampleunq2 values (SYSDATE, 2, 'sam');
insert into sampleunq2 values (SYSDATE, 2, 'sam');

select * from sampleunq2;


create table sampleunq3(sampdate date, samplename varchar(20) unique, sampid number unique);


insert into sampleunq3 values (SYSDATE, 1, 'john');
insert into sampleunq3 values (SYSDATE, 1, 'john');
insert into sampleunq3 values (SYSDATE, 2, 'sam');
insert into sampleunq3 values (SYSDATE, 2, 'sam');

create table sampleunq4(sampdate date, sampname varchar(20), sampid number, constraint unk unique(sampname,sampid));


insert into sampleunq4 values (SYSDATE, 1, 'john');
insert into sampleunq4 values (SYSDATE, 1, 'john');
insert into sampleunq4 values (SYSDATE, 2, 'sam');
insert into sampleunq4 values (SYSDATE, 2, 'sam');

-- 18c) primary key

create table players(playerno number primary key, name varchar(20), initials varchar(20), birth_date date, sex varchar(2), joined date, street varchar(20), houseno varchar(20), postcode number, town varchar(20), phoneno number(10));

create table teams(teamno number primary key, playerno number, division number);

create table matches(matchno number primary key, teamno number, playerno number, won smallint, lost smallint);

create table penalties(paymenntno number primary key, playerno number, paymetn_date date, amount number(7,2));

create table commitemem(playerno number, begin_date date, end_date date, position number, constraint pk primary key(playerno, begin_date));

-- 18c) alternate keys
-- table level constraint
alter table teams add constraint ak unique(playerno);  

alter table teams drop column playerno;
alter table teams add (playerno number);

-- column level constraint
alter table teams modify playerno unique; 

-- 18d) foreign keys
-- 18d1)self referencing
alter table matches add constraint fk foreign key(teamno) references matches(matchno); 

-- 18d2) binary referencing 
prompt ------Binary referencing-----------;
create table pc(pcid number primary key, paymenntno number, playerno number, begin_date date, foreign key(paymenntno) references penalties(paymenntno), foreign key(playerno, begin_date) references commitemem(playerno, begin_date));
prompt -----------------------------------;

-- 18e) check constraint

create table emp(ename varchar(20), eid number, constraint chc check(ename = UPPER(ename)));
insert into emp values('HULK',1);
insert into emp values('hulk',1);

-- 19) Maintenance

-- 19a) add constraints
alter table teams add constraint ak unique(division);

-- 19b) view column associated constraints from data dictionary tables
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    POSITION
FROM
    USER_CONS_COLUMNS
WHERE
    TABLE_NAME = 'COMMITEMEM' AND
    COLUMN_NAME = 'BEGIN_DATE';

-- 19c) enabling and disabling constraints
alter table teams disable constraint ak;

alter table teams enable constraint ak;

-- 19d) view constraints in data dictionary table
SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE,
    TABLE_NAME,
    SEARCH_CONDITION
FROM
    USER_CONSTRAINTS
WHERE
    TABLE_NAME = 'TEAMS';

-- 19e) drop constraints
alter table teams drop constraint ak;


drop table emp;
drop table pc;
drop table commitemem;
drop table penalties;
drop table matches;
drop table teams;
drop table players;
drop table sampleunq2;
drop table sampleunq1;
drop table samplenn01;
drop table new_student;
drop table with_selected_columns;
drop table new_fee_student;
drop table copy_student;
drop table diff_student;
drop table labdata;
drop table student14;
drop table prodspec;