-- ki�rja a t�bla tartalm�t
select * from dolgozo;

-- ki�rja a foglalkoz�sokat
select foglalkozas from dolgozo;

-- ki�rja a foglalkoz�sokat halmazban
select distinct foglalkozas from dolgozo;

-- kinek a fizet�se nagyobb mint 2800
select dkod, dnev, foglalkozas, fizetes
from dolgozo
where fizetes>2800;

--kinek a fizet�se nagyobb mint 2800 �s analyst
select dkod, dnev, foglalkozas, fizetes
from dolgozo
where fizetes>2800 and foglalkozas='ANALYST';

--ropi
select dnev, fizetes, foglalkozas
from dolgozo
where fizetes between 2000 and 4500
and oazon in (10,20);

select dnev, fizetes, foglalkozas
from dolgozo
where fizetes> 2000 and fizetes<4500 and (oazon=10 or oazon=20);

--kinek a nev�nek m�sodik bet�je az A
select dnev, fizetes, foglalkozas
from dolgozo
where dnev like '_A%';