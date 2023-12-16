conn system/ora1234;
set wrap off;
set lines 50;
set linesize 150;
prompt ------------- CleanUp code -------------;
@demotable.sql;

alter session set "_oracle_script"= true;
drop user bot;
drop user mbot;

drop role upd_role;
drop synonym private_stu_synon;
drop public synonym public_stu_synon;
drop public synonym public_stu_mbot;
prompt ------------- CleanUp End -------------;

prompt ------------- Creating users -------------;
create user bot identified by bot1234;
create user mbot identified by mbot1234;

grant create session to bot;
grant create session to mbot;

prompt ------------- Granting select with grant option to bot user -------------;
grant select on student to bot with grant option;

prompt ------------- Checking privileges from data dictionary tables -------------;
select  grantor, table_name from user_tab_privs_made where table_name ='STUDENT';
select  grantor, table_name from user_tab_privs_recd where table_name ='STUDENT';

prompt ------------- Creating a role who can select and update -------------;
create role upd_role;
grant update on student to upd_role;


prompt ------------- Checking privileges granted -------------;
conn bot/bot1234;
show user;
select * from system.student;
update system.student set sname = 'sai nithin' where id =3;

prompt ------------- Checking privileges of mbot -------------;
conn mbot/mbot1234;
show user;
select * from system.student;


conn bot/bot1234;
show user;
prompt ------------- Granting select from bot user to mbot user -------------;
grant select on system.student to mbot;


conn system/ora1234;
show user;
prompt ------------- Granting role to bot and mbot -------------;
grant upd_role to bot, mbot;

prompt ------------- Checking update privilege granted by using a role -------------;
conn bot/bot1234;
show user;
update system.student set sname = 'sai nithin' where id =3;

prompt ------------- Checking privileges from data dictionary tables -------------;
select  grantor, table_name from user_tab_privs_made where table_name ='STUDENT';
select  grantor, table_name from user_tab_privs_recd where table_name ='STUDENT';

conn mbot/mbot1234;

show user;
prompt ------------- Checking update privilege granted by using a role and select by bot user -------------;
select * from system.student;
update system.student set sname = 'sai ram' where id =1;
select * from system.student;

prompt ------------- Checking privileges from data dictionary tables -------------;
select  grantor, table_name from user_tab_privs_made where table_name ='STUDENT';
select  grantor, table_name from user_tab_privs_recd where table_name ='STUDENT';


PROMPT -------------------------------------------------------- WORKING WITH SYNONYMNS ----------------------------------------------------------------------------;

conn system/ora1234;
show user;

prompt ------------- Creating synonyms -------------;
create synonym private_stu_synon for student;
create public synonym public_stu_synon for student;

show user;
select * from private_stu_synon;
select * from public_stu_synon;

prompt ------------- Granting select on synonyms to bot -------------;
grant select on public_stu_synon  to bot;
grant select on private_stu_synon to bot;

prompt ------------- Granting privilege to create synonyms to mbot -------------;
grant create public synonym to mbot;

prompt ------------- Using synonyms from bot -------------;
conn bot/bot1234
show user;
select * from private_stu_synon;
select * from public_stu_synon;

conn mbot/mbot1234;
show user;

prompt ------------- Creating public synonym from mbot -------------;
create public synonym public_stu_mbot for system.student;

prompt ------------- Checking privilege to create private synonym -------------;
create synonym private_stu_mbot for system.student;


show user;
select * from public_stu_mbot;

prompt ------------- Accessing public synonym created by mbot from other users -------------;

conn bot/bot1234;
show user;
select * from public_stu_mbot;

conn system/ora1234;
show user;
select * from public_stu_mbot;

select synonym_name, table_name from all_synonyms where table_name='STUDENT';