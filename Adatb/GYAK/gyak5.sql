--ropi
select oazon, onev, telephely, round(avg(fizetes),2) "�tlag fizet�s"
from dolgozo natural join osztaly
where fizetes>1000
group by oazon, onev, telephely
having count(*)>=2
order by oazon;

--2. Adjuk meg oszt�lyonk�nt a dolgoz�k �sszfizet�s�t az oszt�ly nev�t megjelen�tve ONEV, SUM(FIZETES) form�ban, �s azok az oszt�lyok is jelenjenek meg ahol nem dolgozik senki, ott az �sszfizet�s 0 legyen. Valamint ha van olyan dolgoz�, akinek nincs megadva, hogy mely oszt�lyon dolgozik, azokat a dolgoz�kat egy 'FIKTIV' nev� oszt�lyon gy�jts�k �ssze. Minden oszt�lyt a nev�vel plusz ezt a 'FIKTIV' oszt�lt is jelen�ts�k meg az itt dolgoz�k �sszfizet�s�vel egy�tt.
select O2.oazon, NVL(onev,'FIKTIV'), telephely, round(avg(fizetes),2) "�tlag fizet�s", count(dkod) "l�tsz�m"
from dolgozo D1 left outer join osztaly O2
on D1.oazon=O2.oazon
where fizetes>1000
group by O2.oazon, onev, telephely
having avg(fizetes)>=2
order by "�tlag fizet�s";

select O2.oazon, NVL(onev,'FIKTIV'), telephely, round(avg(fizetes),2) "�tlag fizet�s", count(*) "l�tsz�m"
from dolgozo D1 right outer join osztaly O2
on D1.oazon=O2.oazon
where fizetes>1000
group by O2.oazon, onev, telephely
order by "�tlag fizet�s";

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
(select belepes from dolgozo where dnev='JONES')),2) "eltelt h�nap",
round(
((select belepes from dolgozo where dnev='KING') -
(select belepes from dolgozo where dnev='JONES'))/7,2) het
from dual;

--alkerdes: skalar halmaz
select * from dolgozo
where fizetes>=
ALL(select fizetes from dolgozo);

--koller�l�s
select * from dolgozo D1
where fizetes>=
(select avg(fizetes) from dolgozo D2 where oazon=D2.oazon);

--alkerdes: tobbdimenzios tabla
select * from dolgozo
where oazon in (select oazon from osztaly where telephely='DALLAS');

select * from dolgozo D1
where exists (select oazon from osztaly where telephely='DALLAS' and D1.oazon=oazon);