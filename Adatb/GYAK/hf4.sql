--2. Adjuk meg azon dolgoz�kat, akik fizet�se oszthat� 15-tel.
select dkod, initcap(dnev) dolgnev, fizetes
from dolgozo
where remainder(fizetes, 15) = 0;

--3. Adjuk meg a dolgoz�k fizet�seinek n�gyzetgy�k�t k�t tizedesre, �s ennek eg�szr�sz�t.
select dkod, initcap(dnev) dolgnev, fizetes, round(sqrt(fizetes), 2) "gy�k�lt", floor(sqrt(fizetes)) "eg�sz"
from dolgozo;

--4. Adjuk meg azon dolgoz�kat, akik nev�nek m�sodik bet�je 'A'
select dkod, initcap(dnev) dolgnev, INSTR(upper(dnev), 'A', 1, 1) "a helye"
from dolgozo
where INSTR(upper(dnev), 'A', 1, 1) = 2;