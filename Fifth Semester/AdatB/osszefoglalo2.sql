--gyak8
create table PLAN_TABLE (
        statement_id       varchar2(30),
        plan_id            number,
        timestamp          date,
        remarks            varchar2(4000),
        operation          varchar2(30),
        options            varchar2(255),
        object_node        varchar2(128),
        object_owner       varchar2(30),
        object_name        varchar2(30),
        object_alias       varchar2(65),
        object_instance    numeric,
        object_type        varchar2(30),
        optimizer          varchar2(255),
        search_columns     number,
        id                 numeric,
        parent_id          numeric,
        depth              numeric,
        position           numeric,
        cost               numeric,
        cardinality        numeric,
        bytes              numeric,
        other_tag          varchar2(255),
        partition_start    varchar2(255),
        partition_stop     varchar2(255),
        partition_id       numeric,
        other              long,
        distribution       varchar2(30),
        cpu_cost           numeric,
        io_cost            numeric,
        temp_space         numeric,
        access_predicates  varchar2(4000),
        filter_predicates  varchar2(4000),
        projection         varchar2(4000),
        time               numeric,
        qblock_name        varchar2(30),
        other_xml          clob
);

EXPLAIN PLAN FOR
SELECT sum(fizetes)
FROM VDANI.DOLGOZO
WHERE oazon='10';

EXPLAIN PLAN FOR
select foglalkozas from VDANI.DOLGOZO
group by foglalkozas;

select plan_table_output from table(dbms_xplan.display());

create index ii27 on fizetes(kategoria);

CREATE TABLE dolgozo AS SELECT * FROM vdani.dolgozo;
CREATE TABLE osztaly AS SELECT * FROM vdani.osztaly;
CREATE TABLE fizetes AS SELECT * FROM vdani.fiz_kategoria;

EXPLAIN PLAN FOR
select distinct onev
from (dolgozo d natural join osztaly o) cross join fizetes f
where d.fizetes > f.also and d.fizetes < f.felso and kategoria = 1;

select plan_table_output from table(dbms_xplan.display());

EXPLAIN PLAN FOR
SELECT sum(darab) FROM VDANI.hivas, VDANI.kozpont, VDANI.primer
WHERE hivas.kozp_azon_hivo=kozpont.kozp_azon AND kozpont.primer=primer.korzet
AND primer.varos = 'Szentendre' 
AND datum + 1 = next_day(to_date('2012.01.31', 'yyyy.mm.dd'),'hétfõ');

EXPLAIN PLAN FOR
SELECT sum(darab) FROM VDANI.hivas, VDANI.kozpont, VDANI.primer
WHERE hivas.kozp_azon_hivo=kozpont.kozp_azon AND kozpont.primer=primer.korzet
AND primer.varos = 'Szentendre' 
AND datum = next_day(to_date('2012.01.31', 'yyyy.mm.dd'),'hétfõ') - 1;

EXPLAIN PLAN FOR
select /*+ full(f) */ distinct onev
from (dolgozo d natural join osztaly o) cross join fizetes f
where d.fizetes > f.also and d.fizetes < f.felso and kategoria = 1;

select plan_table_output from table(dbms_xplan.display());

EXPLAIN PLAN FOR
select /*+ full(f) ordered use_nl(d o) use_nl(f) */ distinct onev
from (dolgozo d natural join osztaly o) cross join fizetes f
where d.fizetes > f.also and d.fizetes < f.felso and kategoria = 1;

select plan_table_output from table(dbms_xplan.display());

EXPLAIN PLAN FOR
select sum(suly)
from nikovits.cikk;

EXPLAIN PLAN FOR
select sum(suly)
from nikovits.cikk
where ckod = 10;

--gyak11
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


--Gyakran előforduló műveletek:

Tábla elérése:

TABLE ACCESS FULL
             HASH          -- hash clusteren levõ táblák elérése a hash függvény alapján
             CLUSTER       -- index clusteren levõ táblák elérése
             BY INDEX ROWID
             BY USER ROWID
             BY GLOBAL INDEX ROWID
             BY LOCAL INDEX ROWID

PARTITION RANGE ALL        -- összes partíció olvasása
PARTITION RANGE SINGLE     -- egyetlen partíció olvasása
PARTITION RANGE ITERATOR   -- több partíció olvasása
INLIST ITERATOR            -- mûveletek ismétlése

SORT AGGREGATE             -- ha csak egy sor lesz a csoportosítás végén
     UNIQUE                -- ismétlõdések megszüntetése, rendezés alapú algoritmussal
     GROUP BY              -- ha több csoport lesz
     JOIN                  -- elõrendezés a join-hoz
     ORDER				   -- egyszerű order by

HASH UNIQUE                -- ismétlõdések megszüntetése, hash alapú algoritmus
HASH GROUP 				   -- csoportosítás, hash alapú algoritmussal
FILTER                     -- egy sorhalmaz szûrése	

Halmazműveletek:

UNION-ALL
MINUS
INTERSECTION
	
Összekapcsolások:

NESTED LOOPS               -- join mûvelet nested loops  algoritmussal
MERGE JOIN                 -- join mûvelet merge join algoritmussal
HASH JOIN                  -- join mûvelet hash join algoritmussal
HASH JOIN OUTER
HASH JOIN ANTI             -- not exist-hez lehet jó
HASH JOIN ANTI NA          -- NULL aware, vagyis NULL is elõfordulhat
HASH JOIN SEMI             -- ha a join után csak az egyik tábla adatai kellenek	

Index elérés:

INDEX FULL SCAN            -- teljes index végigolvasása növekvõ sorrendben
INDEX FULL SCAN DESCENDING -- teljes index végigolvasása csökkenõ sorrendben
INDEX FAST FULL SCAN       -- teljes index végigolvasása, egyszerre több blokkot olvasva
INDEX RANGE SCAN           -- intervallum keresés növekvõ sorrendben (DESCENDING -> csökkenõ)
INDEX UNIQUE SCAN          -- egyedi érték keresés
INDEX SKIP SCAN            -- több oszlopos index olvasása, az elsõ oszlopok ismerete nélkül

BITMAP INDEX SINGLE VALUE      -- egyetlen bitvektor visszaadása
BITMAP AND                     -- bitmapek közötti logikai mûvelet
BITMAP OR                      -- bitmapek közötti logikai mûvelet
BITMAP CONVERSION TO ROWIDS    -- bitmap átalakítása sorazonosítóvá
BITMAP CONVERSION FROM ROWIDS  -- sorazonosító átalakítása bitmappé
BITMAP CONVERSION COUNT        -- ha csak a sorazonosítók számára van szükség

----------------------------------------------------------------------------------------

--Tippek (hint) adása az optimalizálónak

Fontos megjegyzések:

Mindig csak arra az utasitás blokkra vonatkoznak, amiben szerepelnek. 
Az utasitás blokk a következõk egyike lehet:
- Egyszerû SELECT, UPDATE, DELETE INSERT utasitas
- Komplex utasitásban a subquery, vagy a kulsõ utasitás (pl. INSERT ... SELECT ...)
- Összetett utasitás egyik része (pl. SELECT ... UNION SELECT ... esetén)
A tipp csak közvetlenül az utasitás kulcsszava után jöhet megjegyzésben.
[SELECT|DELETE|UPDATE|INSERT]   /*+  tipp lista  */    (a '+' elõtt nincs szoköz !!! )
Ha hiba van a hint-ben az oracle figyelmen kívül hagyja de nem jelez hibát.

Példák:
SELECT /*+ tipp lista */  * FROM emp WHERE ...
SELECT /*+ tipp lista */  * FROM emp WHERE deptno IN ( SELECT /*+ tipp lista */  deptno FROM ...)
INSERT /*+ tipp lista */  ... SELECT /*+ tipp lista */  ...
SELECT /*+ tipp lista */  ...  UNION  SELECT /*+ tipp lista */  ...

Fontos! Ha minõsített tábla szerepel a lekérdezésben akkor használjunk aliast, pl.
SELECT /*+ full(c) */ ... FROM nikovits.cikk c ...

----------------------------------------------------------------------------------------

--Gyakran előforduló hintek:

ALL_ROWS
Költseg alapú optimalizalast valaszt es azon belul is a teljes lekerdezesre optimalizal.

FIRST_ROWS(n)  
A legjobb valaszidõre optimalizál. Az lekérdezés elsõ n sorát a lehetõ leggyorsabban
próbálja meg visszaadni. Ha nem adjuk meg n-et, akkor n=1-et tekinti.

FULL(tabla)   vagy  FULL(aliasnev)
Nem hasznal indexet, hanem full table scant.

CLUSTER(tabla)
Csak index clusteren lévõ tábláknál van értelme. 

HASH(tabla)
Csak hash clusteren lévõ táblánál van értelme.

INDEX(tabla  [indexlista])
A tablat index alapjan eri el. Ha nem adunk meg index nevet (vagy többet adunk meg) 
akkor a legolcsóbb költségû indexet (a felsoroltakbol) használja.

INDEX_ASC(tabla  [indexlista])
Növekvõ sorrendben eri el az index bejegyzeseket.

INDEX_DESC(tabla  [indexlista])
Megfordítja az alapértelmezett index bejárási sorrendet. Csökkenõ sorrendben éri el 
az index bejegyzéseket. (Illetve csökkenõ indexnél növekvõben.)

INDEX_COMBINE(tabla  [indexlista])
Bitmap indexek segítségével próbálja meg elérni az adatokat.

INDEX_FFS(tabla  [indexlista])
Fast full index scan-re utasítja az optimalizálót a teljes tábla olvasás helyett.

INDEX_JOIN(tabla  [indexlista])
Több index használatával és a sorazonosítók join-olásával érje el a táblát.

AND_EQUAL(tabla  [indexlista])
Több index egyidejû használatával éri el a táblát. A sorazonosítók metszetét képezi.

NO_INDEX(tabla  [indexlista])
A megadott indexek használatáról lebeszéli az optimalizálót.

NO_INDEX_FFS(tabla  [indexlista])
A megadott indexek használatáról lebeszéli az optimalizálót.

NO_EXPAND
Ha a lekérdezésben OR vagy IN szerepel, akkor az optimalizáló hajlamos az egyes
esetek szerint külön-külön keresni (pl. index használatával). Ez a hint errõl 
beszéli le az optimalizálót.

USE_CONCAT
Az OR feltételekbõl uniót hoz létre, és így hajtja végre a lekérdezést.

LEADING(táblalista)
A megadott táblákkal kezdi a lekérdezés végrehajtását. (Hasonló az ORDERED-hez)

ORDERED
A táblákat abban a sorrendben fogja join-olni, ahogy azok a FROM után megjelennek.

USE_HASH(táblalista)
A megadott tablakat hash join-nal join-olja a többi adatforrashoz. 
NO_USE_HASH(táblalista)
Az elõzõ ellentéte.

USE_NL(táblalista)
A megadott tablakat nested looppal join-olja a többi adatforrashoz. A megadott tabla 
lesz a belsõ ciklus tablaja.
NO_USE_NL(táblalista)
Az elõzõ ellentéte

USE_MERGE(táblalista)
A megadott tablakat sort-merge-el join-olja a többi adatforrashoz.
NO_USE_MERGE(tablalista) 
Az elõzõ ellentéte.

NL_SJ, HASH_SJ, MERGE_SJ
NL_AJ, HASH_AJ, MERGE_AJ
A fentieket az alkérdésben lehet hintként megadni, és ekkor (ha lehetséges)
az oracle a megfelelõ algoritmussal fogja a semi-joint, illetve anti-joint
elvégezni.

CACHE(tabla)
Hatasara a tabla blokkjai a buffer cache LRU listajanak "friss" vegere kerulnek. 
Kis tablaknal hasznos, hogy sokaig csücsülhessenek a bufferben.

NOCACHE(tabla)
Hatasara a tabla blokkjai a buffer cache LRU listajanak "régi" vegere kerulnek. 
Alapertelmezes szerint is ide kerulnenek.

--Végrehajtási terv feladatok
--1. Adjuk meg azon szállítások összmennyiségét, ahol ckod=2 és szkod=2.
--a) Adjuk meg úgy a lekérdezést, hogy ne használjon indexet.

select /*+ no_index(c) */ 
sum(mennyiseg) from nikovits.szallit c where ckod = 2 and szkod = 2;

-----------------------------------------------
| Id  | Operation          | Name    | E-Rows |
-----------------------------------------------
|   0 | SELECT STATEMENT   |         |        |
|   1 |  SORT AGGREGATE    |         |      1 |
|*  2 |   TABLE ACCESS FULL| SZALLIT |      1 |
-----------------------------------------------

--b) A végrehajtási tervben két indexet használjon, és képezze a sorazonosítók metszetét (AND-EQUAL).

select /*+ and_equal(s SZT_SZKOD SZT_CKOD) */ 
sum(mennyiseg) from nikovits.szallit s where ckod = 2 and szkod = 2;

-----------------------------------------------------------
| Id  | Operation                    | Name      | E-Rows |
-----------------------------------------------------------
|   0 | SELECT STATEMENT             |           |        |
|   1 |  SORT AGGREGATE              |           |      1 |
|*  2 |   TABLE ACCESS BY INDEX ROWID| SZALLIT   |      1 |
|   3 |    AND-EQUAL                 |           |        |
|*  4 |     INDEX RANGE SCAN         | SZT_CKOD  |     10 |
|*  5 |     INDEX RANGE SCAN         | SZT_SZKOD |    598 |
-----------------------------------------------------------

--2. Adjuk meg a Pecs-i telephelyű szállítók által szállított piros cikkek összmennyiségét. 
--a) Adjuk meg úgy a lekérdezést, hogy a szallit táblát először a cikk táblával join-olja az oracle.

select /*+ ordered */ sum(mennyiseg) 
from nikovits.szallit sz, nikovits.cikk c, nikovits.szallito szto
where sz.szkod=szto.szkod and c.ckod=sz.ckod
and c.szin='piros' and szto.telephely='Pecs';

-----------------------------------------------------------------------------
| Id  | Operation            | Name     | E-Rows |  OMem |  1Mem | Used-Mem |
-----------------------------------------------------------------------------
|   0 | SELECT STATEMENT     |          |        |       |       |          |
|   1 |  SORT AGGREGATE      |          |      1 |       |       |          |
|*  2 |   HASH JOIN          |          |    243 |  2545K|  2545K| 1176K (0)|
|*  3 |    TABLE ACCESS FULL | SZALLITO |      4 |       |       |          |
|*  4 |    HASH JOIN         |          |    911 |  1946K|  1946K| 2352K (0)|
|   5 |     TABLE ACCESS FULL| SZALLIT  |  10000 |       |       |          |
|*  6 |     TABLE ACCESS FULL| CIKK     |     91 |       |       |          |
-----------------------------------------------------------------------------

--b) Adjuk meg úgy a lekérdezést, hogy a szallit táblát először a szallito táblával join-olja az oracle.

select /*+ ordered */ sum(mennyiseg) 
from nikovits.szallit sz, nikovits.szallito szto, nikovits.cikk c
where sz.szkod=szto.szkod and c.ckod=sz.ckod
and c.szin='piros' and szto.telephely='Pecs';

-----------------------------------------------------------------------------
| Id  | Operation            | Name     | E-Rows |  OMem |  1Mem | Used-Mem |
-----------------------------------------------------------------------------
|   0 | SELECT STATEMENT     |          |        |       |       |          |
|   1 |  SORT AGGREGATE      |          |      1 |       |       |          |
|*  2 |   HASH JOIN          |          |    243 |  2545K|  2545K| 1642K (0)|
|*  3 |    TABLE ACCESS FULL | CIKK     |     91 |       |       |          |
|*  4 |    HASH JOIN         |          |   2667 |  1946K|  1946K| 2125K (0)|
|   5 |     TABLE ACCESS FULL| SZALLIT  |  10000 |       |       |          |
|*  6 |     TABLE ACCESS FULL| SZALLITO |      4 |       |       |          |
-----------------------------------------------------------------------------

--4. Adjunk meg egy olyan lekérdezést a fenti táblákra (hintekkel együtt ha szükséges), aminek az alábbi lesz a végrehajtási terve:

TERV (OPERATION + OPTIONS + OBJECT_NAME)
----------------------------------------
SELECT STATEMENT +  + 
  SORT + AGGREGATE + 
    TABLE ACCESS + FULL + NIKOVITS.CIKK

select /*+ full(c) */ sum(suly)
from nikovits.cikk c where szin='piros';


SELECT STATEMENT +  + 
  SORT + AGGREGATE + 
    TABLE ACCESS + BY INDEX ROWID + NIKOVITS.CIKK
      INDEX + UNIQUE SCAN + NIKOVITS.C_CKOD

select /*+ index(c) */ sum(suly)
from nikovits.cikk c where ckod=1;


SELECT STATEMENT +  + 
  SORT + AGGREGATE + 
    HASH JOIN +  + 
      TABLE ACCESS + FULL + NIKOVITS.PROJEKT
      TABLE ACCESS + FULL + NIKOVITS.SZALLIT

select /*+ full(p) */ sum(mennyiseg)
from nikovits.szallit sz natural join nikovits.projekt p 
where helyszin='Szeged';


SELECT STATEMENT +  + 
  HASH + GROUP BY + 
    HASH JOIN +  + 
      TABLE ACCESS + FULL + NIKOVITS.PROJEKT
      TABLE ACCESS + FULL + NIKOVITS.SZALLIT

select /*+ full(p) */ sum(mennyiseg)
from nikovits.szallit sz natural join nikovits.projekt p 
where helyszin='Szeged' group by ckod;


SELECT STATEMENT +  + 
  SORT + AGGREGATE + 
    MERGE JOIN +  + 
      SORT + JOIN + 
        TABLE ACCESS + BY INDEX ROWID BATCHED + NIKOVITS.CIKK
          INDEX + RANGE SCAN + NIKOVITS.C_SZIN
      SORT + JOIN + 
        TABLE ACCESS + FULL + NIKOVITS.SZALLIT

select /*+ use_merge(sz c) index(c) */ sum(mennyiseg)
from nikovits.szallit sz natural join nikovits.cikk c 
where szin='piros';


SELECT STATEMENT +  + 
  FILTER +  + 
    HASH + GROUP BY + 
      HASH JOIN +  + 
        NESTED LOOPS +  + 
          TABLE ACCESS + BY INDEX ROWID + NIKOVITS.SZALLITO
            INDEX + UNIQUE SCAN + NIKOVITS.SZO_SZKOD
          TABLE ACCESS + FULL + NIKOVITS.PROJEKT
        TABLE ACCESS + FULL + NIKOVITS.SZALLIT

select /*+ full(sz) */ sum(mennyiseg), ckod
from nikovits.szallit sz, nikovits.szallito szto, nikovits.projekt p
where sz.pkod=p.pkod and sz.szkod=szto.szkod and szto.szkod=15
and helyszin='Szeged' and telephely='Pecs'
group by ckod having ckod>100;



SELECT STATEMENT +  + 
  SORT + AGGREGATE + 
    HASH JOIN + SEMI + 
      TABLE ACCESS + FULL + NIKOVITS.SZALLIT
      TABLE ACCESS + FULL + NIKOVITS.CIKK

select /*+ leading(sz) */ sum(mennyiseg)
from nikovits.szallit sz
where exists
  (select /*+ hash_sj */ ckod from nikovits.cikk c where c.ckod=sz.ckod and szin='piros');
  
  
--mintaZH
--5. feladat Egy lehetséges megoldás:

create table dolgozo_zh_test as select * from vdani.dolgozo_zh;
create index zh_ind on dolgozo_zh_test(dkod);

select * from dolgozo_zh_test
where dkod=7788;

----------------------------------------------------------------
| Id  | Operation                   | Name            | E-Rows |
----------------------------------------------------------------
|   0 | SELECT STATEMENT            |                 |        |
|   1 |  TABLE ACCESS BY INDEX ROWID| DOLGOZO_ZH_TEST |      1 |
|*  2 |   INDEX UNIQUE SCAN         | EMP             |      1 |
----------------------------------------------------------------

--6. feladat
--Add meg úgy a lekérdezést, hogy az összekapcsolás NESTED LOOP algoritmussal történjen.
select /*+ use_nl(dolgozo_zh osztaly_zh) */ dnev 
from dolgozo_zh natural join osztaly_zh
where fizetes > 2000
and telephely='NEW YORK';

--------------------------------------------------
| Id  | Operation          | Name       | E-Rows |
--------------------------------------------------
|   0 | SELECT STATEMENT   |            |        |
|   1 |  NESTED LOOPS      |            |      3 |
|*  2 |   TABLE ACCESS FULL| OSZTALY_ZH |      1 |
|*  3 |   TABLE ACCESS FULL| DOLGOZO_ZH |      3 |
--------------------------------------------------

--Add meg úgy a lekérdezést, hogy az összekapcsolás MERGE JOIN algoritmussal történjen.
select /*+ use_merge(dolgozo_zh osztaly_zh) */ dnev 
from dolgozo_zh natural join osztaly_zh
where fizetes > 2000
and telephely='NEW YORK';

------------------------------------------------------------------------------
| Id  | Operation           | Name       | E-Rows |  OMem |  1Mem | Used-Mem |
------------------------------------------------------------------------------
|   0 | SELECT STATEMENT    |            |        |       |       |          |
|   1 |  MERGE JOIN         |            |      3 |       |       |          |
|   2 |   SORT JOIN         |            |      1 |  2048 |  2048 | 2048  (0)|
|*  3 |    TABLE ACCESS FULL| OSZTALY_ZH |      1 |       |       |          |
|*  4 |   SORT JOIN         |            |     10 |  2048 |  2048 | 2048  (0)|
|*  5 |    TABLE ACCESS FULL| DOLGOZO_ZH |     10 |       |       |          |
------------------------------------------------------------------------------

--7. feladat
/*Az alábbi feladatokhoz használd a VDANI.DOLGOZO_ZH és VDANI.OSZTALY_ZH táblákat.
Írj olyan lekérdezést (akár hintek segítségével), amelynek az alábbi lesz a végrehajtási terve.
Bemásolni a feladatokhoz: lekérdezés és végrehajtási terv.*/
--a)
------------------------------------------------------------------------------
| Id  | Operation           | Name       | E-Rows |  OMem |  1Mem | Used-Mem |
------------------------------------------------------------------------------
|   0 | SELECT STATEMENT    |            |        |       |       |          |
|   1 |  SORT UNIQUE        |            |     11 |  2048 |  2048 | 2048  (0)|
|   2 |   UNION-ALL         |            |        |       |       |          |
|*  3 |    TABLE ACCESS FULL| DOLGOZO_ZH |      8 |       |       |          |
|*  4 |    TABLE ACCESS FULL| DOLGOZO_ZH |      3 |       |       |          |
------------------------------------------------------------------------------

select /*+ full(z) */
from dolgozo_zh z
union
select /*+ full(z) */
from dolgozo_zh z;

--b)
------------------------------------------------------------------------------
| Id  | Operation           | Name       | E-Rows |  OMem |  1Mem | Used-Mem |
------------------------------------------------------------------------------
|   0 | SELECT STATEMENT    |            |        |       |       |          |
|   1 |  HASH GROUP BY      |            |      3 |  1214K|  1214K|  890K (0)|
|*  2 |   HASH JOIN OUTER   |            |     15 |  2545K|  2545K| 1143K (0)|
|   3 |    TABLE ACCESS FULL| OSZTALY_ZH |      4 |       |       |          |
|*  4 |    TABLE ACCESS FULL| DOLGOZO_ZH |     14 |       |       |          |
------------------------------------------------------------------------------

select /*+ use_hash(d o) */ d.oazon
from dolgozo_zh d left outer join osztaly_zh o
on d.oazon = o.oazon
group by d.oazon;

--zh
WRITE(D,95)
OUTPUT(D)
<ABORT K>
WRITE(E,50)
OUTPUT(E)
<ABORT V>
FLUSH LOG

...
<U,B,20>
<T,A,30>
<START CKPT (R,T,U)>
<COMMIT T>
<START V>
<U,D,80>
<V,E,50>
<START K>
<U,B,40>
<COMMIT U>
<COMMIT R>
<END CKPT>

--nem fordulhat elő, már commitolva lett a T aka az időrendi sorrenddel ellentétes lenne

1 > 2
2 > 3
2 > 4
1 > 3

1 > 2
3 > 2
4 > 3
2 > 4

L1(A); L2(A); L3(C); L2(B); L4(B);

L1(A); L2(A); L3(C); L2(B); L4(B); L4(D); L1(C); L3(D);

--F1
create table DOLGOZO_ZH as select * from vdani.dolgozo_zh;
create table OSZTALY_ZH as select * from vdani.osztaly_zh;

create index dolg_ind on DOLGOZO_ZH(dkod);
create BITMAP index oszt_ind on OSZTALY_ZH(okod);

explain plan for
select *
from DOLGOZO_ZH d
join OSZTALY_ZH o on d.dkod = o.okod
where d.dkod = 'kod_ertek' and o.okod = 'okod_ertek';

select d.dnev, o.telephely
from VDANI.DOLGOZO d
join VDANI.OSZTALY o on d.oazon = o.oazon
join VDANI.FIZ_KATEGORIA f on d.fiz_kategoria = f.kategoria
where f.kategoria = 3;

select /*+ USE_HASH(d o) */ d.dnev, o.telephely
from VDANI.DOLGOZO d
join VDANI.OSZTALY o on d.oazon = o.oazon
join VDANI.FIZ_KATEGORIA f on d.fiz_kategoria = f.kategoria
where f.kategoria = 3;

select /*+ NO_INDEX */d.dnev, o.telephely
from VDANI.DOLGOZO d
join VDANI.OSZTALY o on d.oazon = o.oazon
join VDANI.FIZ_KATEGORIA f on d.fiz_kategoria = f.kategoria
where f.kategoria = 3;

SELECT MAX(column_name)
FROM VDANI.ELADASOK
WHERE partition_key = 'certain_value';

SELECT /*+ FULL(t) */ column1, column2, COUNT(*)
FROM VDANI.SZALLIT t
WHERE condition_column = 'certain_value'
GROUP BY column1, column2;
