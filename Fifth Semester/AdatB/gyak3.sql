--kutat�s hol van t�rolva NIKOVITS SZALLIT t�bl�ja
select * from dba_segments
where owner='NIKOVITS' and segment_name='SZALLIT' and segment_type='TABLE';

select * from dba_extents
where owner='NIKOVITS' and segment_name='SZALLIT' and segment_type='TABLE';

select * from dba_data_files
where file_id=2;

select * from dba_tablespaces;

--meg tudjuk n�zni a szabad helyeket
select * from dba_free_space
where file_id=2;

-- 1. Adjuk meg az adatb�zishoz tartoz� adatfile-ok (�s tempor�lis f�jlok) nev�t �s m�ret�t m�ret szerint cs�kken� sorrendben.
select * from 
    (select distinct file_name, bytes from dba_data_files
    union
    select distinct file_name, bytes from dba_temp_files)
order by bytes desc;

-- 2. Adjuk meg, hogy milyen tablaterek vannak letrehozva az adatbazisban, az egyes tablaterek hany adatfajlbol allnak, es mekkora az osszmeretuk. (tablater_nev, fajlok_szama, osszmeret) !!! Vigy�zat, van tempor�lis t�blat�r is.
select tablespace_name, count(*), sum(bytes) from dba_data_files
group by tablespace_name;

select tablespace_name, count(*), sum(bytes) from 
    (select distinct tablespace_name, bytes from dba_data_files
    union
    select distinct tablespace_name, bytes from dba_temp_files)
group by tablespace_name;

-- 5. Melyik a legnagyobb m�ret� t�bla szegmens az adatb�zisban (a tulajdonost is adjuk meg)  �s h�ny extensb�l �ll? (A particion�lt t�bl�kat most ne vegy�k figyelembe.)
select * from
(select owner, segment_name, bytes, extents from dba_segments
 where segment_type='TABLE'
 order by bytes)
where rownum <=1;

-- 6. Melyik a legnagyobb meret� index szegmens az adatb�zisban �s h�ny blokkb�l �ll? (A particionalt indexeket most ne vegyuk figyelembe.)
select * from
(select owner, segment_name, bytes, extents from dba_segments
 where segment_type='INDEX'
 order by bytes)
where rownum <=1;

-- 7. Adjuk meg adatf�jlonkent, hogy az egyes adatf�jlokban mennyi a foglalt hely osszesen (�rassuk ki a f�jlok m�ret�t is).
select file_id, sum(bytes) from dba_extents
group by file_id;

select dba_extents.file_id, dba_data_files.bytes, sum(dba_extents.bytes)
from dba_data_files join dba_extents
on dba_data_files.file_id = dba_extents.file_id
group by dba_extents.file_id, dba_data_files.bytes;

-- A NIKOVITS felhaszn�l� CIKK t�bl�ja h�ny blokkot foglal le az adatb�zisban? (ARAMIS)
select blocks from dba_segments
where owner='NIKOVITS' and segment_name='CIKK';

select sum(blocks) from dba_extents
where owner='NIKOVITS' and segment_name='CIKK';

--Van-e a NIKOVITS felhaszn�l�nak olyan t�bl�ja, amelyik t�bb adatf�jlban is foglal helyet?
select segment_name from dba_extents
where owner='NIKOVITS' and segment_type='TABLE'
group by segment_name
having count(*) >= 2;

--A NIKOVITS felhaszn�l� CIKK t�bl�j�nak adatai h�ny blokkban helyezkednek el? (Vagyis a t�bla sorai t�nylegesen h�ny blokkban vannak t�rolva?)
select blocks from dba_tables
where owner='NIKOVITS' and table_name='CIKK';

-- Mekkora az adatblokkok merete a USERS t�blat�ren?
select block_size from dba_tablespaces
where tablespace_name='USERS';

--Van-e olyan t�blat�r, amelynek nincs DBA_DATA_FILES-beli adatf�jlja? Ennek adatai hol t�rol�dnak? -> DBA_TEMP_FILES
select tablespace_name from dba_tablespaces
minus
select tablespace_name from dba_data_files;

