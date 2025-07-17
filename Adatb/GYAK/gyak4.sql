--elso kv�z
select dkod,dnev, fizetes
from dolgozo
minus
select D1.dkod, D1.dnev, D1.fizetes
from dolgozo D1, dolgozo D2
where D1.fizetes < D2.fizetes;

--1. Adjuk meg dolgoz�k nev�t �s az �ves fizet�s�t sz�zasokra kerek�tve, akik a 10-es oszt�lyon dolgoznak.
select dkod, initcap(dnev) dolgnev, round(12*fizetes,2) "�ves fizet�s"
from dolgozo
where oazon=10;

--erdekess�g: dual megjelen�t �rt�keket �s sz�mol is
select 5*3, sysdate,
INSTR('CORPORATE FLOOR', 'OR', 1, 4) "Instring"
from dual;


--5. Adjuk meg azon dolgoz�kat, akik nev�ben van legal�bb k�t 'L' bet�.
select dkod, initcap(dnev) dolgnev
from dolgozo
where upper(dnev) like '%L%L%';

select dkod, initcap(dnev) dolgnev
from dolgozo
where INSTR(upper(dnev), 'L', 1, 2) > 0;

--8. Kik azok a dolgoz�k, akik '1982.01.01.' ut�n l�ptek be?
select dkod, dnev, belepes,
TO_CHAR(belepes, 'Month', 'NLS_DATE_LANGUAGE = American') h�nap,
TO_CHAR(belepes, 'Day', 'NLS_DATE_LANGUAGE = Japanese') nap
from dolgozo
where belepes > TO_DATE('1982.01.01.', 'YYYY.MM.DD.');

select dkod, dnev, round(sysdate - belepes) "eltelt napok",
TO_CHAR(belepes, 'Month', 'NLS_DATE_LANGUAGE = American') h�nap,
TO_CHAR(belepes, 'Day', 'NLS_DATE_LANGUAGE = Japanese') nap
from dolgozo
where belepes > TO_DATE('1982.01.01.', 'YYYY.MM.DD.');

--15. Adjuk meg a dolgoz�k �ves j�vedelm�t, ahol a havi j�vedelem a fizet�s �s jutal�k �sszege, ahol nincs jutal�k megadva,ott a 0 helyettes�t� �rt�kkel sz�moljunk
select dkod, dnev, fizetes, jutalek, foglalkozas, 12*fizetes+NVL(jutalek, 0) "�ves j�vedelem"
from dolgozo;

select dkod, dnev, fizetes, jutalek, 12*fizetes+NVL(jutalek, 0) "�ves j�vedelem",
CASE  foglalkozas 
WHEN 'MANAGER' THEN fizetes*1.2
WHEN 'SALESMAN' THEN fizetes*1.1
ELSE fizetes END "korrig�lt fizet�s"
from dolgozo;

-- 1. Mennyi a legnagyobb fizet�s a dolgoz�k k�z�tt? (max) �s a legkisebb? (min)
select max(fizetes), min(fizetes)
from dolgozo;

-- feladatok
select max(fizetes), sum(fizetes),
count(*), count(foglalkozas), count(distinct foglalkozas)
from dolgozo;

select oazon, foglalkozas, max(fizetes), sum(fizetes), round(avg(fizetes),2),
count(*), count(foglalkozas), count(distinct foglalkozas)
from dolgozo
group by oazon, foglalkozas;

--ropi: 8. Adjuk meg oszt�lyonk�nt az ott dolgoz� hivatalnokok (FOGLALKOZAS='CLERK') �tlagfizet�s�t, de csak azokon az oszt�lyokon, ahol legal�bb k�t hivatalnok dolgozik!
select oazon, round(avg(fizetes),2)
from dolgozo
where foglalkozas='CLERK'
group by oazon
having count(*)=2;

--2. Adjuk meg azon dolgoz�kat, akik fizet�se oszthat� 15-tel.
select dkod, initcap(dnev) dolgnev, fizetes
from dolgozo
where remainder(fizetes, 15) = 0;

--3. Adjuk meg a dolgoz�k fizet�seinek n�gyzetgy�k�t k�t tizedesre, �s ennek eg�szr�sz�t.
select dkod, initcap(dnev) dolgnev, fizetes, round(sqrt(fizetes), 2) "gy�k�lt", floor(sqrt(fizetes)) "eg�sz"
from dolgozo;

--4. Adjuk meg azon dolgoz�kat, akik nev�nek m�sodik betuje 'A'
--select dkod, initcap(dnev) dolgnev, INSTR(upper(dnev), 'A', 1, 1) "a helye"
--from dolgozo
--where INSTR(upper(dnev), 'A', 1, 1) = 2;