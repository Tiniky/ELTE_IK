CREATE TABLE emp AS SELECT * FROM nikovits.emp;

--unique index
CREATE UNIQUE INDEX  emp1 ON emp (ename);
--composite index
CREATE INDEX         emp2 ON emp (empno, sal DESC);
--reverse key index
CREATE INDEX         emp3 ON emp (empno, sal) REVERSE;
--t�m�r�t�ses index
CREATE INDEX         emp4 ON emp (empno, ename, sal) COMPRESS 2;
--bitmap index
CREATE BITMAP INDEX  emp5 ON emp (deptno);
--f�ggv�ny alap� index
CREATE INDEX         emp6 ON emp (SUBSTR(ename, 2, 2), job);

select * from dba_indexes
where owner='RDDZXA' and table_name ='EMP';

select * from dba_ind_columns
where index_owner='RDDZXA' and table_name ='EMP';

--csak a f�ggv�ny alap� oszlop� indexek ker�lnek ide
select * from dba_ind_expressions
where index_owner='RDDZXA' and table_name ='EMP';

--Adjuk meg azon k�toszlopos indexek nev�t �s tulajdonos�t, amelyeknek legal�bb az egyik kifejez�se f�ggv�ny alap�.
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
    STORAGE(INITIAL 8K NEXT 8K) TABLESPACE users)
;

insert into eladasok values(100, 'Sport cikkek', 231, 2);
insert into eladasok values(101, 'Irodai termekek', 1200, 3);
insert into eladasok values(102, 'Eszkozok', 43, 4);
insert into eladasok values(103, 'Gepek', 21, 6);
insert into eladasok values(104, 'Butorok', 31, 7);
insert into eladasok values(105, 'Ingatlan', 3, 8);
insert into eladasok values(106, 'Szolgaltatasok', 200, 9);
insert into eladasok values(107, 'Elelmiszer', 300, 40); -- ezt m�r nem tudja besz�rni, 40 > 39 

select * from dba_part_tables
where owner='RDDZXA';

select * from dba_tab_partitions
where table_owner='RDDZXA';

select * from dba_part_key_columns
where owner='NIKOVITS' and name='ELADASOK4';

--Line�ris hashel�s
-- i - kos�rindexhez haszn�lt bitek sz�ma
-- n - kosarak sz�ma
-- r - rekordok sz�ma
-- !! besz�r�sn�l ha a az adott rekordhoz nincs kos�rindex akkor a legel�s elem elt�rhet
-- lehet t�lcsordul�s blokk ha az r/n hat�r�rt�k nem lesz �tl�pve

--FELADAT: i=1, r=3, n=2 besz�rand�: 0001,0110,1011,0111,1100,1111,0100
-- 0 0000
--   1110
-- 1 0101

--r=4
-- 0 0000
--   1110
-- 1 0101
--   0001

--r=5, n=3
--00 0000
--
--01 0101
--   0001
--10 1110
--   0110

--r=6, n=3
--00 0000
--
--01 0101 - 1011
--   0001
--10 1110
--   0110

--r=7, n=3
--00 0000
--
--01 0101 - 1011
--   0001 - 0111
--10 1110
--   0110

--r=8, n=4
--00 0000
--00 1100
--01 0101
--   0001
--10 1110
--   0110
--11 1011
--   0111