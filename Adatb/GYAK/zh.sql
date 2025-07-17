

















































/*drop table Alapanyag;
drop table Termekek;
drop table Darablista;

create table Alapanyag (
nev varchar2(20),
ar number,
szarmazasi_hely varchar2(20)
);

create table Termekek (
nev varchar2(20),
ar number
);

create table Darablista (
TermekNev varchar2(20),
AlapanyagNev varchar2(20),
mennyiseg number
);

insert into alapanyag values('olaj', 1000, 'Irak');
insert into alapanyag values('olaj', 1000, 'Oroszorszag');
insert into alapanyag values('szen', 400, 'Kina');
insert into alapanyag values('litium', 1100, 'Ausztralia');
insert into alapanyag values('litium', 1000, 'Chile');
insert into alapanyag values('litium', 900, 'Kina');
insert into alapanyag values('acel', 750, 'Kina');
insert into alapanyag values('acel', 950, 'USA');
insert into alapanyag values('acel', 1250, 'Japan');
insert into alapanyag values('acel', 1050, 'Oroszorszag');
insert into alapanyag values('szilicium', 700, 'Oroszorszag');
insert into alapanyag values('szilicium', 1100, 'USA');
insert into alapanyag values('uran', 9999, 'OroszorszÃ¥g');
insert into alapanyag values('uran', 9999, 'Ausztralia');

insert into termekek values('teleszkop', 5000);
insert into termekek values('acelkotel', 1000);
insert into termekek values('adotorony', 7000);
insert into termekek values('mozdony', 9000);
insert into termekek values('motor', 6000);
insert into termekek values('hajo', 9000);
insert into termekek values('akkumulator', 500);

insert into darablista values('teleszkop', 'olaj', 1);
insert into darablista values('teleszkop', 'acel', 2);
insert into darablista values('motor', 'olaj', 1);
insert into darablista values('motor', 'acel', 7);
insert into darablista values('acelkotel', 'acel', 10);
insert into darablista values('adotorony', 'acel', 50);
insert into darablista values('adotorony', 'szilicium', 10);
insert into darablista values('adotorony', 'litium', 15);
insert into darablista values('akkumulator', 'litium', 1);
insert into darablista values('mozdony', 'acel', 100);
insert into darablista values('mozdony', 'olaj', 5);
insert into darablista values('mozdony', 'szen', 35);
insert into darablista values('hajo', 'acel', 1000);
insert into darablista values('hajo', 'szilicium', 10);
insert into darablista values('hajo', 'litium', 50);

commit;

select * from Alapanyag;
select * from Termekek;
select * from Darablista;

--termeknév, amelyek nevében valamely alapanyag neve is szerepel
SELECT DISTINCT termeknev
FROM Darablista
WHERE INSTR(TermekNev, AlapanyagNev)>0;

--országok, ahonnan olaj és acél is származik
SELECT A1.szarmazasi_hely
FROM Alapanyag A1, Alapanyag A2
WHERE A1.nev = 'acel' and A2.nev = 'olaj' and A1.szarmazasi_hely = A2.szarmazasi_hely;

/*segédtáblák és nézetek létrehozása nélkül egyetlen egy módosító utasítással növeljük meg az ALAPANYAG táblában azon alapanyagok árát, amelyik alapanyag legalább 3 különbözõ termék elõállításához is szükséges (DARABLISTA).
A növelmény mértéke legyen 100.
A módosítás után kérdezzük le a táblában szereplõ összes "acel" nevû alapanyag átlagárát. Majd állítsuk vissza ROLLBACK-el a tábla eredeti tartalmát!
SELECT AVG(ar) AS atlagar
FROM Alapanyag
WHERE nev = 'acel';

UPDATE Alapanyag
SET ar = ar + 100
WHERE nev IN(
    SELECT AlapanyagNev
    FROM Darablista
    GROUP BY AlapanyagNev
    HAVING COUNT(DISTINCT TermekNev) >= 3
);

SELECT AVG(ar) AS atlagar
FROM Alapanyag
WHERE nev = 'acel';

rollback;

/*segédtáblák és nézetek létrehozása nélkül egyetlen egy törlés utasítással töröljük a TERMEKEK táblából azokat a termékeket, amelyekre igaz, hogy az elõállításához (DARABLISTA)
szükséges alapanyagok mennyisége meghaladja a 100-at.
A törlés után kérdezzük le a táblában szereplõ legdrágább termék nevét és árát. Majd állítsuk vissza ROLLBACK-el a tábla eredeti tartalmát!
SELECT nev, ar
FROM Termekek
WHERE ar = (
  SELECT MAX(ar)
  FROM Termekek
);

DELETE FROM Termekek
WHERE nev IN (
  SELECT TermekNev
  FROM Darablista
  GROUP BY TermekNev
  HAVING SUM(mennyiseg) > 100
);

SELECT nev, ar
FROM Termekek
WHERE ar = (
  SELECT MAX(ar)
  FROM Termekek
);

rollback;

*/

--tablak
/*DROP TABLE terjeszt;
DROP TABLE peldanyok;
DROP TABLE konyvesbolt;
DROP TABLE konyv;

CREATE TABLE konyv (
iro VARCHAR(30),
cim VARCHAR(40),
kiado VARCHAR(30),
megjelenes NUMBER(4),
ar NUMBER(6)
PRIMARY KEY(iro, cim),
CONSTRAINT check_ar CHECK (ar <= 60000)
);

CREATE TABLE konyvesbolt (
nev VARCHAR(30),
varos VARCHAR(20),
cim VARCHAR(30),
webshop CHAR(1));

CREATE TABLE peldanyok (
iro VARCHAR(30),
cim VARCHAR(30),
bolt VARCHAR(30),
darab NUMBER(6)
CONSTRAINT fk_konyv FOREIGN KEY (iro, cim) REFERENCES konyv (iro, cim),
CONSTRAINT fk_bolt FOREIGN KEY (bolt) REFEREBCES konyvesvbolt (nev)
);

CREATE TABLE terjeszt(
bolt VARCHAR(30),
akcio_kezdete DATE,
akcio_vege DATE,
akcio_merteke NUMBER(2)
CONSTRAINT check_dates CHECK (akcio_kezdete < akcio_vege),
CONSTRAINT fk_bolt FOREIGN KEY (bolt) REFERENCES konyvesbolt (nev)
);*/

/*DROP TABLE terjeszt;
DROP TABLE peldanyok;
DROP TABLE konyvesbolt;
DROP TABLE konyv;

CREATE TABLE konyv (
iro VARCHAR(30),
cim VARCHAR(40),
kiado VARCHAR(30),
megjelenes NUMBER(4),
ar NUMBER(6));

CREATE TABLE konyvesbolt (
nev VARCHAR(30),
varos VARCHAR(20),
cim VARCHAR(30),
webshop CHAR(1));

CREATE TABLE peldanyok (
iro VARCHAR(30),
cim VARCHAR(30),
bolt VARCHAR(30),
darab NUMBER(6));

CREATE TABLE terjeszt(
bolt VARCHAR(30),
akcio_kezdete DATE,
akcio_vege DATE,
akcio_merteke NUMBER(2));

INSERT INTO konyv VALUES ('Szabó Borbála','Szülõi értekezlet','Kortárs Kiadó', 2018, 2750);
INSERT INTO konyv VALUES ('Szerb Antal','Budapesti kalauz','Magvetõ', 2019, 2690);
INSERT INTO konyv VALUES ('Björnson Björnstjerne','Álmodó falvak','Metropolis Media', 2011, 2990);
INSERT INTO konyv VALUES ('Mészöly Ágnes','Szabadlábon','Tilos az Á ', 2016, 2990);
INSERT INTO konyv VALUES ('Mészöly Ágnes','Darwin-játszma','Móra', 2014, 2490);
INSERT INTO konyv VALUES ('Janikovszky Éva','Égigérõ fû','Móra', 2004, 1490);
INSERT INTO konyv VALUES ('Hackett Brandon','Eldobott testek','Agave', 2020, 3990);
INSERT INTO konyv VALUES ('Rowling J. K.','Harry Potter és a bölcsek köve','Animus', 2020, 3690);
INSERT INTO konyv VALUES ('Oravecz Gergely','Blossza','Szépirodalmi Figyelõ', 2019, 2290);

INSERT INTO konyvesbolt VALUES ('Líra', 'Budapest', 'Hegyvidék', 'I');
INSERT INTO konyvesbolt VALUES ('LibriA', 'Eger', 'Agria', 'N');
INSERT INTO konyvesbolt VALUES ('LibriM', 'Budapest', 'MOM', 'I');
INSERT INTO konyvesbolt VALUES ('Alexandra', 'Budapest', 'Allee', 'I');
INSERT INTO konyvesbolt VALUES ('Írók boltja', 'Budapest', 'Andrássy út', 'N');

INSERT INTO peldanyok VALUES ('Szerb Antal','Budapesti kalauz','LibriA',5);
INSERT INTO peldanyok VALUES ('Szerb Antal','Budapesti kalauz','Líra',3);
INSERT INTO peldanyok VALUES ('Szerb Antal','Budapesti kalauz','Alexandra',1);
INSERT INTO peldanyok VALUES ('Mészöly Ágnes','Szabadlábon','LibriM',10);
INSERT INTO peldanyok VALUES ('Mészöly Ágnes','Darwin-játszma','LibriM',5);
INSERT INTO peldanyok VALUES ('Mészöly Ágnes','Darwin-játszma','Líra',35);
INSERT INTO peldanyok VALUES ('Oravecz Gergely','Blossza','Írók boltja',3);
INSERT INTO peldanyok VALUES ('Hackett Brandon','Eldobott testek','LibriA',1);
INSERT INTO peldanyok VALUES ('Hackett Brandon','Eldobott testek','Líra',2);
INSERT INTO peldanyok VALUES ('Hackett Brandon','Eldobott testek','Alexandra',7);

INSERT INTO terjeszt VALUES ('LibriA', TO_DATE('2021-12-01', 'YYYY-MM-DD'), TO_DATE('2022-05-31', 'YYYY-MM-DD'), 20);
INSERT INTO terjeszt VALUES ('LibriA', TO_DATE('2020-12-01', 'YYYY-MM-DD'), TO_DATE('2020-12-24', 'YYYY-MM-DD'), 10);
INSERT INTO terjeszt VALUES ('LibriM', TO_DATE('2021-11-01', 'YYYY-MM-DD'), TO_DATE('2022-11-30', 'YYYY-MM-DD'), 10);
INSERT INTO terjeszt VALUES ('LibriM', TO_DATE('2022-05-01', 'YYYY-MM-DD'), TO_DATE('2022-12-24', 'YYYY-MM-DD'), 20);
INSERT INTO terjeszt VALUES ('Líra', TO_DATE('2021-11-24', 'YYYY-MM-DD'), TO_DATE('2021-12-31', 'YYYY-MM-DD'), 10);
INSERT INTO terjeszt VALUES ('Alexandra', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2021-12-10', 'YYYY-MM-DD'), 33);

COMMIT;
*/

/*--SILA.CSALADFA tábla alapján CONNECT BY hierarchikus lekérdezéssel készítsünk egy VAGYONOK nevû nézettáblát, amely ABEL összes leszármazottját tartalmazza, majd ennek a VAGYONOK nézettáblának a felhasználásával adjuk meg mennyi az össz-vagyona ABEL-nek és azoknak a leszárazottjainak, akik ugyanabban a városban éltek, mint ABEL.
SELECT * FROM SILA.CSALADFA;
CREATE VIEW Vagyonok AS
SELECT NEV, APJA, VAGYON, VAROS
FROM SILA.CSALADFA
START WITH NEV = 'ABEL'
CONNECT BY PRIOR NEV = APJA;

SELECT * FROM Vagyonok;

SELECT SUM(VAGYON) AS OSSZ_VAGYON
FROM Vagyonok
WHERE VAROS = (SELECT VAROS FROM Vagyonok WHERE NEV = 'ABEL');
*/

SET serveroutput ON

--Írjon PL/SQL tárolt függvényt, amely egy paraméterben megadott névre megkeresi, hogy a könyvek (konyvek) táblában szerepel-e ilyen nevû író, és azt a (legkisebb) évszámot adja vissza eredményül, amikor az adott írónak a legelsõ könyve megjelent!  Tesztelje le az eredményt! 
/*DECLARE
  v_nev VARCHAR2(30) := '&nev';
  v_ev NUMBER;
BEGIN
  SELECT MIN(megjelenes) INTO v_ev
  FROM konyv
  WHERE iro = v_nev;
  
  IF v_ev IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Az elsõ könyv megjelenésének éve: ' || v_ev);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Nincs ilyen író a táblában.');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nincs ilyen író a táblában.');
END;
*/

--Explicit kurzort használva írjon PL/SQL tárolt procedure-t, amely egy paraméterként átveszi egy könyvesbolt nevének elsõ három betûjét, és megkeresi a terjeszt táblában, hogy a mai napon milyen akciók vannak az adott boltban, és ha az akció mértéke nem magasabb, mint 15%, akkor megduplázza az akció mértékét! Be kell küldeni a PL/SQL programot, és le is kell tesztelni az eljárást, mellékeld eredményként (output) kérdezd le a terjeszt tábla tartalmát elõtte és utána. 
/*SELECT * FROM terjeszt;

DECLARE
  v_bolt_nev VARCHAR(3);
  CURSOR c_akciok IS
    SELECT *
    FROM terjeszt
    WHERE INSTR(bolt, v_bolt_nev) > 0
    FOR UPDATE;

BEGIN
  v_bolt_nev := '&bolt_nev';

  FOR r_akcio IN c_akciok LOOP
    IF r_akcio.akcio_merteke <= 0.15 THEN
      UPDATE terjeszt
      SET akcio_merteke = r_akcio.akcio_merteke * 2
      WHERE CURRENT OF c_akciok;
    END IF;
  END LOOP;

  COMMIT;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nincs ilyen nevû könyvesbolt az adatbázisban.');
END;

/

SELECT * FROM terjeszt;

rollback;
*/
/*
-- zh2

SELECT * FROM VDANI.TELI_EREDMENYEK;
set serveroutput on;

-- DML, DDL 1.

-- 1. Töröld azokat a sorokat (eredményeket) a tábládból, ahol a versenyzõ egyesülete az „MTK” és az eredmény 2015 után született.

delete from sajat_teli_eredmenyek
where egyesulet = 'MTK' and olimpia > 2015;

-- 2. Töröld azokat a sorokat (eredményeket) a tábládból, amelyek olyan olimpián születtek, amelyeket Kanadában rendeztek meg (lásd VDANI.OLIMPIAK tábla).

delete from sajat_teli_eredmenyek
where sajat_teli_eredmenyek.olimpia in (select ev from vdani.olimpiak where orszag = 'Kanada');

-- 3. Töröld azokat a sorokat (eredményeket) a tábládból, amelyeket olyan versenyzõk értek el, akik csak egy olimpián vettek
--részt (pl. ha valaki csak 2018-ban vett részt és 2014-ben nem, akkor a hozzá tartozó eredményeket törölni kell).

delete from sajat_teli_eredmenyek
where nev in (
  select nev
  from sajat_teli_eredmenyek
  group by nev
  having count(distinct olimpia) = 1
);

-- 4. Módosítsuk a helyezést „Nem dobogós” karaktersorozatra azokban a sorokban, amelyeknél a helyezés nincs benne az elsõ 9-ben.

update sajat_teli_eredmenyek
set helyezes = 'Nem dobogós'
WHERE helyezes NOT IN ('1', '2', '3', '4', '5', '6', '7', '8', '9');


-- pl sql 1.

create or replace procedure primek(p_num in integer) as
v_is_prime BOOLEAN;
BEGIN
  FOR i IN 2..p_num LOOP
    v_is_prime := TRUE;
    
    FOR j IN 2..TRUNC(SQRT(i)) LOOP
      IF MOD(i, j) = 0 THEN
        v_is_prime := FALSE;
      END IF;
    END LOOP;
    
    IF v_is_prime THEN
      DBMS_OUTPUT.PUT(i || ', ');
    END IF;
  END LOOP;
  
  DBMS_OUTPUT.NEW_LINE;
END;
/

execute primek(10);

-- pl sql 2.

create or replace procedure szamok(p_ev in integer) as
BEGIN
  FOR rec IN (SELECT DISTINCT nev, versenyszam FROM VDANI.TELI_EREDMENYEK WHERE olimpia = p_ev) LOOP
    DBMS_OUTPUT.PUT_LINE(rec.nev);

    FOR rec2 IN (SELECT DISTINCT versenyszam FROM VDANI.TELI_EREDMENYEK WHERE nev = rec.nev) LOOP
      DBMS_OUTPUT.PUT_LINE(rec2.versenyszam);
    END LOOP;
    
    DBMS_OUTPUT.NEW_LINE;
  END LOOP;
END;
/

execute szamok(2010);
*/