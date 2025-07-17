--Írjon PL/SQL programot, amely bekér két egész számot, és kiírja a legnagyobb közös osztójukat. Használjon WHILE-ciklust.
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
  DBMS_OUTPUT.PUT_LINE('A két szám legnagyobb közös osztója: ' || lnko);
END;*/

--Állítsa elõ a felhasználó által megadott darabszámig a Fibonacci sorozat elemeit (0, 1, 1, 2, 3, 5,...). A megoldáshoz LOOP-ciklust használjon.
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

--Írjon programot, mely elõállítja, és kiírja a felhasználó által megadott két egész szám legkisebb közös többszörösét. Például 8 és 12 esetén: 24.
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

  DBMS_OUTPUT.PUT_LINE('A két szám legkisebb közös többszöröse: ' || lkkt);
END;
