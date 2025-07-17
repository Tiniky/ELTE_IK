--kutatás hol van tárolva NIKOVITS SZALLIT táblája
select * from dba_segments
where owner='NIKOVITS' and segment_name='SZALLIT' and segment_type='TABLE';

select * from dba_extents
where owner='NIKOVITS' and segment_name='SZALLIT' and segment_type='TABLE';

select * from dba_data_files
where file_id=2;

select * from dba_tablespaces;

--meg tudjuk nézni a szabad helyeket
select * from dba_free_space
where file_id=2;

-- 1. Adjuk meg az adatbázishoz tartozó adatfile-ok (és temporális fájlok) nevét és méretét méret szerint csökkenõ sorrendben.
select * from 
    (select distinct file_name, bytes from dba_data_files
    union
    select distinct file_name, bytes from dba_temp_files)
order by bytes desc;

-- 2. Adjuk meg, hogy milyen tablaterek vannak letrehozva az adatbazisban, az egyes tablaterek hany adatfajlbol allnak, es mekkora az osszmeretuk. (tablater_nev, fajlok_szama, osszmeret) !!! Vigyázat, van temporális táblatér is.
select tablespace_name, count(*), sum(bytes) from dba_data_files
group by tablespace_name;

select tablespace_name, count(*), sum(bytes) from 
    (select distinct tablespace_name, bytes from dba_data_files
    union
    select distinct tablespace_name, bytes from dba_temp_files)
group by tablespace_name;

-- 5. Melyik a legnagyobb méretû tábla szegmens az adatbázisban (a tulajdonost is adjuk meg)  és hány extensbõl áll? (A particionált táblákat most ne vegyük figyelembe.)
select * from
(select owner, segment_name, bytes, extents from dba_segments
 where segment_type='TABLE'
 order by bytes)
where rownum <=1;

-- 6. Melyik a legnagyobb meretû index szegmens az adatbázisban és hány blokkból áll? (A particionalt indexeket most ne vegyuk figyelembe.)
select * from
(select owner, segment_name, bytes, extents from dba_segments
 where segment_type='INDEX'
 order by bytes)
where rownum <=1;

-- 7. Adjuk meg adatfájlonkent, hogy az egyes adatfájlokban mennyi a foglalt hely osszesen (írassuk ki a fájlok méretét is).
select file_id, sum(bytes) from dba_extents
group by file_id;

select dba_extents.file_id, dba_data_files.bytes, sum(dba_extents.bytes)
from dba_data_files join dba_extents
on dba_data_files.file_id = dba_extents.file_id
group by dba_extents.file_id, dba_data_files.bytes;

-- A NIKOVITS felhasználó CIKK táblája hány blokkot foglal le az adatbázisban? (ARAMIS)
select blocks from dba_segments
where owner='NIKOVITS' and segment_name='CIKK';

select sum(blocks) from dba_extents
where owner='NIKOVITS' and segment_name='CIKK';

--Van-e a NIKOVITS felhasználónak olyan táblája, amelyik több adatfájlban is foglal helyet?
select segment_name from dba_extents
where owner='NIKOVITS' and segment_type='TABLE'
group by segment_name
having count(*) >= 2;

--A NIKOVITS felhasználó CIKK táblájának adatai hány blokkban helyezkednek el? (Vagyis a tábla sorai ténylegesen hány blokkban vannak tárolva?)
select blocks from dba_tables
where owner='NIKOVITS' and table_name='CIKK';

-- Mekkora az adatblokkok merete a USERS táblatéren?
select block_size from dba_tablespaces
where tablespace_name='USERS';

--Van-e olyan táblatér, amelynek nincs DBA_DATA_FILES-beli adatfájlja? Ennek adatai hol tárolódnak? -> DBA_TEMP_FILES
select tablespace_name from dba_tablespaces
minus
select tablespace_name from dba_data_files;

