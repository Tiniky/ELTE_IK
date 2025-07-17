--kiírja a saját táblákat
select * from user_tables;

--kiír mindent amihez hozzáférési joga van a usernek
select * from all_tables;

--kiír MINDEN táblát (admin user usually)
select * from dba_tables;
select * from dba_objects;

--Kinek a tulajdonában van a DBA_TABLES nevu nézet (illetve a DUAL nevu tábla)?
select owner from dba_objects
where object_name = 'DBA_TABLES' and object_type = 'VIEW';
select owner from dba_objects
where object_name = 'DUAL' and object_type = 'TABLE';

--Hány különbözo típusú objektum van nyilvántartva az adatbázisban?
select count(distinct object_type) from dba_objects;

--Melyek ezek a típusok?
select distinct object_type from dba_objects;

--Kik azok a felhasználók, akiknek több mint 10 féle objektumuk van?
select owner from dba_objects
group by owner
having count(distinct object_type) > 10;

--Kik azok a felhasználók, akiknek van triggere és nézete is?
select distinct obj1.owner from dba_objects obj1, dba_objects obj2
where obj1.object_type = 'TRIGGER' and obj1.owner = obj2.owner and obj2.object_type = 'VIEW';

--Kinek a tulajdonában van a DBA_TABLES nevu szinonima (illetve a DUAL nevu)?
select owner from dba_objects
where object_name = 'DBA_TABLES' and object_type = 'SYNONYM';
select owner from dba_objects
where object_name = 'DUAL' and object_type = 'SYNONYM';

--Milyen típusú objektumai vannak az orauser nevu felhasználónak az adatbázisban?
select object_type from dba_objects
where owner = 'orauser';

--Kik azok a felhasználók, akiknek van nézete, de nincs triggere?
SELECT DISTINCT obj1.owner
FROM dba_objects obj1
LEFT JOIN dba_objects obj2 ON obj1.owner = obj2.owner AND obj2.object_type = 'TRIGGER'
WHERE obj1.object_type = 'VIEW' AND obj2.owner IS NULL;

--Kik azok a felhasználók, akiknek több mint 40 táblájuk, de maximum 37 indexük van?
SELECT owner, COUNT(*) AS table_count
FROM dba_objects
WHERE object_type = 'TABLE'
GROUP BY owner
HAVING COUNT(*) > 40
intersect
SELECT owner, COUNT(*) AS index_count
FROM dba_objects
WHERE object_type = 'INDEX'
GROUP BY owner
HAVING COUNT(*) < 37;

--Melyek azok az objektum típusok, amelyek tényleges tárolást igényelnek, vagyis tartoznak hozzájuk adatblokkok? (A többinek csak a definíciója tárolódik adatszótárban)
select segment_type from dba_segments
group by segment_type;

--Milyen típusú a nikovits.emp tábla 6. oszlopa?
select data_type from dba_tab_columns
where owner='NIKOVITS' and table_name='EMP' and column_id='6';

--Adjuk meg azoknak a tábláknak a tulajdonosát és nevét, amelyeknek van 'Z' betuvel kezdodo oszlopa.
select owner, table_name from dba_tab_columns
where column_name like 'Z%';

--Adjuk meg azoknak a tábláknak a nevét, amelyeknek legalább 8 darab dátum tipusú oszlopa van.
select table_name from dba_tab_columns
where data_type = 'DATE'
group by table_name
having count(*) >= 8;
