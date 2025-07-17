 /* FOR UPDATE kurzor módosításhoz
Módosítsuk a dolgozók nevét írjuk át, hogy csak a kezdõbetû legyen nagy,
a többi betû kicsi, továbbá a dolgozók fizetését is növeljük meg 2 %-kal!
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


/* Módosítás kurzorral
Írjunk meg egy procedúrát, amelyik módosítja a paraméterében megadott osztályon
a fizetéseket, és kiírja a dolgozó nevét és új fizetését. 
A módosítás mindenki fizetéséhez adjon hozzá n*10 ezret,
ahol n a dolgozó nevében levõ magánhangzók száma (A, E, I, O, U).
A procedúra a kiírás után adjon ki egy ROLLBACK utasítást, hogy megmaradjanak
az eredeti fizetések, így a procedúrát többször is futtatni tudják.
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
Írjunk meg egy függvényt, amelyik egy karakteres típusú paraméterben egy
dátumot kap a következõ formátumban: 'éééé.hh.nn' vagy 'nn.hh.éééé'.
A függvény adja vissza a nap nevét, pl. 'kedd'.
Ha a megadott karakterlánc nem egy érvényes dátum, akkor adja vissza,
hogy 'rossz dátum'.
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
      RETURN 'rossz dátum';
  END;

  v_day_name := TO_CHAR(v_date, 'DAY');

  RETURN v_day_name;
END;
/

EXECUTE DBMS_OUTPUT.PUT_LINE(get_day_name('27.10.2002'));
EXECUTE DBMS_OUTPUT.PUT_LINE(get_day_name('2002.27.10'));
*/
