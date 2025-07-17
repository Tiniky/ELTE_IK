--táblák oszlopai
select * from dba_tab_columns;

--Hány oszlopa van a nikovits.emp táblának?
select count(*) as sorok from dba_tab_columns
where owner='NIKOVITS' and table_name='EMP';

--Adjuk meg azoknak a tábláknak a nevét, amelyeknek 1. es 4. oszlopa is VARCHAR2 tipusú.
select table_name from dba_tab_columns
where data_type = 'VARCHAR2' and column_id='1'
INTERSECT
select table_name from dba_tab_columns
where data_type = 'VARCHAR2' and column_id='4';

--szinoníma kreálás
create synonym dolgozok2 for vdani.dolgozo;
select * from dolgozok2;

--adatbázis link kreálás
create database link ullman_link
connect to rddzxa identified by jelszo
using 'ullman.inf.elte.hu:1521/ullman';

--másik adatbázisból szinoníma létrehozása
select * from vdani.dolgozo@ullman_link;
create synonym ull_dolg
for vdani.dolgozo@ullman_link;
select * from ull_dolg;

--melyik típus van aramison de nincs ullmanon
select distinct object_type from dba_objects
MINUS
select distinct object_type from dba_objects@ullman_link;

--kutatás: kinek melyik táblája a select * from sz1;
select * from sz1;

select * from dba_objects
where object_name='SZ1';

select table_owner, table_name from dba_synonyms
where owner='PUBLIC' and synonym_name='SZ1';

select * from dba_objects
where object_name='V1' and owner='NIKOVITS';

select text from dba_views
where owner='NIKOVITS' and view_name='V1';

select first_name, last_name, salary, department_name 
from nikovits.employees e natural join nikovits.departments
where employee_id between 110 and 120;
--válasz: nikovitsnak az employee meg a departments táblái