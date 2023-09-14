drop table tablev;

create table tablev(std number, name varchar(20));

insert into tablev values(111, 'vedhanth');
insert into tablev values(12, 'vedhanth');
insert into tablev values(113, 'vedhanth');
insert into tablev values(114, 'vedhanth');
insert into tablev values(115, 'vedhanth');

alter table tablev read only;

insert into tablev values(22, "joker");

select * from tablev;

insert into tablev values(22, "joker");