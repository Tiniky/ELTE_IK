--nem engedi törölni mert sérti a tábla integritását
delete from dolgozo
where jutalek is null;

DROP TABLE dolg2;
DROP TABLE oszt2;
CREATE TABLE dolg2 AS SELECT * FROM dolgozo;
CREATE TABLE oszt2 AS SELECT * FROM osztaly;

--1. Töröljük azokat a dolgozókat (a dolg2 táblából), akiknek jutaléka NULL.
delete dolg2
where jutalek is null;
select * from dolg2;

--visszaállítja
rollback;
select * from dolg2;

--2. Töröljük azokat a dolgozókat, akiknek a belépési dátuma 1982 elõtti.
delete dolg2
where belepes < '1982-01-01';
select * from dolg2;
rollback;
select * from dolg2;

--3. Töröljük azokat a dolgozókat, akik osztályának telephelye DALLAS.
delete from dolg2
where oazon in (select oazon from oszt2 where telephely = 'DALLAS');
select * from dolg2;
rollback;
select * from dolg2;

DELETE FROM dolg2 d
WHERE EXISTS (
  SELECT 1 FROM oszt2 o WHERE o.telephely = 'DALLAS' AND o.oazon = d.oazon
);
rollback;

--4. Töröljük azokat a dolgozókat, akiknek a fizetése kisebb, mint az átlagfizetés.
delete from dolg2
where fizetes < (select avg(fizetes) from dolg2);
rollback;
select * from dolg2;

--5. Töröljük ki azokat az osztályokat (az oszt2 táblából), ahol dolgozik valaki, akinek a fizetése a Fiz_Kategoria tábla szerint a 2-es kategóriába esik.
DELETE FROM oszt2 o
WHERE EXISTS (
  SELECT * FROM dolg2 d
  INNER JOIN Fiz_Kategoria f ON d.FIZETES BETWEEN f.ALSO AND f.FELSO
  WHERE d.OAZON = o.OAZON AND f.KATEGORIA = 2
);

select * from oszt2;
rollback;
select * from oszt2;

--6. Töröljük ki azon osztályokat, amelyeknek 2 olyan dolgozója van, akinek a fizetése a 2-es fizetési kategóriába esik a Fiz_Kategoria tábla alapján.
DELETE FROM oszt2
WHERE OAZON IN (
    SELECT OAZON
    FROM (
        SELECT OAZON, KATEGORIA, COUNT(*) AS dolgozo_db
        FROM dolg2
        JOIN Fiz_Kategoria ON dolg2.fizetes BETWEEN ALSO AND FELSO
        WHERE KATEGORIA = 2
        GROUP BY OAZON, KATEGORIA
        HAVING COUNT(*) >= 2
    )
);
select * from oszt2;
rollback;
select * from oszt2;

--7. Vigyünk fel egy 'Kovacs' nevû új dolgozót a 10-es osztályra a következõ értékekkel: dkod=1, dnev='Kovacs', oazon=10, belépés=aktuális dátum, fizetés=a 10-es osztály átlagfizetése. A többi oszop legyen NULL.
insert into dolg2(dkod, dnev, oazon, belepes)
values (1, 'Kovacs', 10, sysdate);
select * from dolg2;

-- HA úgy adjuk meg a valuesba hogy &dkod és/vagy &dnev akkor inputról kéri a dolgokat
insert into dolg2(dkod, dnev, oazon, belepes)
values (&dkod, '&dnev', 10, sysdate);
select * from dolg2;

-- lehet több sort is illeszteni
insert into dolg2(dkod, dnev, oazon, belepes)
select dkod+1, dnev||'ex',10, belepes
from dolg2;
select * from dolg2;
rollback;

/* 8. Több sor felvitele: Hozzunk létre egy UjOsztaly nevû táblát, amelynek
      attribútumai megegyeznek az Osztály tábla oszlopaival, plusz van még egy
      numerikus típusú Letszam nevû attribútuma. Ebbe az UjOsztaly táblába az
      insert utasítás 2. alakjával (alkérdéssel ) vigyünk fel új sorokat az osztály és
      dolgozó táblák aktuális tartalmának felhasználásával minden osztály adatát
      kiegészítve az adott osztályon dolgozók létszámával. Azok az osztályok is
      jelenjenek meg ahol nem dolgozik senki, ott a létszám 0 legyen. Továbbá
      ha vannak olyan dolgozók, akiknek nincs (nem ismert) az osztályuk, azok
      létszámát egy oazon=0, onev= 'FIKTIV' és telephely='ISMERETLEN'
      adatokkal rendelkezõ sorba írjuk be.
*/
CREATE TABLE UjOsztaly (
  OAZON NUMBER(2) NOT NULL,
  ONEV VARCHAR2(14),
  TELEPHELY VARCHAR2(13),
  LETSZAM NUMBER(3)
);

INSERT INTO UjOsztaly (OAZON, ONEV, TELEPHELY, LETSZAM)
SELECT o.OAZON, o.ONEV, o.TELEPHELY, COUNT(d.DKOD) AS LETSZAM
FROM Osztaly o
LEFT JOIN Dolgozo d ON o.OAZON = d.OAZON
GROUP BY o.OAZON, o.ONEV, o.TELEPHELY
UNION
SELECT 0, 'FIKTIV', 'ISMERETLEN', COUNT(*) AS LETSZAM
FROM Dolgozo
WHERE OAZON IS NULL;

select * from UjOsztaly;

-- 9. Növeljük meg a 20-as osztályon a dolgozók fizetését 20%-kal.
update dolg2 d
set fizetes = fizetes + (select max(jutalek) from dolg2 where oazon=d.oazon)
where oazon=20;
select * from dolg2;
rollback;
select * from dolg2;

-- alter table: kulcs hozzáadásához
alter table oszt2
add constraint oszt1_empno_pk
primary key (oazon);

alter table dolg2
add constraint uj_empno_pk
foreign key (oazon) references oszt2 (oazon);

--kvíz2 gyak8ból 2)
CREATE TABLE sportcsapatok (
    csapat_id INT PRIMARY KEY,
    nev VARCHAR(50) NOT NULL
);

CREATE TABLE jatekosok (
    id INT PRIMARY KEY,
    nev VARCHAR(50) NOT NULL,
    mezszam INT CHECK (mezszam BETWEEN 1 AND 20),
    csapat_id INT,
    FOREIGN KEY (csapat_id) REFERENCES sportcsapatok (csapat_id)
);

--10. Növeljük meg azok fizetését 500-zal, akik jutaléka NULL vagy a fizetésük kisebb az átlagnál.
UPDATE dolg2
SET fizetes = fizetes + 500
WHERE jutalek IS NULL OR fizetes < (SELECT AVG(fizetes) FROM dolgozo);
select * from dolg2;
rollback;
select * from dolg2;

--11. Növeljük meg mindenkinek a jutalékát a jelenlegi maximális jutalékkal.
UPDATE dolg2
SET jutalek = (SELECT MAX(jutalek) FROM dolgozo);
select * from dolg2;
rollback;
select * from dolg2;

--12. Módosítsuk 'Loser'-re a legrosszabbul keresõ dolgozó nevét.
UPDATE dolg2
SET dnev = 'Loser'
WHERE fizetes = (SELECT MIN(fizetes) FROM dolgozo);
select * from dolg2;
rollback;
select * from dolg2;

--13. Növeljük meg azoknak a dolgozóknak a jutalékát 3000-rel, akiknek legalább 2 közvetlen beosztottjuk van. Az ismeretlen (NULL) jutalékot vegyük úgy, mintha 0 lenne.
UPDATE dolg2
SET jutalek = COALESCE(jutalek, 0) + 3000
WHERE DKOD IN (
    SELECT FONOKE
    FROM dolgozo
    WHERE FONOKE IS NOT NULL
    GROUP BY FONOKE
    HAVING COUNT(*) >= 2
);
select * from dolg2;
rollback;
select * from dolg2;

--14. Növeljük meg azoknak a dolgozóknak a fizetését a jelenlegi minimális fizetés 5%-kával, akiknek van olyan beosztottja, aki minimális fizetéssel rendelkezik.
UPDATE dolg2
SET fizetes = fizetes * 1.05
WHERE DKOD IN (
  SELECT DISTINCT FONOKE
  FROM dolg2
  WHERE FONOKE IS NOT NULL AND FIZETES = (
    SELECT MIN(FIZETES)
    FROM dolg2
  )
);
select * from dolg2;
rollback;
select * from dolg2;

--15. Növeljük meg a nem fõnökök fizetését a saját osztályuk átlagfizetésével.
UPDATE dolg2 d
SET fizetes = fizetes + (
  SELECT AVG(fizetes)
  FROM dolg2
  WHERE oazon = d.oazon AND dkod <> d.fonoke
)
WHERE d.fonoke IS NOT NULL;
select * from dolg2;
rollback;
select * from dolg2;