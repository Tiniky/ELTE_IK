/*
Az adatszótár nézetek legfontosabb oszlopai
-------------------------------------------

DBA_OBJECTS
-----------
OWNER             tulajdonos
OBJECT_NAME       objektum neve
SUBOBJECT_NAME    összetett objektumok esetén (pl. partícionált tábla)  
OBJECT_ID         egyedi azonosító
DATA_OBJECT_ID    az objektumhoz tartozó adatobjektum (szegmens) azonosítója, null, ha nincs szegmense
OBJECT_TYPE       objektum típusa, pl. TABLE, INDEX, VIEW stb.
CREATED           létrehozás dátuma

DBA_TABLES
----------
OWNER            tulajdonos
TABLE_NAME       tábla neve
TABLESPACE_NAME  táblatér neve
CLUSTER_NAME     a klaszter neve, ha a tábla klaszreren van
IOT_NAME         az IOT neve, ha ez egy túlcsordulási szegmens
NUM_ROWS         tábla sorainak becsült száma (!)
BLOCKS           tábla által foglalt blokkok becsült száma (!)
IOT_TYPE         IOT vagy IOT_OVERFLOW (index szervezett tábla, vagy túlcsordulási szegmens esetén)

DBA_TAB_COLUMNS  Táblák oszlopai, adatípusai, default értékek
---------------
OWNER            tulajdonos 
TABLE_NAME       tábla neve
COLUMN_NAME      oszlop neve
DATA_TYPE        oszlop adattípusa
DATA_LENGTH      adattípus hossza, pl. CHAR(10) esetén 10
DATA_PRECISION   NUMBER oszlop értékes jegyeinek száma, pl. NUMBER(10,2) esetén 10
DATA_SCALE       NUMBER oszlop tizedes jegyeinek száma, pl. NUMBER(10,2) esetén 2
COLUMN_ID        hányadik oszlopa ez a táblának
DATA_DEFAULT     az oszlop DEFAULT értéke, ha van
NUM_DISTINCT     az oszlopban elõforduló különbözõ értékek száma, becsült érték (!)

DBA_SYNONYMS     Szinonima
------------
OWNER            tulajdonos
SYNONYM_NAME     szinonima neve
TABLE_OWNER      a tábla (nézet) tulajdonosa, amire a szinonima mutat
TABLE_NAME       a tábla (nézet) neve, amire a szinonima mutat
DB_LINK          ha távoli táblára mutat a szinonima, az adatbázis-kapcsoló neve 

DBA_VIEWS        Nézetek
---------
OWNER            tulajdonos
VIEW_NAME        nézet neve
TEXT             a nézet lekérdezésének (SELECT utasítás) szövege

DBA_SEQUENCES    Szekvencia: egy sorszámgenerátor, egyedi értékeke generálására.
-------------
SEQUENCE_OWNER   tulajdonos
SEQUENCE_NAME    szekvencia neve
MIN_VALUE        minimális kiadható érték
MAX_VALUE        maximális kiadható érték
INCREMENT_BY     értékek közötti lépésköz

DBA_DB_LINKS     Távoli adatbázis elérésére szolgáló adatbázis-kapcsolat
------------
OWNER            a kapcsoló tulajdonosa
DB_LINK          kapcsoló neve
USERNAME         felhasználónév a távoli adatbázisban
HOST             a távoli adatbázis adatai

DBA_DATA_FILES   Adatfájlok, amelyekben a fizikai tárolás történik adatblokkok formájában.
--------------
FILE_NAME        adatfájl op. rendszerbeli neve
FILE_ID          fájl azonosítója (most megegyezik a táblatéren belüli egyedi azonosítóval)
TABLESPACE_NAME  a táblatér neve, amihez a fájl tartozik
BYTES            a fájl (jelenlegi) mérete
BLOCKS           a fájl mérete adatblokkokban     
RELATIVE_FNO     a fájl táblatéren belüli egyedi azonosítója
AUTOEXTENSIBLE   automatikusan növelheti-e a fájlt az op. rendszer
MAXBYTES         maximális méret, amire növelni lehet

DBA_TEMP_FILES   A temporális táblatérhez tartozó adatfájlok. A szerkezete azonos a dba_data_file-lal.
--------------

DBA_TABLESPACES  Táblatér: adatfájlok logikai csoportokba szervezésére.
---------------
TABLESPACE_NAME  táblatér neve
BLOCK_SIZE       adatblokkok mérete a táblatéren
STATUS           ONLINE vagy OFFLINE
CONTENTS         mit tárolunk a táblatéren, PERMANENT, UNDO vagy TEMPORARY

DBA_SEGMENTS     Szegmens: adatblokkokból álló, tárolást igénylõ objektum.
------------
OWNER            a szegmens objektumának tulajdonos
SEGMENT_NAME     szegmens neve (megegyezik a tábla, index stb. nevével)
PARTITION_NAME   partícionált tábla esetén a partíció vagy alpartíció neve
SEGMENT_TYPE     szegmens típusa, pl. TABLE, INDEX, TABLE_PARTITION
TABLESPACE_NAME  a táblatér neve, amin a szegmens van
BYTES            szegmens mérete
BLOCKS           szegmens mérete adatblokkokban   
EXTENTS          a szegmens extenseinek száma

DBA_EXTENTS      Extens: egy fájlon belüli szomszédos adatblokkokból álló tárolási egység.
-----------
OWNER            annak az objektumnak a tulajdonosa, amihez az extens tartozik
SEGMENT_NAME     a szegmens neve, amihez az extens tartozik
SEGMENT_TYPE     szegmens típusa, pl. TABLE, INDEX, TABLE_PARTITION
TABLESPACE_NAME  a táblatér neve, amin az extens van
EXTENT_ID        az extens sorszáma a szegmensen belül
FILE_ID          a fájl azonosítója, amihez az extens tartozik
BLOCK_ID         az extens elsõ blokkjának sorszáma a fájlon belül
BYTES            az extens mérete
BLOCKS           az extens mérete blokkokban 

DBA_FREE_SPACE   A fájlon belüli összefüggõ szabad területek mérete.
--------------
TABLESPACE_NAME  a táblatér neve
FILE_ID          a fájl azonosítója  
BLOCK_ID         a szabad terület elsõ blokkjának sorszáma
BYTES            a szabad terület mérete
BLOCKS           a szabad terület mérete blokkokban

DBA_INDEXES
-----------
TABLE_OWNER      a tábla tulajdonosa
TABLE_NAME       az indexelt tábla neve
OWNER            az index tulajdonosa 
INDEX_NAME       index neve 
INDEX_TYPE       index típusa, pl. NORMAL, BITMAP, CLUSTER, FUNCTION-BASED NORMAL stb. 
UNIQUENESS       elõfordulhatnak-e azonos értékek
COMPRESSION      az ismétlõdõ értékek hatékonyabb tárolását szolgálja
PREFIX_LENGTH    tömörítés hány oszlopnyi legyen

DBA_IND_COLUMNS  Mely oszlopok vannak indexelve
-----------
TABLE_OWNER      a tábla tulajdonosa
TABLE_NAME       az indexelt tábla neve
INDEX_OWNER      az index tulajdonosa 
INDEX_NAME       index neve 
COLUMN_NAME      indexelt oszlop neve 
COLUMN_POSITION  az oszlop hányadik az indexelt oszlopok sorrendjében
DESCEND          csökkenõ-e  

DBA_IND_EXPRESSIONS  Ha egy index valamilyen kifejezés kiszámolt értékei alapján épül fel
-------------------
TABLE_OWNER        a tábla tulajdonosa
TABLE_NAME         az indexelt tábla neve
INDEX_OWNER        az index tulajdonosa 
INDEX_NAME         index neve 
COLUMN_EXPRESSION  a kifejezés, aminek értékei alapján az index felépül 
COLUMN_POSITION    a kifejezés hányadik az index bejegyzések sorrendjében

DBA_CLUSTERS 
DBA_CLU_COLUMNS
DBA_CLUSTER_HASH_EXPRESSIONS

DBA_PART_TABLES
DBA_PART_INDEXES
DBA_TAB_PARTITIONS
DBA_IND_PARTITIONS
DBA_TAB_SUBPARTITIONS
DBA_IND_SUBPARTITIONS
DBA_PART_KEY_COLUMNS
DBA_SUBPART_KEY_COLUMNS
*/


--Adatbázis objektumok (DBA_OBJECTS)
--------------------

--Milyen típusú objektumai vannak az orauser nevű felhasználónak az adatbázisban?
SELECT distinct object_type FROM dba_objects
WHERE owner='ORAUSER';

--Kinek a tulajdonában van a DBA_TABLES nevu nézet (illetve a DUAL nevu tábla)?
select owner from dba_objects
where object_name = 'DBA_TABLES' and object_type = 'VIEW';
select owner from dba_objects
where object_name = 'DUAL' and object_type = 'TABLE';

--Hány különbözõ típusú objektum van nyilvántartva az adatbázisban?
SELECT count(distinct object_type) FROM dba_objects;

--Melyek ezek a típusok?
SELECT distinct object_type FROM dba_objects;

--Kik azok a felhasználók, akiknek több mint 10 féle objektumuk van?
select owner from dba_objects
group by owner
having count(distinct object_type) > 10;

--Kik azok a felhasználók, akiknek van triggere és nézete is?
select distinct obj1.owner from dba_objects obj1, dba_objects obj2
where obj1.object_type = 'TRIGGER' and obj1.owner = obj2.owner and obj2.object_type = 'VIEW';

--Kik azok a felhasználók, akiknek van nézete, de nincs triggere?
SELECT distinct owner FROM dba_objects WHERE object_type='VIEW'
MINUS
SELECT distinct owner FROM dba_objects WHERE object_type='TRIGGER';

--Kik azok a felhasználók, akiknek több mint 40 táblájuk, de maximum 37 indexük van?
SELECT distinct owner FROM dba_objects WHERE object_type='TABLE'
GROUP BY owner
HAVING count(*) > 40
MINUS
SELECT distinct owner FROM dba_objects WHERE object_type='INDEX'
GROUP BY owner
HAVING count(*) >= 37;


--Táblák oszlopai (DBA_TAB_COLUMNS)
---------------

--Adjuk meg azoknak a tábláknak a nevét, amelyeknek legalább 8 darab dátum tipusú oszlopa van.
SELECT owner, table_name FROM dba_tab_columns
WHERE data_type='DATE'
GROUP BY owner, table_name
HAVING count(*) >= 8;

--Adjuk meg azoknak a tábláknak a nevét, amelyeknek 1. es 4. oszlopa is VARCHAR2 tipusú.
SELECT owner, table_name FROM dba_tab_columns
WHERE column_id=1 AND data_type='VARCHAR2'
INTERSECT
SELECT owner, table_name FROM dba_tab_columns
WHERE column_id=4 AND data_type='VARCHAR2';

--Szinoníma kreálás
create synonym dolgozok2 for vdani.dolgozo;
select * from dolgozok2;

--Adatbázis link kreálás
create database link ullman_link
connect to username identified by jelszo
using 'ullman.inf.elte.hu:1521/ullman';

--Melyik típus van aramison de nincs ullmanon
select distinct object_type from dba_objects
MINUS
select distinct object_type from dba_objects@ullman_link;

--Kutatás példa: kinek melyik táblája a select * from sz1;
select * from sz1;

select * from dba_objects
where object_name='SZ1';

select table_owner, table_name from dba_synonyms
where owner='PUBLIC' and synonym_name='SZ1';

select * from dba_objects
where object_name='V1' and owner='NIKOVITS';

select text from dba_views
where owner='NIKOVITS' and view_name='V1';

--Írjunk meg egy plsql procedúrát, amelyik a paraméterül kapott karakterlánc alapján kiírja azoknak a tábláknak a nevét és tulajdonosát, amelyek az adott karakterlánccal kezdõdnek. (Ha a paraméter kisbetûs, akkor is mûködjön a procedúra!)
PROCEDURE table_print(p_kar VARCHAR2) 
--A fenti procedúra segítségével írjuk ki a Z betûvel kezdõdõ táblák nevét és tulajdonosát.
CREATE OR REPLACE PROCEDURE table_print(p_kar VARCHAR2) is
CURSOR curs1 IS 
select owner,table_name from dba_tables
where upper(table_name) like upper(p_kar)||'%';
rec curs1%ROWTYPE;
BEGIN
  OPEN curs1;
  LOOP
    FETCH curs1 INTO rec;
    EXIT WHEN curs1%NOTFOUND;
    dbms_output.put_line(rec.owner||' - '||rec.table_name);
  END LOOP;
  CLOSE curs1;
END;
/
--Test:
set serveroutput on
execute table_print('z');

--Melyek azok az objektum típusok, amelyek tényleges tárolást igényelnek, vagyis tartoznak hozzájuk adatblokkok? (A többinek csak a definíciója tárolódik adatszótárban)
select distinct object_type from dba_objects where data_object_id is not null;

--Melyek azok az objektum típusok, amelyek nem igényelnek tényleges tárolást, vagyis nem tartoznak hozzájuk adatblokkok? Mi a metszete az előző lekérdezéssel?
select distinct object_type from dba_objects where data_object_id is not null
intersect
select distinct object_type from dba_objects where data_object_id is null;

--Adjuk meg azoknak a tábláknak a tulajdonosát és nevét, amelyeknek van 'Z' betuvel kezdodo oszlopa.
select distinct owner, table_name from dba_tab_columns
where column_name like 'Z%';

--Melyik a legnagyobb méretű tábla szegmens az adatbázisban (a tulajdonost is adjuk meg) és hány extensből áll? (A particionált táblákat most ne vegyük figyelembe.)
select segment_name, extents from
(select * from dba_segments where segment_type='TABLE'
order by bytes desc)
where rownum <= 1;

--Van-e a NIKOVITS felhasználónak olyan táblája, amelyik több adatfájlban is foglal helyet? (Aramis)
SELECT segment_name, count(distinct file_id)
FROM dba_extents WHERE owner='NIKOVITS' AND segment_type='TABLE'
GROUP BY segment_name HAVING count(distinct file_id) > 1;

--A NIKOVITS felhasználó CIKK táblája hány blokkot foglal le az adatbázisban? (ARAMIS) (Vagyis hány olyan blokk van, ami ehhez a táblához van rendelve és így azok már más táblákhoz nem adhatók hozzá?)
SELECT bytes, blocks FROM dba_segments
WHERE owner='NIKOVITS' AND segment_name='CIKK' AND segment_type='TABLE';

--A NIKOVITS felhasználó CIKK táblájának adatai hány blokkban helyezkednek el? (Vagyis a tábla sorai ténylegesen hány blokkban vannak tárolva?)
--!!! -> Ez a kérdés nem ugyanaz mint az előző.
SELECT count(*) FROM
(SELECT DISTINCT dbms_rowid.rowid_relative_fno(ROWID) fajl,
        dbms_rowid.rowid_block_number(ROWID) blokk
 FROM nikovits.cikk);

--Melyik két felhasználó objektumai foglalnak összesen a legtöbb helyet az adatbázisban? Vagyis ki foglal a legtöbb helyet, és ki a második legtöbbet?
SELECT * FROM 
(select owner, sum(bytes) from dba_segments 
group by owner order by 2 desc)
WHERE rownum <= 2;

--Adjuk meg az adatbázishoz tartozó adatfile-ok (és temporális fájlok) nevét és méretét méret szerint csökkenõ sorrendben.
select * from 
    (select distinct file_name, bytes from dba_data_files
    union
    select distinct file_name, bytes from dba_temp_files)
order by bytes desc;

--Adjuk meg adatfájlonkent, hogy az egyes adatfájlokban mennyi a foglalt hely összesen (írassuk ki a fájlok méretét is).
select file_name, dba_extents.file_id, dba_data_files.bytes, sum(dba_extents.bytes) 
from dba_extents join dba_data_files on dba_data_files.file_id=dba_extents.file_id
group by file_name, dba_extents.file_id, dba_data_files.bytes;

--Adjuk meg, hogy milyen táblaterek vannak létrehozva az adatbűzisban, az egyes tűblaterek hűny adatfájlból állnak, es mekkora az összmeretuk. (tablater_nev, fajlok_szama, osszmeret) !!! Vigyázat, van temporális táblatér is.
select tablespace_name, count(*), sum(bytes) from 
    (select distinct tablespace_name, bytes from dba_data_files
    union
    select distinct tablespace_name, bytes from dba_temp_files)
group by tablespace_name;

--Hány extens van a 'users01.dbf' adatfájlban? Mekkora ezek összmérete?
select file_id, count(extent_id), sum(bytes) from dba_extents
where file_id = (select file_id from dba_data_files where file_name like '%users01%')
group by file_id;

--Hány összefüggő szabad terület van a 'users01.dbf' adatfájlban? Mekkora ezek összmérete?
SELECT count(*), sum(fr.bytes) FROM dba_data_files f, dba_free_space fr
WHERE file_name LIKE '%/users02%' AND f.file_id=fr.file_id;

--Hány százalékban foglalt a 'users01.dbf' adatfájl?
SELECT sum(e.bytes)/f.bytes FROM dba_data_files f, dba_extents e
WHERE file_name LIKE '%/users01%' AND f.file_id=e.file_id
GROUP BY f.bytes;

--Melyik táblatéren van az ORAUSER felhasználó dolgozo táblája?
select tablespace_name from dba_tables
where owner='ORAUSER' and table_name='DOLGOZO';

--Melyik táblatéren van a NIKOVITS felhasználó ELADASOK táblája? (Miért lesz null?)
select tablespace_name from dba_tables
where owner='NIKOVITS' and table_name='ELADASOK';

select tablespace_name from dba_extents
where owner='NIKOVITS' and segment_name='ELADASOK';

-- Mekkora az adatblokkok mérete a USERS táblatéren?
select block_size from dba_tablespaces
where tablespace_name='USERS';

--Van-e olyan táblatér, amelynek nincs DBA_DATA_FILES-beli adatfájlja? Ennek adatai hol tárolódnak? -> DBA_TEMP_FILES
select tablespace_name from dba_tablespaces
minus
select tablespace_name from dba_data_files;

--A NIKOVITS felhasználó CIKK táblájának adatai melyik blokkokban helyezkednek el, és hány sor van az egyes blokkokban?(file_id, blokk_id, darab)
SELECT dbms_rowid.rowid_relative_fno(ROWID) fajl,
       dbms_rowid.rowid_block_number(ROWID) blokk, count(*)
FROM nikovits.cikk
GROUP BY dbms_rowid.rowid_relative_fno(ROWID), dbms_rowid.rowid_block_number(ROWID);

--Hozzunk létre egy táblát az EXAMPLE táblatéren, amelynek szerkezete azonos a nikovits.cikk  tábláéval és pontosan 128 KB helyet foglal az adatbázisban. Foglaljunk le manuálisan további 128 KB helyet a táblához. Vigyünk fel sorokat addig, amig az első blokk tele nem lesz, és 1 további sora lesz még a táblának a második blokkban.
create or replace procedure beszuras as
    fajl_id integer;
    blokk_id integer;
    darab integer;
    blokk_szam integer := 1;
    i integer := 1;
begin   
    while blokk_szam <= 1 loop
        insert into sajatcikk select * from nikovits.cikk 
        where ckod=i;
        commit;
        i := i+1;
        
        select count(*) into blokk_szam from
        (SELECT dbms_rowid.rowid_relative_fno(ROWID) fajl,
               dbms_rowid.rowid_block_number(ROWID) blokk
        FROM sajatcikk
        GROUP BY dbms_rowid.rowid_relative_fno(ROWID), 
        dbms_rowid.rowid_block_number(ROWID));
        
        dbms_output.put_line(blokk_szam);
    end loop;
end;
/

--Oracle indexek (DBA_INDEXES, DBA_IND_COLUMNS, DBA_IND_EXPRESSIONS)
--------------

--Adjuk meg azoknak a tábláknak a nevét, amelyeknek van csökkenõ sorrendben indexelt oszlopa.
select table_owner, table_name, column_name from dba_ind_columns
where descend='DESC'
group by table_owner, table_name, column_name;

--Adjuk meg azoknak az indexeknek a nevét, amelyek legalább 9 oszloposak.(Vagyis a táblának legalább 9 oszlopát vagy egyéb kifejezését indexelik.)
select index_owner, index_name, count(column_name) from dba_ind_columns
group by index_owner, index_name
having count(column_name) >= 9;

--Adjuk meg azon kétoszlopos indexek nevét és tulajdonosát, amelyeknek legalább az egyik kifejezése függvény alapú.
select index_owner, index_name, count(column_position) 
from dba_ind_columns
where (index_owner, index_name) in 
                    (select index_owner, index_name 
                    from dba_ind_expressions
                    group by index_owner, index_name)
group by index_owner, index_name
having count(column_position)=2;

--Adjuk meg a NIKOVITS felhasználó tulajdonában levõ index-szervezett táblák nevét.(Melyik táblatéren vannak ezek a táblák? -> miért nem látható?)
select owner, table_name, iot_name, iot_type, tablespace_name 
from dba_tables
where owner='NIKOVITS'
and iot_type = 'IOT';

--Adjuk meg a fenti táblák index részét, és azt, hogy ezek az index részek (szegmensek) melyik táblatéren vannak?
select * from dba_segments
where segment_name = 'CIKK_IOT_PK'
and owner='NIKOVITS';


--Partícionálás(DBA_PART_TABLES, DBA_PART_INDEXES, DBA_TAB_PARTITIONS, DBA_IND_PARTITIONS, DBA_TAB_SUBPARTITIONS, DBA_IND_SUBPARTITIONS, DBA_PART_KEY_COLUMNS)
-------------

--Adjuk meg az NIKOVITS felhasználó tulajdonában levõ partícionált táblák nevét és a particionálás típusát.
select table_name, partitioning_type 
from dba_part_tables
where owner='NIKOVITS';

--Soroljuk fel az NIKOVITS.ELADASOK tábla partícióit valamint, hogy hány blokkot foglalnakaz egyes partíciók. (Vigyázat! Különbözõ értéket kaphatunk a különbözõ adatszótárakban)
select partition_name, blocks 
from dba_extents
where owner='NIKOVITS'
and segment_name='ELADASOK';

--Adjuk meg, hogy az NIKOVITS.ELADASOK4 tábla mely oszlop(ok) szerint van particionálva.
select column_name from DBA_PART_KEY_COLUMNS
where owner='NIKOVITS' and name='ELADASOK4'
union
select column_name from DBA_SUBPART_KEY_COLUMNS
where owner='NIKOVITS' and name='ELADASOK4';

--Adjuk meg, hogy a NIKOVITS.ELADASOK3 tábla második partíciójában milyen értékek szerepelhetnek.
select high_value from dba_tab_partitions
where table_owner='NIKOVITS'
and table_name='ELADASOK3'
and partition_position=2;

--Klaszter (CLUSTER) (DBA_CLUSTERS, DBA_CLU_COLUMNS, DBA_TABLES, DBA_CLUSTER_HASH_EXPRESSIONS)
------------------

--Adjunk meg egy olyan clustert az adatbázisban (ha van ilyen), amelyen még nincs egy tábla sem. 
SELECT owner, cluster_name
FROM dba_clusters
minus
select owner, cluster_name from dba_tables
where cluster_name is not null;

--Adjunk meg egy olyant, amelyiken legalább 2 (esetleg 3) darab tábla van.
select owner, cluster_name, count(*) 
from dba_tables
where cluster_name is not null
group by owner, cluster_name
having count(*) = 6;

--Adjunk meg egy olyan clustert, amelynek a cluster kulcsa 3 oszlopból áll.(Vigyázat!!! Több tábla is lehet rajta)
select distinct owner, cluster_name, darab from (
SELECT owner, cluster_name, table_name, count(clu_column_name) darab
FROM dba_clu_columns
group by owner, cluster_name, table_name
having count(clu_column_name) = 3);

--HASH CLUSTER
--Hány olyan hash cluster van az adatbázisban, amely nem az oracle alapértelmezés szerinti hash függvényén alapul?
select count(*) from
(SELECT distinct owner, cluster_name
FROM dba_cluster_hash_expressions
group by owner, cluster_name);


--Kérdések és válaszok
------------------------------
--1. Honnan kaphatunk információkat az adatbázisban tárolt dolgokról és azok tulajdonságairól?
/*
az adatszótár nézetekbõl, amiknek a neve általában a következõ karakterláncok valamelyikével kezdõdik:
  USER (az adott user tulajdonában lévõ objektumok) pl. USER_TABLES
  ALL  (amihez joga van az adott usernek) pl. ALL_TABLES
  DBA  (az adatbázis összes objektuma) pl. DBA_TABLES
*/

--2. Mely táblák vannak például egy adott felhasználó tulajdonában?
--A DBA_TABLES adatszótár az összes táblát felsorolja

SELECT table_name FROM dba_tables WHERE owner='HR';
/*
table_name
-----------
DEPARTMENTS
EMPLOYEES
JOBS
JOB_HISTORY
...
*/

--3. Milyen nevû és típusú oszlopai vannak egy táblának, melyik az elsõ, második oszlopa stb.?
--A DBA_TAB_COLUMNS adatszótár minden fontos információt tartalmaz, lásd pl. az alábbit:

CREATE TABLE proba1
  (c10 CHAR(10) DEFAULT 'bubu',
   vc20 VARCHAR2(20),
   blo BLOB,
   num NUMBER,
   num10_2 NUMBER(10,2),
   num10 NUMBER(10) DEFAULT 100,  
   dat DATE DEFAULT TO_DATE('2007.01.01', 'yyyy.mm.dd'),
   rid ROWID);
   
--A fenti tábla adatainak lekérdezése:
SELECT column_id, column_name, data_type, data_length, data_precision, data_scale, data_default
FROM dba_tab_columns WHERE owner='NIKOVITS' AND table_name='PROBA1' ORDER BY column_id;

/*
c_id c_name data_type  data_length  prec   scale    data_default
----------------------------------------------------------------------------------------
1	C10		CHAR		10						'bubu'
2	VC20	VARCHAR2	20			
3	BLO		BLOB		4000			
4	NUM		NUMBER		22			
5	NUM10_2	NUMBER		22		10		2	
6	NUM10	NUMBER		22		10		0		100
7	DAT		DATE		7						TO_DATE('2007.01.01', 'yyyy.mm.dd')
8	RID		ROWID		10			
*/

--4. Milyen további dolgok vannak még az adatbázisban a táblákon kívül?
--Sok egyéb dolg van, pl. nézetek, indexek, procedúrák stb. Minden fel van sorolva a típusával együtt a DBA_OBJECTS adatszótárban.
SELECT object_name, object_type FROM DBA_OBJECTS WHERE owner='NIKOVITS';
/*
object_name     object_type
-------------------------------
CIKK		TABLE
CIKK_IOT_PK	INDEX
CIKK_PROJ_DB	VIEW
CIMLISTA_TAB	TYPE
CITIES_SPIDX	INDEX
CL1		CLUSTER
ELADASOK	TABLE
ELADASOK	TABLE PARTITION
GEOM2SVG	PROCEDURE
*/

--5. Mennyi helyet foglal el egy tábla (index) az adatbázisban?

--Elõször is nem mindegyik objektum foglal el ténylegesen tárhelyet az adatbázisban (lemezen). Egy nézet vagy procedúra például nem foglal helyet, egy tábla vagy index viszont igen. Amikor olyan objektumot hozunk létre, amelyik helyet foglal, az adatbáziskezelõ létrehoz egy (vagy több)  adatszegmenst, amely további kisebb részekbõl áll. Ezek a kisebb részek az extensek, amelyek adatblokkokból épülnek fel. Fõ szabály szerint egy objektum egy szegmenst jelent, de vannak speciális objektumok, pl. a partícionált tábla, amelyik több szegmensbõl is állhat. Ha tehát azt szeretnénk megtudni, hogy egy tábla vagy index mennyi helyet foglal, akkor a hozzá tartozó szegmens tulajdonságait kell megnéznünk a DBA_SEGMENTS szótárban.
SELECT owner, segment_name, segment_type, extents, blocks, bytes 
FROM dba_segments WHERE owner='SH' AND segment_name IN ('CUSTOMERS', 'CUSTOMERS_PK');
/*
owner  segment_name  segment_type   extents   blocks    bytes
----------------------------------------------------------------
SH		CUSTOMERS_PK	INDEX		16		128			1048576
SH		CUSTOMERS		TABLE		27		1536		12582912
*/
--A fentiekbõl az is látható, hogy az objektum hány extensbõl áll, hány adatblokkot és bájtot foglal. Azok az objektumok, amelyek nem foglalnak helyet (pl. egy nézet) nem jelennek meg a DBA_SEGMENTS adatszótárban, vagyis hozzájuk nem tartozik szegmens.

--6. Hol vannak ténylegesen tárolva az adatok?
--Az adatok adatfájlokban vannak tárolva, a fájlok adatblokkokból állnak. A DBA_DATA_FILES adatszótár megmondja, hogy mely fájlokból áll az adatbázis, hol helyezkednek el a lemezen és mekkora a méretük bájtokban és blokkokban.
SELECT file_id, file_name, bytes, blocks FROM dba_data_files;
/* 
file_id    file_name                                     bytes          blocks
------------------------------------------------------------------------------
1	/u01/app/oracle/oradata/ablinux/system01.dbf		734003200		89600
2	/u01/app/oracle/oradata/ablinux/sysaux01.dbf		1289748480		157440
3	/u01/app/oracle/oradata/ablinux/undotbs01.dbf		671088640		81920
4	/u01/app/oracle/oradata/ablinux/users01.dbf			456130560		55680
5	/u01/app/oracle/oradata/ablinux/example01.dbf		1572864000		192000
6	/u01/app/oracle/oradata/ablinux/users02.dbf			1048576000		128000
*/

--7. Hogyan tudhatom meg pontosabban, hogy egy táblához mely adatblokkok tartoznak?
--Errõl az extensek adnak pontosabb képet. Az extens egy összefüggõ (szomszédos blokkokból álló) terület, amelyik teljes egészében egy adatfájlban van. A DBA_EXTENTS szótárból megnézhetjük, hogy melyik fájlban van, a fájlnak hányadik blokkjánál kezdõdik és hány blokknyi a mérete.
SELECT segment_name, segment_type, file_id, block_id, blocks 
FROM dba_extents WHERE owner='NIKOVITS' AND segment_name='TABLA_123';
/*
segment_name  segment_type   file_id   block_id  blocks
-------------------------------------------------------
TABLA_123		TABLE			6		4168       8
TABLA_123		TABLE			4		1736       8
TABLA_123		TABLE			4		1744       8
TABLA_123		TABLE			4		1992       8
*/
--A fenti tábla két különbözõ fájlban (file_id=4, file_id=6) összesen 4 extenssel rendelkezik, mindegyik extens mérete 8 blokk.


--8. Mely objektumokhoz tartozik és melyekhez nem tartozik szegmens?
--Nem csak onnak lehet tudni, hogy egy objektumnak nincs szegmense, hogy nem szerepel a DBA_SEGMENTS szótárban, hanem ez már a DBA_OBJECTS szótárból is látható. Minden adatbázisbeli objektumnak van egy egyedi objektum azonosítója (OBJECT_ID), és amelyikhez tartozik (vagy a késõbbiekben tartozhat ) szegmens, annak egy úgynevezett adatobjektum azonosítója is van (DATA_OBJECT_ID).  Amelyik objektumhoz nem tartozhat szegmens, annak az adatobjektum azonosítója NULL vagy 0.  Ezen utóbbi objektumokra azt mondjuk, hogy tényleges tárolást nem igénylõ objektumok.  Ezeknek csak a definíciója van (szövegesen) tárolva a szótárban.
SELECT object_name, object_type, object_id, data_object_id FROM dba_objects WHERE owner='NIKOVITS';
/*
object_name  object_type    object_id  data_object_id
-----------------------------------------------------
CIKK			TABLE		93589		93589
C_CKOD			INDEX		98330		98330
GEOM2SVG		PROCEDURE	93211		(null)
CIMLISTA_TAB	TYPE		91577   	(null)	
CL1				CLUSTER		96055		96055
CIKK_PROJ_DB	VIEW		99572		(null)
 */

--9. Mik azok a táblaterek?
--A táblaterek olyan logikai egységek, amelyekbe az adatbázisban tárolt objektumokat tehetjük. Azért logikai egységek, mert fizikailag több adatfájlból állhatnak, amelyek akár különbözõ lemezeken is lehetnek. Nagyon sok tárolással kapcsolatos paramétert a táblaterek szintjén lehet megadni, így például a blokkok méretét is. Így egy adatbázisban több különbözõ méretû adatblokk is lehet, de egy táblatérben csak egyféle méret lehetséges.  Sokféle adminisztrációs mûvelet is elvégezhetõ táblatér szinten, pl. leállítás, mentés, és így nem kell az egész adatbázist leállítanunk ezek elvégzéséhez. A tárolt adatobjektumok, a szegmensek mindig egy táblatérhez tartoznak.  Egy táblatéren tárolhatunk "normális" adatokat, temporális (lekérdezés közben szükséges átmeneti) adatokat vagy a naplózáshoz szükséges (ugynevezett UNDO) adatokat. A fenti 3-ból a táblatér csak egyfélét tárolhat, ezt a táblatér létrehozásakor meg kell adnunk. Az adatbázisban vannak kötelezõen létezõ táblaterek (SYSTEM, SYSAUX), amelyek az  adatszótár táblákat és egyéb belsõ információkat tárolnak.
SELECT tablespace_name, status, block_size, CONTENTS FROM dba_tablespaces;
/*
TABLESPACE_NAME                STATUS    BLOCK_SIZE             CONTENTS  
------------------------------ --------- ---------------------- --------- 
SYSTEM                         ONLINE    8192                   PERMANENT 
SYSAUX                         ONLINE    8192                   PERMANENT 
UNDOTBS1                       ONLINE    8192                   UNDO      
TEMP                           ONLINE    8192                   TEMPORARY 
USERS                          ONLINE    8192                   PERMANENT 
EXAMPLE                        ONLINE    8192                   PERMANENT 
RDF_USERS                      ONLINE    8192                   PERMANENT
*/

--10. A ROWID
--Az Oracle sok esetben használ olyan mutatókat, amelyek egy tábla valamelyik sorára mutatnak. Például az indexek is tartalmaznak ilyen mutatókat a kulcsérték mellett. Ezek a mutatók megadják, hogy az adott sor melyik szegmensben (adatobjektumban), melyik fájlban, annak melyik (hányadik) blokkjában és a blokkon belül hányadik sorban van. A fenti információk mindegyikét egy egész számmal megadott azonosító tartalmazza, hiszen minden  adatobjektumnak, fájlnak, blokknak és sornak van egy sorszáma. A ROWID ezeket az információkat  kódolva tárolja a következõ formában: OOOOOOFFFBBBBBBRRR.
--A ROWID-bõl a számot visszanyerni a DBMS_ROWID package függvényeivel lehet. Például ha azt szeretnénk megtudni, hogy a táblának egy sora melyik adatobjektumban (szegmensben), melyik adatfájlban, azon belül melyik blokkban van, kérdezzük le a következõt:
SELECT dnev, dbms_rowid.rowid_object(ROWID) adatobj, 
	dbms_rowid.rowid_relative_fno(ROWID) fajl,
	dbms_rowid.rowid_block_number(ROWID) blokk,
	dbms_rowid.rowid_row_number(ROWID) sor
FROM dolgozo WHERE dnev = 'KING';
/*
DNEV       ADATOBJ                FAJL BLOKK SOR     
---------- ---------------------- ---- ----- --- 
KING       248453                 6    54988  19   
*/
--A kapott elsõ két szám megtalálható a DBA_OBJECTS.DATA_OBJECT_ID és a DBA_DATA_FILES. FILE_ID oszlopokban.
SELECT owner, object_name, object_type FROM dba_objects WHERE data_object_id=248453;
/*
OWNER                          OBJECT_NAME    OBJECT_TYPE         
------------------------------ -------------- ------------------- 
NIKOVITS                       DOLGOZO        TABLE               
*/
SELECT file_name, tablespace_name FROM dba_data_files WHERE file_id=6;
/*
FILE_NAME                                       TABLESPACE_NAME  
----------------------------------------------- ---------------
/home/oracle/oradata/ORA11G/users02.dbf         USERS
*/

--11. Késleltetett szegmens létrehozás
--Amikor egy táblát létrehozunk, de még nincs egyetlen sora sem, a rendszer lehetséges, hogy nem fog  adatblokkokat lefoglalni a tábla számára, vagyis nem fog létrehozni szegmenst. Ezt a fajta viselkedést egy külön paraméter beállításával kérhetjük. A paraméter neve: deferred_segment_creation.  A paramétert beállíthatjuk az egész instanciára vonatkozóan (system) vagy csak az aktuális session-re vonatkozóan. (Az instancia szintû beállítást általában csak a DBA teheti meg.) Ha ilyen paraméterrel hoztuk létre a táblát, akkor csak az elsõ sor beszúrásakor fog tényleges adatblokkokat lefoglalni, korábban nem. 

-- alter system set deferred_segment_creation=false;
alter session set deferred_segment_creation=true;
create table aaa(o int);
-- a tábla már létrejött, adatobjektum azonosítója is van, de még nincs szegmense
select * from user_tables where table_name like 'AA%';
select * from user_objects where object_name like 'AA%';
select * from user_segments where segment_name like 'AA%';
insert into aaa values(1);
-- kérdezzük le ismét az elõzõ hármat, most már lesz szegmense
drop table aaa;



--basic INDEX
CREATE TABLE emp AS SELECT * FROM nikovits.emp;

--unique index
CREATE UNIQUE INDEX  emp1 ON emp (ename);
--composite index
CREATE INDEX         emp2 ON emp (empno, sal DESC);
--reverse key index
CREATE INDEX         emp3 ON emp (empno, sal) REVERSE;
--tömörítéses index
CREATE INDEX         emp4 ON emp (empno, ename, sal) COMPRESS 2;
--bitmap index
CREATE BITMAP INDEX  emp5 ON emp (deptno);
--függvény alapú index
CREATE INDEX         emp6 ON emp (SUBSTR(ename, 2, 2), job);

select * from dba_indexes
where owner='RDDZXA' and table_name ='EMP';

select * from dba_ind_columns
where index_owner='RDDZXA' and table_name ='EMP';

--csak a függvény alapú oszlopú indexek kerülnek ide
select * from dba_ind_expressions
where index_owner='RDDZXA' and table_name ='EMP';

--Adjuk meg azon kétoszlopos indexek nevét és tulajdonosát, amelyeknek legalább az egyik kifejezése függvény alapú.
select index_owner, index_name, table_name from dba_ind_columns
group by index_owner, index_name, table_name
having count(*)=2
intersect
select index_owner, index_name, table_name from dba_ind_expressions;

CREATE TABLE eladasok (szla_szam   NUMBER(5), 
                       szla_nev    CHAR(30), 
                       mennyiseg   NUMBER(6), 
                       het         INTEGER ) 
PARTITION BY RANGE (het)  
 (PARTITION negyedev1  VALUES LESS THAN (13) SEGMENT CREATION IMMEDIATE 
    STORAGE(INITIAL 8K NEXT 8K) TABLESPACE users, 
  PARTITION negyedev2  VALUES LESS THAN (26) SEGMENT CREATION IMMEDIATE 
    STORAGE(INITIAL 8K NEXT 8K) TABLESPACE example, 
  PARTITION negyedev3  VALUES LESS THAN (39) SEGMENT CREATION IMMEDIATE  
    STORAGE(INITIAL 8K NEXT 8K) TABLESPACE users);

insert into eladasok values(100, 'Sport cikkek', 231, 2);
insert into eladasok values(101, 'Irodai termekek', 1200, 3);
insert into eladasok values(102, 'Eszkozok', 43, 4);
insert into eladasok values(103, 'Gepek', 21, 6);
insert into eladasok values(104, 'Butorok', 31, 7);
insert into eladasok values(105, 'Ingatlan', 3, 8);
insert into eladasok values(106, 'Szolgaltatasok', 200, 9);
insert into eladasok values(107, 'Elelmiszer', 300, 40); -- ezt már nem tudja beszúrni, 40 > 39 


--mintaZH
------------------

--Adjuk meg azokat a táblákat, amelyeknek 26 különböző típusú oszlopuk van. Elvárt kimenet: tulajdonos, táblanév.
select owner, table_name from dba_tab_columns
group by owner, table_name
having count(distinct data_type) = 26
intersect
select owner, object_name as table_name from dba_objects
where object_type='TABLE';

--Hány olyan felhasználó van az adatbázisban, akinek van olyan táblája, amely több adatfájlban is helyet foglal?
select count(distinct owner) as felhasznalok from(
    select owner, segment_name from dba_extents
    where segment_type='TABLE'
    group by owner, segment_name
    having count(distinct file_id) > 1);

--Hány extents van lefoglalva a VDANI felhasználónak a users02.dbf adatfájlban? Elvárt kimenet: extensek száma
select count(distinct extent_id) as "Extensek szama" from dba_extents
where owner='VDANI' and file_id=(select file_id from dba_data_files where file_name like '%users02%');

--Adjuk meg azokat a klasztereket, amelyekhez több, mint 10 tábla tartozik. Elvárt kimenet: klaszter név
select owner, cluster_name from dba_tables
where cluster_name is not null
group by owner, cluster_name
having count(distinct table_name)>10;
    
--Írjunk meg egy PL/SQL procedúrát, amelyik kiírja, hogy a NIKOVITS.HALLGATOK táblának melyek azok az adattblokkjai, amelyekben nincs egyetlen sor sem. Elvárt kimenet: fájl id, blokk id felsorolva
create or replace procedure ures is
    cursor c is
    select * from dba_extents
    where owner='NIKOVITS' and segment_name='HALLGATOK';
    darab integer;
begin
    for sor in c loop
        for i in 0..sor.blocks-1 loop
            select count(*)
            into darab
            from nikovits.hallgatok
            where dbms_rowid.rowid_relative_fno(ROWID) = sor.file_id
            and dbms_rowid.rowid_block_number(ROWID) = sor.block_id+i;
            
            if darab = 0 then
                dbms_output.put_line(sor.file_id || ', ' || to_char(sor.block_id + i) || ', ' || darab);
            end if;
        end loop;
    end loop;
end;
/

set serveroutput on;
execute ures()
