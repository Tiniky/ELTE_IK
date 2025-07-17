--ropi
select oazon, onev, telephely, round(avg(fizetes),2) "átlag fizetés"
from dolgozo natural join osztaly
where fizetes>1000
group by oazon, onev, telephely
having count(*)>=2
order by oazon;

--2. Adjuk meg osztályonként a dolgozók összfizetését az osztály nevét megjelenítve ONEV, SUM(FIZETES) formában, és azok az osztályok is jelenjenek meg ahol nem dolgozik senki, ott az összfizetés 0 legyen. Valamint ha van olyan dolgozó, akinek nincs megadva, hogy mely osztályon dolgozik, azokat a dolgozókat egy 'FIKTIV' nevû osztályon gyûjtsük össze. Minden osztályt a nevével plusz ezt a 'FIKTIV' osztált is jelenítsük meg az itt dolgozók összfizetésével együtt.
select O2.oazon, NVL(onev,'FIKTIV'), telephely, round(avg(fizetes),2) "átlag fizetés", count(dkod) "létszám"
from dolgozo D1 left outer join osztaly O2
on D1.oazon=O2.oazon
where fizetes>1000
group by O2.oazon, onev, telephely
having avg(fizetes)>=2
order by "átlag fizetés";

select O2.oazon, NVL(onev,'FIKTIV'), telephely, round(avg(fizetes),2) "átlag fizetés", count(*) "létszám"
from dolgozo D1 right outer join osztaly O2
on D1.oazon=O2.oazon
where fizetes>1000
group by O2.oazon, onev, telephely
order by "átlag fizetés";

select O2.oazon, NVL(onev, 'FIKTIV'), telephely, NVL(round(avg(fizetes)),0) atlagfiz, count(dkod) letszam, count(distinct foglalkozas) "mennyi kulonbozo fogl"
from dolgozo D1 FULL OUTER JOIN osztaly O2
ON D1.oazon=O2.oazon
group by O2.oazon, onev, telephely
order by atlagfiz;

--alkerdes: skalar
select * from dolgozo
where fizetes=
(select max(fizetes) from dolgozo);

select round(months_between
((select belepes from dolgozo where dnev='KING'),
(select belepes from dolgozo where dnev='JONES')),2) "eltelt hónap",
round(
((select belepes from dolgozo where dnev='KING') -
(select belepes from dolgozo where dnev='JONES'))/7,2) het
from dual;

--alkerdes: skalar halmaz
select * from dolgozo
where fizetes>=
ALL(select fizetes from dolgozo);

--kollerálás
select * from dolgozo D1
where fizetes>=
(select avg(fizetes) from dolgozo D2 where oazon=D2.oazon);

--alkerdes: tobbdimenzios tabla
select * from dolgozo
where oazon in (select oazon from osztaly where telephely='DALLAS');

select * from dolgozo D1
where exists (select oazon from osztaly where telephely='DALLAS' and D1.oazon=oazon);