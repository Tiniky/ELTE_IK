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