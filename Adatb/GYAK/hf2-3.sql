DROP TABLE Fiz_Kategoria;
DROP TABLE Dolgozo;
DROP TABLE Osztaly;

ALTER SESSION SET NLS_DATE_LANGUAGE = ENGLISH;
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';

CREATE TABLE Osztaly
    (OAZON             NUMBER(2) NOT NULL,
     ONEV              VARCHAR2(14),
     TELEPHELY         VARCHAR2(13),
     CONSTRAINT OSZT_PK PRIMARY KEY (OAZON));

INSERT INTO Osztaly VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO Osztaly VALUES (20,'RESEARCH','DALLAS');
INSERT INTO Osztaly VALUES (30,'SALES','CHICAGO');
INSERT INTO Osztaly VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE Dolgozo
    (DKOD               NUMBER(4) NOT NULL,
     DNEV               VARCHAR2(10),
     FOGLALKOZAS        VARCHAR2(9),
     FONOKE             NUMBER(4) CONSTRAINT DOLG_SELF_KEY REFERENCES Dolgozo (DKOD),
     BELEPES            DATE,
     FIZETES            NUMBER(7,2),
     JUTALEK            NUMBER(7,2),
     OAZON              NUMBER(2),
     CONSTRAINT DOLG_FK FOREIGN KEY (OAZON) REFERENCES Osztaly (OAZON),
     CONSTRAINT DOLG_PK PRIMARY KEY (DKOD));

INSERT INTO Dolgozo VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-1981',5000,NULL,10);
INSERT INTO Dolgozo VALUES (7698,'BLAKE','MANAGER',7839,'1-MAY-1981',2850,NULL,30);
INSERT INTO Dolgozo VALUES (7782,'CLARK','MANAGER',7839,'9-JUN-1981',2450,NULL,10);
INSERT INTO Dolgozo VALUES (7566,'JONES','MANAGER',7839,'2-APR-1981',2975,NULL,20);
INSERT INTO Dolgozo VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP-1981',1250,1400,30);
INSERT INTO Dolgozo VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB-1981',1600,300,30);
INSERT INTO Dolgozo VALUES (7844,'TURNER','SALESMAN',7698,'8-SEP-1981',1500,0,30);
INSERT INTO Dolgozo VALUES (7900,'JAMES','CLERK',7698,'3-DEC-1981',950,NULL,30);
INSERT INTO Dolgozo VALUES (7521,'WARD','SALESMAN',7698,'22-FEB-1981',1250,500,30);
INSERT INTO Dolgozo VALUES (7902,'FORD','ANALYST',7566,'3-DEC-1981',3000,NULL,20);
INSERT INTO Dolgozo VALUES (7369,'SMITH','CLERK',7902,'17-DEC-1980',800,NULL,20);
INSERT INTO Dolgozo VALUES (7788,'SCOTT','ANALYST',7566,'09-DEC-1982',3000,NULL,20);
INSERT INTO Dolgozo VALUES (7876,'ADAMS','CLERK',7788,'12-JAN-1983',1100,NULL,20);
INSERT INTO Dolgozo VALUES (7934,'MILLER','CLERK',7782,'23-JAN-1982',1300,NULL,10);
INSERT INTO Dolgozo VALUES (7877,'LOLA','CLERK',7902,'12-JAN-1981',800,NULL,NULL);
INSERT INTO Dolgozo VALUES (7878,'BLACK',NULL,7902,'01-MAY-1987',1800,300,NULL);

CREATE TABLE Fiz_Kategoria (
 KATEGORIA          NUMBER,
 ALSO               NUMBER,
 FELSO              NUMBER);

INSERT INTO Fiz_Kategoria VALUES (1,700,1200);
INSERT INTO Fiz_Kategoria VALUES (2,1201,1400);
INSERT INTO Fiz_Kategoria VALUES (3,1401,2000);
INSERT INTO Fiz_Kategoria VALUES (4,2001,3000);
INSERT INTO Fiz_Kategoria VALUES (5,3001,9999);

COMMIT; 

GRANT SELECT ON Osztaly TO PUBLIC; 
GRANT SELECT ON Dolgozo TO PUBLIC;
GRANT SELECT ON Fiz_Kategoria TO PUBLIC;

ALTER SESSION SET NLS_DATE_LANGUAGE = HUNGARIAN;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY.MM.DD';

SELECT * FROM Osztaly;
SELECT * FROM Dolgozo;
SELECT * FROM Fiz_Kategoria;

-- hazi2-3
--5. Adjuk meg azokat a dolgoz�kat, akiknek a foglalkoz�sa 'MANAGER' (kar.tip.�rt�k)
SELECT dkod, dnev
FROM dolgozo
WHERE foglalkozas='MANAGER';

--6. Kik azok a dolgoz�k, akiknek a fizet�se 2000 �s 4500 k�z�tt van? (dkod, dnev)
SELECT dkod, dnev
FROM dolgozo
WHERE fizetes > 2000 AND fizetes < 4500;

-- 7. Kik azok a dolgoz�k, akik a 10-es vagy a 20-as oszt�lyon dolgoznak?
SELECT dkod, dnev
FROM dolgozo
WHERE oazon=10 OR oazon=20;

-- 10. Kik azok a dolgoz�k, akiknek a jutal�ka kisebb-vagy-egyenl�, mint 600?
SELECT dkod, dnev
FROM dolgozo
WHERE jutalek <= 600;

-- 11. Kik azok a dolgoz�k, akiknek a jutal�ka ismeretlen/hi�nyz� adat.
SELECT dkod, dnev
FROM dolgozo
WHERE jutalek is null;

-- 12. Kik azok a dolgoz�k, akiknek a jutal�ka ismert
SELECT dkod, dnev
FROM dolgozo
WHERE jutalek is not null;

-- 13. List�zzuk ki a dolgoz�kat foglalkoz�sonk�nt, azon bel�l nevenk�nt rendezve.
select * from dolgozo
where jutalek is null
order by foglalkozas, dnev;

-- 14. List�zzuk ki a dolgoz�kat fizet�s szerint cs�kken�leg rendezve.
select * from dolgozo
where jutalek is null
order by fizetes desc;

-- 15. Rendez�s seg�ts�g�vel az els� N sor el�r�se Oracle 12.2 adatb�zisban
select * from dolgozo
where jutalek is null
order by fizetes desc
fetch first 5 rows only;

-- 12. Kik azok a dolgoz�k, akik f�n�k�nek a f�n�ke KING?
select D1.dkod, D1.dnev, D1.fizetes
from Dolgozo D1, Dolgozo D2, Dolgozo D3
where D1.fonoke=D2.dkod and D2.fonoke=D3.dkod and D3.dnev='KING';

-- 13. Adjuk meg azokat a dolgoz�kat, akik t�bbet keresnek a f�n�k�kn�l.
select D1.dnev, D1.fizetes, D2.dnev, D2.fizetes
from Dolgozo D1, Dolgozo D2
where D1.fonoke=D2.dkod and D1.fizetes>D2.fizetes;

-- 14. Kik azok a dolgoz�k, akik oszt�ly�nak telephelye DALLAS vagy CHICAGO?
select dnev
from Dolgozo, Osztaly
where Dolgozo.oazon=Osztaly.oazon and (Osztaly.telephely='DALLAS' or Osztaly.telephely='CHICAGO');

-- 15. Kik azok a dolgoz�k, akik oszt�ly�nak telephelye nem DALLAS �s nem CHICAGO?
select dnev
from Dolgozo, Osztaly
where Dolgozo.oazon=Osztaly.oazon and (Osztaly.telephely!='DALLAS' and Osztaly.telephely!='CHICAGO');

--16. Ki azok a dolgoz�, akiknek a legmagasabb a fizet�se
select dkod, dnev, fizetes
from dolgozo
minus
select D1.dkod, D1.dnev, D1.fizetes
from dolgozo D1, dolgozo D2
where D1.fizetes < D2.fizetes;

DROP TABLE SZERET; 

CREATE TABLE SZERET
    (NEV         VARCHAR2(15),
     GYUMOLCS    VARCHAR2(15));

INSERT INTO SZERET VALUES ('Malacka','alma');
INSERT INTO SZERET VALUES ('Micimack�','alma');
INSERT INTO SZERET VALUES ('Malacka','k�rte');
INSERT INTO SZERET VALUES ('Micimack�','k�rte');
INSERT INTO SZERET VALUES ('Kanga','k�rte');
INSERT INTO SZERET VALUES ('Tigris','k�rte');
INSERT INTO SZERET VALUES ('Micimack�','m�lna');
INSERT INTO SZERET VALUES ('Malacka','m�lna');
INSERT INTO SZERET VALUES ('Kanga','m�lna');
INSERT INTO SZERET VALUES ('Tigris','m�lna');
INSERT INTO SZERET VALUES ('Nyuszi','eper');
INSERT INTO SZERET VALUES ('Malacka','eper');

COMMIT; 

-- 1. Kik szeretik az alm�t?
select nev
from szeret
where gyumolcs='alma';

-- 2. Kik nem szeretik az alm�t? (de valami m�st igen)
select distinct nev
from szeret
where gyumolcs!='alma';

-- 3. Kik szeretik vagy az alm�t vagy a k�rt�t?
select nev
from szeret
where gyumolcs='alma'
union
select nev
from szeret
where gyumolcs='k�rte';

-- 4. Kik szeretik az alm�t is �s a k�rt�t is?
select nev
from szeret
where gyumolcs='alma'
intersect
select nev
from szeret
where gyumolcs='k�rte';

-- 5. Kik azok, akik szeretik az alm�t, de nem szeretik a k�rt�t?
select nev
from szeret
where gyumolcs='alma'
minus
select nev
from szeret
where gyumolcs='k�rte';

-- 6. Kik szeretik vagy az alm�t vagy a k�rt�t, de csak az egyiket?
(select nev
from szeret
where gyumolcs='alma'
minus
select nev
from szeret
where gyumolcs='k�rte')
union
(select nev
from szeret
where gyumolcs='k�rte'
minus
select nev
from szeret
where gyumolcs='alma');
