-- 1) create a user
alter session set "_oracle_script" = true;

drop user vedhant;
create user vedhant identified by a;
grant session to vedhant;


-- 2) create a new user from a normal user
grant create user to vedhant;

conn vedhant/a;

show user;

create user subvedhant identified by a;


flashback, purge, recycle bin, 
commit ,rollback, savepoint, set transaction
grant, revoke, rollback,
