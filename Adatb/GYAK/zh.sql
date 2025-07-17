

















































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
insert into alapanyag values('uran', 9999, 'Oroszorszåg');
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

--termekn�v, amelyek nev�ben valamely alapanyag neve is szerepel
SELECT DISTINCT termeknev
FROM Darablista
WHERE INSTR(TermekNev, AlapanyagNev)>0;

--orsz�gok, ahonnan olaj �s ac�l is sz�rmazik
SELECT A1.szarmazasi_hely
FROM Alapanyag A1, Alapanyag A2
WHERE A1.nev = 'acel' and A2.nev = 'olaj' and A1.szarmazasi_hely = A2.szarmazasi_hely;

/*seg�dt�bl�k �s n�zetek l�trehoz�sa n�lk�l egyetlen egy m�dos�t� utas�t�ssal n�velj�k meg az ALAPANYAG t�bl�ban azon alapanyagok �r�t, amelyik alapanyag legal�bb 3 k�l�nb�z� term�k el��ll�t�s�hoz is sz�ks�ges (DARABLISTA).
A n�velm�ny m�rt�ke legyen 100.
A m�dos�t�s ut�n k�rdezz�k le a t�bl�ban szerepl� �sszes "acel" nev� alapanyag �tlag�r�t. Majd �ll�tsuk vissza ROLLBACK-el a t�bla eredeti tartalm�t!
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

/*seg�dt�bl�k �s n�zetek l�trehoz�sa n�lk�l egyetlen egy t�rl�s utas�t�ssal t�r�lj�k a TERMEKEK t�bl�b�l azokat a term�keket, amelyekre igaz, hogy az el��ll�t�s�hoz (DARABLISTA)
sz�ks�ges alapanyagok mennyis�ge meghaladja a 100-at.
A t�rl�s ut�n k�rdezz�k le a t�bl�ban szerepl� legdr�g�bb term�k nev�t �s �r�t. Majd �ll�tsuk vissza ROLLBACK-el a t�bla eredeti tartalm�t!
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

INSERT INTO konyv VALUES ('Szab� Borb�la','Sz�l�i �rtekezlet','Kort�rs Kiad�', 2018, 2750);
INSERT INTO konyv VALUES ('Szerb Antal','Budapesti kalauz','Magvet�', 2019, 2690);
INSERT INTO konyv VALUES ('Bj�rnson Bj�rnstjerne','�lmod� falvak','Metropolis Media', 2011, 2990);
INSERT INTO konyv VALUES ('M�sz�ly �gnes','Szabadl�bon','Tilos az � ', 2016, 2990);
INSERT INTO konyv VALUES ('M�sz�ly �gnes','Darwin-j�tszma','M�ra', 2014, 2490);
INSERT INTO konyv VALUES ('Janikovszky �va','�gig�r� f�','M�ra', 2004, 1490);
INSERT INTO konyv VALUES ('Hackett Brandon','Eldobott testek','Agave', 2020, 3990);
INSERT INTO konyv VALUES ('Rowling J. K.','Harry Potter �s a b�lcsek k�ve','Animus', 2020, 3690);
INSERT INTO konyv VALUES ('Oravecz Gergely','Blossza','Sz�pirodalmi Figyel�', 2019, 2290);

INSERT INTO konyvesbolt VALUES ('L�ra', 'Budapest', 'Hegyvid�k', 'I');
INSERT INTO konyvesbolt VALUES ('LibriA', 'Eger', 'Agria', 'N');
INSERT INTO konyvesbolt VALUES ('LibriM', 'Budapest', 'MOM', 'I');
INSERT INTO konyvesbolt VALUES ('Alexandra', 'Budapest', 'Allee', 'I');
INSERT INTO konyvesbolt VALUES ('�r�k boltja', 'Budapest', 'Andr�ssy �t', 'N');

INSERT INTO peldanyok VALUES ('Szerb Antal','Budapesti kalauz','LibriA',5);
INSERT INTO peldanyok VALUES ('Szerb Antal','Budapesti kalauz','L�ra',3);
INSERT INTO peldanyok VALUES ('Szerb Antal','Budapesti kalauz','Alexandra',1);
INSERT INTO peldanyok VALUES ('M�sz�ly �gnes','Szabadl�bon','LibriM',10);
INSERT INTO peldanyok VALUES ('M�sz�ly �gnes','Darwin-j�tszma','LibriM',5);
INSERT INTO peldanyok VALUES ('M�sz�ly �gnes','Darwin-j�tszma','L�ra',35);
INSERT INTO peldanyok VALUES ('Oravecz Gergely','Blossza','�r�k boltja',3);
INSERT INTO peldanyok VALUES ('Hackett Brandon','Eldobott testek','LibriA',1);
INSERT INTO peldanyok VALUES ('Hackett Brandon','Eldobott testek','L�ra',2);
INSERT INTO peldanyok VALUES ('Hackett Brandon','Eldobott testek','Alexandra',7);

INSERT INTO terjeszt VALUES ('LibriA', TO_DATE('2021-12-01', 'YYYY-MM-DD'), TO_DATE('2022-05-31', 'YYYY-MM-DD'), 20);
INSERT INTO terjeszt VALUES ('LibriA', TO_DATE('2020-12-01', 'YYYY-MM-DD'), TO_DATE('2020-12-24', 'YYYY-MM-DD'), 10);
INSERT INTO terjeszt VALUES ('LibriM', TO_DATE('2021-11-01', 'YYYY-MM-DD'), TO_DATE('2022-11-30', 'YYYY-MM-DD'), 10);
INSERT INTO terjeszt VALUES ('LibriM', TO_DATE('2022-05-01', 'YYYY-MM-DD'), TO_DATE('2022-12-24', 'YYYY-MM-DD'), 20);
INSERT INTO terjeszt VALUES ('L�ra', TO_DATE('2021-11-24', 'YYYY-MM-DD'), TO_DATE('2021-12-31', 'YYYY-MM-DD'), 10);
INSERT INTO terjeszt VALUES ('Alexandra', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2021-12-10', 'YYYY-MM-DD'), 33);

COMMIT;
*/

/*--SILA.CSALADFA t�bla alapj�n CONNECT BY hierarchikus lek�rdez�ssel k�sz�ts�nk egy VAGYONOK nev� n�zett�bl�t, amely ABEL �sszes lesz�rmazottj�t tartalmazza, majd ennek a VAGYONOK n�zett�bl�nak a felhaszn�l�s�val adjuk meg mennyi az �ssz-vagyona ABEL-nek �s azoknak a lesz�razottjainak, akik ugyanabban a v�rosban �ltek, mint ABEL.
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

--�rjon PL/SQL t�rolt f�ggv�nyt, amely egy param�terben megadott n�vre megkeresi, hogy a k�nyvek (konyvek) t�bl�ban szerepel-e ilyen nev� �r�, �s azt a (legkisebb) �vsz�mot adja vissza eredm�ny�l, amikor az adott �r�nak a legels� k�nyve megjelent!  Tesztelje le az eredm�nyt! 
/*DECLARE
  v_nev VARCHAR2(30) := '&nev';
  v_ev NUMBER;
BEGIN
  SELECT MIN(megjelenes) INTO v_ev
  FROM konyv
  WHERE iro = v_nev;
  
  IF v_ev IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Az els� k�nyv megjelen�s�nek �ve: ' || v_ev);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Nincs ilyen �r� a t�bl�ban.');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nincs ilyen �r� a t�bl�ban.');
END;
*/

--Explicit kurzort haszn�lva �rjon PL/SQL t�rolt procedure-t, amely egy param�terk�nt �tveszi egy k�nyvesbolt nev�nek els� h�rom bet�j�t, �s megkeresi a terjeszt t�bl�ban, hogy a mai napon milyen akci�k vannak az adott boltban, �s ha az akci� m�rt�ke nem magasabb, mint 15%, akkor megdupl�zza az akci� m�rt�k�t! Be kell k�ldeni a PL/SQL programot, �s le is kell tesztelni az elj�r�st, mell�keld eredm�nyk�nt (output) k�rdezd le a terjeszt t�bla tartalm�t el�tte �s ut�na. 
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
    DBMS_OUTPUT.PUT_LINE('Nincs ilyen nev� k�nyvesbolt az adatb�zisban.');
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

-- 1. T�r�ld azokat a sorokat (eredm�nyeket) a t�bl�db�l, ahol a versenyz� egyes�lete az �MTK� �s az eredm�ny 2015 ut�n sz�letett.

delete from sajat_teli_eredmenyek
where egyesulet = 'MTK' and olimpia > 2015;

-- 2. T�r�ld azokat a sorokat (eredm�nyeket) a t�bl�db�l, amelyek olyan olimpi�n sz�lettek, amelyeket Kanad�ban rendeztek meg (l�sd VDANI.OLIMPIAK t�bla).

delete from sajat_teli_eredmenyek
where sajat_teli_eredmenyek.olimpia in (select ev from vdani.olimpiak where orszag = 'Kanada');

-- 3. T�r�ld azokat a sorokat (eredm�nyeket) a t�bl�db�l, amelyeket olyan versenyz�k �rtek el, akik csak egy olimpi�n vettek
--r�szt (pl. ha valaki csak 2018-ban vett r�szt �s 2014-ben nem, akkor a hozz� tartoz� eredm�nyeket t�r�lni kell).

delete from sajat_teli_eredmenyek
where nev in (
  select nev
  from sajat_teli_eredmenyek
  group by nev
  having count(distinct olimpia) = 1
);

-- 4. M�dos�tsuk a helyez�st �Nem dobog�s� karaktersorozatra azokban a sorokban, amelyekn�l a helyez�s nincs benne az els� 9-ben.

update sajat_teli_eredmenyek
set helyezes = 'Nem dobog�s'
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