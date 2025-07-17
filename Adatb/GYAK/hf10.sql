SELECT * FROM Dolgozo;
/*--Adjuk meg egy f�n�k azonos�t�j�t, �s t�r�lj�k a k�zvetlen beosztottjait, �s �rassuk ki h�ny beosztottja volt
DROP TABLE dolg2;
DROP TABLE oszt2;
CREATE TABLE dolg2 AS SELECT * FROM dolgozo;
CREATE TABLE oszt2 AS SELECT * FROM osztaly;

SET serveroutput ON

DECLARE
    v_fonok_id NUMBER;
    v_beosztottak_szama NUMBER;
BEGIN
    v_fonok_id := &fonok;
    SELECT COUNT(*) INTO v_beosztottak_szama
    FROM Dolg2
    WHERE FONOKE = v_fonok_id;

    DELETE FROM Dolg2
    WHERE FONOKE = v_fonok_id;

    DBMS_OUTPUT.PUT_LINE('A f�n�knek voltak beosztottjai: ' || v_beosztottak_szama);
END;

rollback;
*/

/*--�rjuk ki a dolgoz�k nev�t �s fizet�s�t!

SET serveroutput ON

DECLARE
  CURSOR c_dolgozok IS
    SELECT DNEV, FIZETES
    FROM Dolgozo;
  
  v_nev Dolgozo.DNEV%TYPE;
  v_fizetes Dolgozo.FIZETES%TYPE;
BEGIN
  OPEN c_dolgozok;
  
  LOOP
    FETCH c_dolgozok INTO v_nev, v_fizetes;
    EXIT WHEN c_dolgozok%NOTFOUND;
    
    -- Ki�rat�s
    DBMS_OUTPUT.PUT_LINE('N�v: ' || v_nev || ', Fizet�s: ' || v_fizetes);
  END LOOP;
  
  CLOSE c_dolgozok;
END;
*/

--�rjuk ki a 3. 5. �s 8. legnagyobb fizet�s� dolgoz� nev�t, fizet�s�t!

SET serveroutput ON

DECLARE
  CURSOR c_dolgozok IS
    SELECT DNEV, FIZETES
    FROM (
      SELECT DNEV, FIZETES
      FROM Dolgozo
      ORDER BY FIZETES DESC
    )
    WHERE ROWNUM <= 8;
  
  v_nev Dolgozo.DNEV%TYPE;
  v_fizetes Dolgozo.FIZETES%TYPE;
  v_counter NUMBER := 1;
BEGIN
  OPEN c_dolgozok;
  
  LOOP
    FETCH c_dolgozok INTO v_nev, v_fizetes;
    EXIT WHEN c_dolgozok%NOTFOUND;
    
    IF v_counter IN (3, 5, 8) THEN
      DBMS_OUTPUT.PUT_LINE('N�v: ' || v_nev || ', Fizet�s: ' || v_fizetes);
    END IF;
    
    v_counter := v_counter + 1;
  END LOOP;
  
  CLOSE c_dolgozok;
END;
/
