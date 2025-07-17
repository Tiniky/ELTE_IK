--ki�rja a saj�t t�bl�kat
select * from user_tables;

--ki�r mindent amihez hozz�f�r�si joga van a usernek
select * from all_tables;

--ki�r MINDEN t�bl�t (admin user usually)
select * from dba_tables;
select * from dba_objects;

--Kinek a tulajdon�ban van a DBA_TABLES nevu n�zet (illetve a DUAL nevu t�bla)?
select owner from dba_objects
where object_name = 'DBA_TABLES' and object_type = 'VIEW';
select owner from dba_objects
where object_name = 'DUAL' and object_type = 'TABLE';

--H�ny k�l�nb�zo t�pus� objektum van nyilv�ntartva az adatb�zisban?
select count(distinct object_type) from dba_objects;

--Melyek ezek a t�pusok?
select distinct object_type from dba_objects;

--Kik azok a felhaszn�l�k, akiknek t�bb mint 10 f�le objektumuk van?
select owner from dba_objects
group by owner
having count(distinct object_type) > 10;

--Kik azok a felhaszn�l�k, akiknek van triggere �s n�zete is?
select distinct obj1.owner from dba_objects obj1, dba_objects obj2
where obj1.object_type = 'TRIGGER' and obj1.owner = obj2.owner and obj2.object_type = 'VIEW';

--Kinek a tulajdon�ban van a DBA_TABLES nevu szinonima (illetve a DUAL nevu)?
select owner from dba_objects
where object_name = 'DBA_TABLES' and object_type = 'SYNONYM';
select owner from dba_objects
where object_name = 'DUAL' and object_type = 'SYNONYM';

--Milyen t�pus� objektumai vannak az orauser nevu felhaszn�l�nak az adatb�zisban?
select object_type from dba_objects
where owner = 'orauser';

--Kik azok a felhaszn�l�k, akiknek van n�zete, de nincs triggere?
SELECT DISTINCT obj1.owner
FROM dba_objects obj1
LEFT JOIN dba_objects obj2 ON obj1.owner = obj2.owner AND obj2.object_type = 'TRIGGER'
WHERE obj1.object_type = 'VIEW' AND obj2.owner IS NULL;

--Kik azok a felhaszn�l�k, akiknek t�bb mint 40 t�bl�juk, de maximum 37 index�k van?
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

--Melyek azok az objektum t�pusok, amelyek t�nyleges t�rol�st ig�nyelnek, vagyis tartoznak hozz�juk adatblokkok? (A t�bbinek csak a defin�ci�ja t�rol�dik adatsz�t�rban)
select segment_type from dba_segments
group by segment_type;

--Milyen t�pus� a nikovits.emp t�bla 6. oszlopa?
select data_type from dba_tab_columns
where owner='NIKOVITS' and table_name='EMP' and column_id='6';

--Adjuk meg azoknak a t�bl�knak a tulajdonos�t �s nev�t, amelyeknek van 'Z' betuvel kezdodo oszlopa.
select owner, table_name from dba_tab_columns
where column_name like 'Z%';

--Adjuk meg azoknak a t�bl�knak a nev�t, amelyeknek legal�bb 8 darab d�tum tipus� oszlopa van.
select table_name from dba_tab_columns
where data_type = 'DATE'
group by table_name
having count(*) >= 8;
