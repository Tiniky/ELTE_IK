drop table tr;

create table tr (a integer);

select * from tr;

insert into tr values(1);

grant select on tr to orwht4;
grant update on tr to orwht4;

update tr
set a=a-3;

commit;
rollback;

savepoint ketto;

rollback to ketto;

set autocommit off;

LOCK TABLE tr IN SHARE MODE;