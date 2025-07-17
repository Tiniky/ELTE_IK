select * from user_tables
where table_name = 'DOLGOZO';

select *
from dolgozo;

--foglalkoz�sban van 'MAN' sz�tag
select dnev, dkod, fizetes, foglalkozas
from dolgozo
where fizetes>2800 and foglalkozas like '%MAN%';

-- kik azok a dolgoz�k, akiknek a jutal�ka nagyobb, mint 600
select dnev, jutalek
from dolgozo
where jutalek > 600;

--rendeze fizetes szerint
select * from dolgozo
where jutalek is null
order by oazon, fizetes desc
fetch first 5 rows only;

--gyak3 anyag
select dkod, dnev, Dolgozo.oazon, telephely
from Dolgozo, Osztaly
where Dolgozo.oazon=Osztaly.oazon;

select dkod, dnev, Dolgozo.oazon, telephely
from Dolgozo join Osztaly
on Dolgozo.oazon=Osztaly.oazon;

select dkod, dnev, oazon, telephely
from Dolgozo natural join Osztaly;

--kik azok a dolgoz�k akiknek a f�n�ke KING
select D1.dkod, D1.dnev, D1.fizetes
from Dolgozo D1, Dolgozo D2
where D1.fonoke=D2.dkod and D2.dnev='KING';

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

-- GRANT SELECT ON SZERET TO PUBLIC;

-- uj tabla
select nev
from szeret
where gyumolcs='alma'
union
select nev
from szeret
where gyumolcs='k�rte';