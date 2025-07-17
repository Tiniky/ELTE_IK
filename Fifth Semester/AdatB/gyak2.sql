--t�bl�k oszlopai
select * from dba_tab_columns;

--H�ny oszlopa van a nikovits.emp t�bl�nak?
select count(*) as sorok from dba_tab_columns
where owner='NIKOVITS' and table_name='EMP';

--Adjuk meg azoknak a t�bl�knak a nev�t, amelyeknek 1. es 4. oszlopa is VARCHAR2 tipus�.
select table_name from dba_tab_columns
where data_type = 'VARCHAR2' and column_id='1'
INTERSECT
select table_name from dba_tab_columns
where data_type = 'VARCHAR2' and column_id='4';

--szinon�ma kre�l�s
create synonym dolgozok2 for vdani.dolgozo;
select * from dolgozok2;

--adatb�zis link kre�l�s
create database link ullman_link
connect to rddzxa identified by jelszo
using 'ullman.inf.elte.hu:1521/ullman';

--m�sik adatb�zisb�l szinon�ma l�trehoz�sa
select * from vdani.dolgozo@ullman_link;
create synonym ull_dolg
for vdani.dolgozo@ullman_link;
select * from ull_dolg;

--melyik t�pus van aramison de nincs ullmanon
select distinct object_type from dba_objects
MINUS
select distinct object_type from dba_objects@ullman_link;

--kutat�s: kinek melyik t�bl�ja a select * from sz1;
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
--v�lasz: nikovitsnak az employee meg a departments t�bl�i