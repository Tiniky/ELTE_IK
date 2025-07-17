--2. Adjuk meg azon dolgozókat, akik fizetése osztható 15-tel.
select dkod, initcap(dnev) dolgnev, fizetes
from dolgozo
where remainder(fizetes, 15) = 0;

--3. Adjuk meg a dolgozók fizetéseinek négyzetgyökét két tizedesre, és ennek egészrészét.
select dkod, initcap(dnev) dolgnev, fizetes, round(sqrt(fizetes), 2) "gyökölt", floor(sqrt(fizetes)) "egész"
from dolgozo;

--4. Adjuk meg azon dolgozókat, akik nevének második betûje 'A'
select dkod, initcap(dnev) dolgnev, INSTR(upper(dnev), 'A', 1, 1) "a helye"
from dolgozo
where INSTR(upper(dnev), 'A', 1, 1) = 2;