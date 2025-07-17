-- kiírja a tábla tartalmát
select * from dolgozo;

-- kiírja a foglalkozásokat
select foglalkozas from dolgozo;

-- kiírja a foglalkozásokat halmazban
select distinct foglalkozas from dolgozo;

-- kinek a fizetése nagyobb mint 2800
select dkod, dnev, foglalkozas, fizetes
from dolgozo
where fizetes>2800;

--kinek a fizetése nagyobb mint 2800 és analyst
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

--kinek a nevének második betûje az A
select dnev, fizetes, foglalkozas
from dolgozo
where dnev like '_A%';