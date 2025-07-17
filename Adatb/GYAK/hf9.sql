--�rjon PL/SQL programot, amely bek�r k�t eg�sz sz�mot, �s ki�rja a legnagyobb k�z�s oszt�jukat. Haszn�ljon WHILE-ciklust.
/*SET serveroutput ON
DECLARE
  num1 INTEGER;
  num2 INTEGER;
  lnko INTEGER;
  maradek INTEGER;
BEGIN
  num1 := &n1;
  num2 := &n2;

  WHILE num2 != 0 LOOP
    maradek := num1 mod num2;
    num1 := num2;
    num2 := maradek;
  END LOOP;

  lnko := num1;
  DBMS_OUTPUT.PUT_LINE('A k�t sz�m legnagyobb k�z�s oszt�ja: ' || lnko);
END;*/

--�ll�tsa el� a felhaszn�l� �ltal megadott darabsz�mig a Fibonacci sorozat elemeit (0, 1, 1, 2, 3, 5,...). A megold�shoz LOOP-ciklust haszn�ljon.
/*SET serveroutput ON
DECLARE
  n INTEGER;
  fib1 INTEGER := 0;
  fib2 INTEGER := 1;
  fib_aktualis INTEGER;
BEGIN
  n := &1;

  DBMS_OUTPUT.PUT_LINE('Fibonacci sorozat:');
  DBMS_OUTPUT.PUT(fib1 || ' ');

  IF n > 1 THEN
    DBMS_OUTPUT.PUT(fib2 || ' ');
  END IF;

  FOR i IN 3..n LOOP
    fib_aktualis := fib1 + fib2;
    fib1 := fib2;
    fib2 := fib_aktualis;

    DBMS_OUTPUT.PUT(fib_aktualis || ' ');
  END LOOP;

  DBMS_OUTPUT.NEW_LINE;
END;
*/

--�rjon programot, mely el��ll�tja, �s ki�rja a felhaszn�l� �ltal megadott k�t eg�sz sz�m legkisebb k�z�s t�bbsz�r�s�t. P�ld�ul 8 �s 12 eset�n: 24.
SET serveroutput ON
DECLARE
  num1 INTEGER;
  num2 INTEGER;
  lkkt INTEGER;
  nagyobb INTEGER;
BEGIN
  num1 := &1;
  num2 := &2;

  IF num1 > num2 THEN
    nagyobb := num1;
  ELSE
    nagyobb := num2;
  END IF;
  
  lkkt := nagyobb;
  WHILE TRUE LOOP
    IF lkkt mod num1 = 0 AND lkkt mod num2 = 0 THEN
      EXIT;
    END IF;
    lkkt := lkkt + nagyobb;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('A k�t sz�m legkisebb k�z�s t�bbsz�r�se: ' || lkkt);
END;
