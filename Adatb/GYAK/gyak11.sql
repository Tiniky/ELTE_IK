/*--6.41 módosítható kurzor
select rowid, d. * from dolgozo d;

DROP TABLE emp;
CREATE TABLE emp AS SELECT * FROM employees;
 
DECLARE
  CURSOR c1 IS
    SELECT * FROM emp
    FOR UPDATE OF salary
    ORDER BY employee_id;
 
  emp_rec  emp%ROWTYPE;
BEGIN
  OPEN c1;
  LOOP
    FETCH c1 INTO emp_rec;  -- fails on second iteration
    EXIT WHEN c1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE (
      'emp_rec.employee_id = ' ||
      TO_CHAR(emp_rec.employee_id)
    );
    
    UPDATE emp
    SET salary = salary * 1.05
    WHERE current of c1;
 
  END LOOP;
  COMMIT;  -- releases locks
END;
*/

/*--kvíz
DROP TABLE dolg_temp;
CREATE TABLE dolg_temp AS SELECT * FROM dolgozo;

SELECT round(avg(fizetes),2) "atlag" from dolgozo;

SET serveroutput ON
DECLARE
  CURSOR c1 IS
    SELECT * FROM dolg_temp
    WHERE foglakoz = "Clerk" and fizetese 
    FOR UPDATE OF fizetes < 1500;
    ORDER BY dkod;
 
  emp_rec  emp%ROWTYPE;
BEGIN
  OPEN c1;
  LOOP
    FETCH c1 INTO emp_rec;
    EXIT WHEN c1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE (
      'emp_rec.employee_id = ' ||
      TO_CHAR(emp_rec.dkod)
    );
    
    UPDATE emp
    SET fizetes = 1500
    WHERE current of c1;
 
  END LOOP;
  COMMIT;  -- releases locks
END;
*/

--hibakezelés
/*SET serveroutput ON
DECLARE
  bonus   NUMBER(8,2);
BEGIN
  SELECT salary * 0.10 INTO bonus
  FROM employees
  WHERE employee_id >= 10;
  DBMS_OUTPUT.PUT_LINE('bonus = ' || TO_CHAR(bonus));
EXCEPTION
    WHEN NO_DATA_FOUND then
    DBMS_OUTPUT.PUT_LINE('nincs ilyen dolgozo');
    WHEN TOO_MANY_ROWS then
    DBMS_OUTPUT.PUT_LINE('túl sok ilyen dolgozo');
END;
*/

CREATE PROCEDURE account_status (
  due_date DATE,
  today    DATE
) AUTHID DEFINER
IS
  past_due  EXCEPTION;  -- declare exception
BEGIN
  IF due_date < today THEN
    RAISE past_due;  -- explicitly raise exception
  END IF;
EXCEPTION
  WHEN past_due THEN  -- handle exception
    DBMS_OUTPUT.PUT_LINE ('Account past due.');
END;
/
 
BEGIN
  account_status (TO_DATE('01-JUL-2010', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE = American'),
                  TO_DATE('09-JUL-2010', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE = American'));
END;
/
