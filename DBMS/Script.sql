-- 1) Creating a student table
create table students(stdid number(3), fname varchar(20), lname varchar(20), dob Date, doj Date, fees number(7,7), gender varchar, insertby varchar(20));

-- 2) Create a product specification table
create table prodspec(prodid number(3), prodphoto blob, prodgraphic bile, proddesc long);

-- 3) inserting data into the tables
insert into table students(1, 'Vedhanth', 'Gurram', '18-09-2003', '10-10-2022', 22.2, 'M', 'Vedhanth');
insert into table students(2, 'A', 'Lavanya', '20-05-2003', '10-10-2022', 22.2, 'F', 'Vedhanth');
insert into table students(3, 'K', 'Nithin', '14-02-2004', '10-10-2022', 22.2, 'M', 'Vedhanth');
insert into table students(4, 'J', 'Satish', '19-09-2003', '10-10-2022', 22.2, 'M', 'Vedhanth');
insert into table students(5, 'K', 'Raghu', '18-09-2003', '10-10-2022', 22.2, 'M', 'Vedhanth');

insert into table prodspec(1, NULL, NULL, 'desc 1');
insert into table prodspec(2, NULL, NULL, 'desc 2');
insert into table prodspec(3, NULL, NULL, 'desc 3');
insert into table prodspec(4, NULL, NULL, 'desc 4');
insert into table prodspec(5, NULL, NULL, 'desc 5');

-- 4) insert into specific columns
insert into table(stdid, lname, dob, doj, fees) values(6,'hans', SYSDATE, SYSDATE, 33.3);
insert into table(stdid, lname, dob, doj, fees) values(7,'legs', SYSDATE, SYSDATE, 33.3);
insert into table(stdid, lname, dob, doj, fees) values(8,'rishi', SYSDATE, SYSDATE, 33.3);

insert into table(prodid, proddesc) values(6, 'desc 6');
insert into table(prodid, proddesc) values(6, 'desc 6');
insert into table(prodid, proddesc) values(6, 'desc 6');

-- 5,6) SYSDATE AND USER
insert into table students(7, 'Vedhanth', 'Gurram', '18-09-2003', SYSDATE, 22.2, 'M', USER);
insert into table students(8, 'Vedhanth', 'Gurram', '18-09-2003', SYSDATE, 22.2, 'M', USER);
insert into table students(9, 'Vedhanth', 'Gurram', '18-09-2003', SYSDATE, 22.2, 'M', USER);

-- 7) 