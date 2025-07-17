--elso kvíz
select dkod,dnev, fizetes
from dolgozo
minus
select D1.dkod, D1.dnev, D1.fizetes
from dolgozo D1, dolgozo D2
where D1.fizetes < D2.fizetes;

--1. Adjuk meg dolgozók nevét és az éves fizetését százasokra kerekítve, akik a 10-es osztályon dolgoznak.
select dkod, initcap(dnev) dolgnev, round(12*fizetes,2) "éves fizetés"
from dolgozo
where oazon=10;

--erdekesség: dual megjelenít értékeket és számol is
select 5*3, sysdate,
INSTR('CORPORATE FLOOR', 'OR', 1, 4) "Instring"
from dual;


--5. Adjuk meg azon dolgozókat, akik nevében van legalább két 'L' betû.
select dkod, initcap(dnev) dolgnev
from dolgozo
where upper(dnev) like '%L%L%';

select dkod, initcap(dnev) dolgnev
from dolgozo
where INSTR(upper(dnev), 'L', 1, 2) > 0;

--8. Kik azok a dolgozók, akik '1982.01.01.' után léptek be?
select dkod, dnev, belepes,
TO_CHAR(belepes, 'Month', 'NLS_DATE_LANGUAGE = American') hónap,
TO_CHAR(belepes, 'Day', 'NLS_DATE_LANGUAGE = Japanese') nap
from dolgozo
where belepes > TO_DATE('1982.01.01.', 'YYYY.MM.DD.');

select dkod, dnev, round(sysdate - belepes) "eltelt napok",
TO_CHAR(belepes, 'Month', 'NLS_DATE_LANGUAGE = American') hónap,
TO_CHAR(belepes, 'Day', 'NLS_DATE_LANGUAGE = Japanese') nap
from dolgozo
where belepes > TO_DATE('1982.01.01.', 'YYYY.MM.DD.');

--15. Adjuk meg a dolgozók éves jövedelmét, ahol a havi jövedelem a fizetés és jutalék összege, ahol nincs jutalék megadva,ott a 0 helyettesítõ értékkel számoljunk
select dkod, dnev, fizetes, jutalek, foglalkozas, 12*fizetes+NVL(jutalek, 0) "éves jövedelem"
from dolgozo;

select dkod, dnev, fizetes, jutalek, 12*fizetes+NVL(jutalek, 0) "éves jövedelem",
CASE  foglalkozas 
WHEN 'MANAGER' THEN fizetes*1.2
WHEN 'SALESMAN' THEN fizetes*1.1
ELSE fizetes END "korrigált fizetés"
from dolgozo;

-- 1. Mennyi a legnagyobb fizetés a dolgozók között? (max) és a legkisebb? (min)
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

--ropi: 8. Adjuk meg osztályonként az ott dolgozó hivatalnokok (FOGLALKOZAS='CLERK') átlagfizetését, de csak azokon az osztályokon, ahol legalább két hivatalnok dolgozik!
select oazon, round(avg(fizetes),2)
from dolgozo
where foglalkozas='CLERK'
group by oazon
having count(*)=2;

--2. Adjuk meg azon dolgozókat, akik fizetése osztható 15-tel.
select dkod, initcap(dnev) dolgnev, fizetes
from dolgozo
where remainder(fizetes, 15) = 0;

--3. Adjuk meg a dolgozók fizetéseinek négyzetgyökét két tizedesre, és ennek egészrészét.
select dkod, initcap(dnev) dolgnev, fizetes, round(sqrt(fizetes), 2) "gyökölt", floor(sqrt(fizetes)) "egész"
from dolgozo;

--4. Adjuk meg azon dolgozókat, akik nevének második betuje 'A'
--select dkod, initcap(dnev) dolgnev, INSTR(upper(dnev), 'A', 1, 1) "a helye"
--from dolgozo
--where INSTR(upper(dnev), 'A', 1, 1) = 2;