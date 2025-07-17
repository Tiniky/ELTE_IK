--Adjuk meg osztályonként a telephelyet és az átlagfizetést.
select oazon, telephely, round(avg(fizetes),2) "átlag fizetés"
from dolgozo natural join osztaly
group by oazon, onev, telephely
order by oazon;

--Skalárértékû alkérdéssel:Ki azok és milyen munkakörben dolgoznak a legnagyobb fizetésû dolgozó?
select * from dolgozo
where fizetes=
(select max(fizetes) from dolgozo);
 
--Skalárhalmaz értékû alkérdéssel: Kik azok és milyen munkakörben dolgoznak a legnagyobb fizetésû dolgozók?
select * from dolgozo
where fizetes in
   (select fizetes
    from dolgozo
    order by fizetes desc
    fetch first 3 rows only);

--Korrelált alkérdéssel: Adjuk meg, hogy mely dolgozók fizetése jobb, mint a saját osztályán (vagyis azon az osztályon, ahol dolgozik az ott) dolgozók átlagfizetése!
select * from dolgozo D1
where fizetes>=
(select avg(fizetes) from dolgozo D2 where oazon=D2.oazon);

--Adjuk meg azokat a foglalkozásokat, amelyek csak egyetlen osztályon fordulnak elõ, és adjuk meg hozzájuk azt az osztályt is, ahol van ilyen foglalkozású dolgozó.
SELECT DISTINCT oazon, foglalkozas
FROM dolgozo
WHERE foglalkozas IN
(SELECT foglalkozas
FROM Dolgozo
GROUP BY foglalkozas
HAVING COUNT(DISTINCT oazon) = 1)
ORDER BY oazon;

--Adjuk meg osztályonként a legnagyobb fizetésu dolgozó(ka)t, és a fizetést.
SELECT D1.dnev, D1.foglalkozas, d1.fizetes FROM dolgozo D1,
(SELECT OAZON, AVG(FIZETES) AS atlag
FROM Dolgozo
GROUP BY OAZON) D2
WHERE D1.oazon=D2.oazon and D1.fizetes>D2.atlag;

--Adjuk meg, hogy az egyes osztályokon hány ember dolgozik (azt is, ahol 0=senki).
SELECT DISTINCT D1.oazon, D2.db
FROM dolgozo D1,
(SELECT OAZON, COUNT(*) AS db
FROM Dolgozo
GROUP BY OAZON) D2
WHERE D1.oazon=D2.oazon;

select * from dolgozo;
--Adjuk meg azokat a fizetési kategóriákat, amelyekbe beleesik legalább három olyan dolgozónak a fizetése, akinek nincs beosztottja.
SELECT Fiz_Kategoria.kategoria, COUNT(DISTINCT Dolgozo.dkod) AS db FROM Fiz_Kategoria
INNER JOIN Dolgozo ON Dolgozo.fizetes > Fiz_Kategoria.also AND Dolgozo.fizetes <= Fiz_Kategoria.felso
LEFT JOIN Dolgozo D2 ON dolgozo.dkod = D2.fonoke
WHERE d2.fonoke IS NULL
GROUP BY Fiz_Kategoria.kategoria
HAVING COUNT(DISTINCT Dolgozo.dkod) >= 3;

--Adjuk meg a legrosszabbul keresõ fõnök fizetését, és fizetési kategóriáját.
