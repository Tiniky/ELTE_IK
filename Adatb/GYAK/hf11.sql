 /* FOR UPDATE kurzor m�dos�t�shoz
M�dos�tsuk a dolgoz�k nev�t �rjuk �t, hogy csak a kezd�bet� legyen nagy,
a t�bbi bet� kicsi, tov�bb� a dolgoz�k fizet�s�t is n�velj�k meg 2 %-kal!
*/
set serveroutput on;

select * from dolg_temp;

DECLARE
  CURSOR dolgozo_cursor IS
    SELECT * FROM dolg_temp FOR UPDATE;
BEGIN
  FOR dolgozo_rec IN dolgozo_cursor LOOP
    dolgozo_rec.DNEV := INITCAP(dolgozo_rec.DNEV);
    dolgozo_rec.FIZETES := dolgozo_rec.FIZETES * 1.02;
    UPDATE dolg_temp SET DNEV = dolgozo_rec.DNEV, FIZETES = dolgozo_rec.FIZETES WHERE DKOD = dolgozo_rec.DKOD;
  END LOOP;
  
  COMMIT;
END;
/

select * from dolg_temp;

ROLLBACK;


/* M�dos�t�s kurzorral
�rjunk meg egy proced�r�t, amelyik m�dos�tja a param�ter�ben megadott oszt�lyon
a fizet�seket, �s ki�rja a dolgoz� nev�t �s �j fizet�s�t. 
A m�dos�t�s mindenki fizet�s�hez adjon hozz� n*10 ezret,
ahol n a dolgoz� nev�ben lev� mag�nhangz�k sz�ma (A, E, I, O, U).
A proced�ra a ki�r�s ut�n adjon ki egy ROLLBACK utas�t�st, hogy megmaradjanak
az eredeti fizet�sek, �gy a proced�r�t t�bbsz�r is futtatni tudj�k.
*/
/*
set serveroutput on;

select * from dolg_temp;

CREATE OR REPLACE PROCEDURE fiz_mod2(p_oazon INTEGER) IS
  CURSOR dolgozo_cursor IS
    SELECT * FROM dolg_temp WHERE OAZON = p_oazon FOR UPDATE;
BEGIN
  FOR dolgozo_rec IN dolgozo_cursor LOOP
    DECLARE
      v_maghangzok NUMBER := 0;
    BEGIN
      FOR i IN 1..LENGTH(dolgozo_rec.DNEV) LOOP
        IF SUBSTR(dolgozo_rec.DNEV, i, 1) IN ('a', 'e', 'i', 'o', 'u') THEN
          v_maghangzok := v_maghangzok + 1;
        END IF;
      END LOOP;
      
      dolgozo_rec.FIZETES := dolgozo_rec.FIZETES + (v_maghangzok * 10000);
      UPDATE dolg_temp SET FIZETES = dolgozo_rec.FIZETES WHERE DKOD = dolgozo_rec.DKOD;
      
      DBMS_OUTPUT.PUT_LINE('Dolgozo neve: ' || dolgozo_rec.DNEV || ', uj fizetese: ' || dolgozo_rec.FIZETES);
    END;
  END LOOP;
  ROLLBACK;
END;
/

execute fiz_mod2(10);
*/

/* Exception
�rjunk meg egy f�ggv�nyt, amelyik egy karakteres t�pus� param�terben egy
d�tumot kap a k�vetkez� form�tumban: '����.hh.nn' vagy 'nn.hh.����'.
A f�ggv�ny adja vissza a nap nev�t, pl. 'kedd'.
Ha a megadott karakterl�nc nem egy �rv�nyes d�tum, akkor adja vissza,
hogy 'rossz d�tum'.
*/

/*set serveroutput on;

CREATE OR REPLACE FUNCTION get_day_name(p_date_str VARCHAR2) RETURN VARCHAR2 IS
  v_date DATE;
  v_day_name VARCHAR2(20);
BEGIN
  BEGIN
    IF INSTR(p_date_str, '.') = 0 THEN
      v_date := TO_DATE(p_date_str, 'YYYY.MM.DD');
    ELSE
      v_date := TO_DATE(p_date_str, 'DD.MM.YYYY');
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 'rossz d�tum';
  END;

  v_day_name := TO_CHAR(v_date, 'DAY');

  RETURN v_day_name;
END;
/

EXECUTE DBMS_OUTPUT.PUT_LINE(get_day_name('27.10.2002'));
EXECUTE DBMS_OUTPUT.PUT_LINE(get_day_name('2002.27.10'));
*/
