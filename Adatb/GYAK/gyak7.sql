--nem engedi t�r�lni mert s�rti a t�bla integrit�s�t
delete from dolgozo
where jutalek is null;

DROP TABLE dolg2;
DROP TABLE oszt2;
CREATE TABLE dolg2 AS SELECT * FROM dolgozo;
CREATE TABLE oszt2 AS SELECT * FROM osztaly;

--1. T�r�lj�k azokat a dolgoz�kat (a dolg2 t�bl�b�l), akiknek jutal�ka NULL.
delete dolg2
where jutalek is null;
select * from dolg2;

--vissza�ll�tja
rollback;
select * from dolg2;

--2. T�r�lj�k azokat a dolgoz�kat, akiknek a bel�p�si d�tuma 1982 el�tti.
delete dolg2
where belepes < '1982-01-01';
select * from dolg2;
rollback;
select * from dolg2;

--3. T�r�lj�k azokat a dolgoz�kat, akik oszt�ly�nak telephelye DALLAS.
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

--4. T�r�lj�k azokat a dolgoz�kat, akiknek a fizet�se kisebb, mint az �tlagfizet�s.
delete from dolg2
where fizetes < (select avg(fizetes) from dolg2);
rollback;
select * from dolg2;

--5. T�r�lj�k ki azokat az oszt�lyokat (az oszt2 t�bl�b�l), ahol dolgozik valaki, akinek a fizet�se a Fiz_Kategoria t�bla szerint a 2-es kateg�ri�ba esik.
DELETE FROM oszt2 o
WHERE EXISTS (
  SELECT * FROM dolg2 d
  INNER JOIN Fiz_Kategoria f ON d.FIZETES BETWEEN f.ALSO AND f.FELSO
  WHERE d.OAZON = o.OAZON AND f.KATEGORIA = 2
);

select * from oszt2;
rollback;
select * from oszt2;

--6. T�r�lj�k ki azon oszt�lyokat, amelyeknek 2 olyan dolgoz�ja van, akinek a fizet�se a 2-es fizet�si kateg�ri�ba esik a Fiz_Kategoria t�bla alapj�n.
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

--7. Vigy�nk fel egy 'Kovacs' nev� �j dolgoz�t a 10-es oszt�lyra a k�vetkez� �rt�kekkel: dkod=1, dnev='Kovacs', oazon=10, bel�p�s=aktu�lis d�tum, fizet�s=a 10-es oszt�ly �tlagfizet�se. A t�bbi oszop legyen NULL.
insert into dolg2(dkod, dnev, oazon, belepes)
values (1, 'Kovacs', 10, sysdate);
select * from dolg2;

-- HA �gy adjuk meg a valuesba hogy &dkod �s/vagy &dnev akkor inputr�l k�ri a dolgokat
insert into dolg2(dkod, dnev, oazon, belepes)
values (&dkod, '&dnev', 10, sysdate);
select * from dolg2;

-- lehet t�bb sort is illeszteni
insert into dolg2(dkod, dnev, oazon, belepes)
select dkod+1, dnev||'ex',10, belepes
from dolg2;
select * from dolg2;
rollback;

/* 8. T�bb sor felvitele: Hozzunk l�tre egy UjOsztaly nev� t�bl�t, amelynek
      attrib�tumai megegyeznek az Oszt�ly t�bla oszlopaival, plusz van m�g egy
      numerikus t�pus� Letszam nev� attrib�tuma. Ebbe az UjOsztaly t�bl�ba az
      insert utas�t�s 2. alakj�val (alk�rd�ssel ) vigy�nk fel �j sorokat az oszt�ly �s
      dolgoz� t�bl�k aktu�lis tartalm�nak felhaszn�l�s�val minden oszt�ly adat�t
      kieg�sz�tve az adott oszt�lyon dolgoz�k l�tsz�m�val. Azok az oszt�lyok is
      jelenjenek meg ahol nem dolgozik senki, ott a l�tsz�m 0 legyen. Tov�bb�
      ha vannak olyan dolgoz�k, akiknek nincs (nem ismert) az oszt�lyuk, azok
      l�tsz�m�t egy oazon=0, onev= 'FIKTIV' �s telephely='ISMERETLEN'
      adatokkal rendelkez� sorba �rjuk be.
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

-- 9. N�velj�k meg a 20-as oszt�lyon a dolgoz�k fizet�s�t 20%-kal.
update dolg2 d
set fizetes = fizetes + (select max(jutalek) from dolg2 where oazon=d.oazon)
where oazon=20;
select * from dolg2;
rollback;
select * from dolg2;

-- alter table: kulcs hozz�ad�s�hoz
alter table oszt2
add constraint oszt1_empno_pk
primary key (oazon);

alter table dolg2
add constraint uj_empno_pk
foreign key (oazon) references oszt2 (oazon);

--kv�z2 gyak8b�l 2)
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

--10. N�velj�k meg azok fizet�s�t 500-zal, akik jutal�ka NULL vagy a fizet�s�k kisebb az �tlagn�l.
UPDATE dolg2
SET fizetes = fizetes + 500
WHERE jutalek IS NULL OR fizetes < (SELECT AVG(fizetes) FROM dolgozo);
select * from dolg2;
rollback;
select * from dolg2;

--11. N�velj�k meg mindenkinek a jutal�k�t a jelenlegi maxim�lis jutal�kkal.
UPDATE dolg2
SET jutalek = (SELECT MAX(jutalek) FROM dolgozo);
select * from dolg2;
rollback;
select * from dolg2;

--12. M�dos�tsuk 'Loser'-re a legrosszabbul keres� dolgoz� nev�t.
UPDATE dolg2
SET dnev = 'Loser'
WHERE fizetes = (SELECT MIN(fizetes) FROM dolgozo);
select * from dolg2;
rollback;
select * from dolg2;

--13. N�velj�k meg azoknak a dolgoz�knak a jutal�k�t 3000-rel, akiknek legal�bb 2 k�zvetlen beosztottjuk van. Az ismeretlen (NULL) jutal�kot vegy�k �gy, mintha 0 lenne.
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

--14. N�velj�k meg azoknak a dolgoz�knak a fizet�s�t a jelenlegi minim�lis fizet�s 5%-k�val, akiknek van olyan beosztottja, aki minim�lis fizet�ssel rendelkezik.
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

--15. N�velj�k meg a nem f�n�k�k fizet�s�t a saj�t oszt�lyuk �tlagfizet�s�vel.
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