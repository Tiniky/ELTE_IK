--Adjuk meg oszt�lyonk�nt a telephelyet �s az �tlagfizet�st.
select oazon, telephely, round(avg(fizetes),2) "�tlag fizet�s"
from dolgozo natural join osztaly
group by oazon, onev, telephely
order by oazon;

--Skal�r�rt�k� alk�rd�ssel:Ki azok �s milyen munkak�rben dolgoznak a legnagyobb fizet�s� dolgoz�?
select * from dolgozo
where fizetes=
(select max(fizetes) from dolgozo);
 
--Skal�rhalmaz �rt�k� alk�rd�ssel: Kik azok �s milyen munkak�rben dolgoznak a legnagyobb fizet�s� dolgoz�k?
select * from dolgozo
where fizetes in
   (select fizetes
    from dolgozo
    order by fizetes desc
    fetch first 3 rows only);

--Korrel�lt alk�rd�ssel: Adjuk meg, hogy mely dolgoz�k fizet�se jobb, mint a saj�t oszt�ly�n (vagyis azon az oszt�lyon, ahol dolgozik az ott) dolgoz�k �tlagfizet�se!
select * from dolgozo D1
where fizetes>=
(select avg(fizetes) from dolgozo D2 where oazon=D2.oazon);

--Adjuk meg azokat a foglalkoz�sokat, amelyek csak egyetlen oszt�lyon fordulnak el�, �s adjuk meg hozz�juk azt az oszt�lyt is, ahol van ilyen foglalkoz�s� dolgoz�.
SELECT DISTINCT oazon, foglalkozas
FROM dolgozo
WHERE foglalkozas IN
(SELECT foglalkozas
FROM Dolgozo
GROUP BY foglalkozas
HAVING COUNT(DISTINCT oazon) = 1)
ORDER BY oazon;

--Adjuk meg oszt�lyonk�nt a legnagyobb fizet�su dolgoz�(ka)t, �s a fizet�st.
SELECT D1.dnev, D1.foglalkozas, d1.fizetes FROM dolgozo D1,
(SELECT OAZON, AVG(FIZETES) AS atlag
FROM Dolgozo
GROUP BY OAZON) D2
WHERE D1.oazon=D2.oazon and D1.fizetes>D2.atlag;

--Adjuk meg, hogy az egyes oszt�lyokon h�ny ember dolgozik (azt is, ahol 0=senki).
SELECT DISTINCT D1.oazon, D2.db
FROM dolgozo D1,
(SELECT OAZON, COUNT(*) AS db
FROM Dolgozo
GROUP BY OAZON) D2
WHERE D1.oazon=D2.oazon;

select * from dolgozo;
--Adjuk meg azokat a fizet�si kateg�ri�kat, amelyekbe beleesik legal�bb h�rom olyan dolgoz�nak a fizet�se, akinek nincs beosztottja.
SELECT Fiz_Kategoria.kategoria, COUNT(DISTINCT Dolgozo.dkod) AS db FROM Fiz_Kategoria
INNER JOIN Dolgozo ON Dolgozo.fizetes > Fiz_Kategoria.also AND Dolgozo.fizetes <= Fiz_Kategoria.felso
LEFT JOIN Dolgozo D2 ON dolgozo.dkod = D2.fonoke
WHERE d2.fonoke IS NULL
GROUP BY Fiz_Kategoria.kategoria
HAVING COUNT(DISTINCT Dolgozo.dkod) >= 3;

--Adjuk meg a legrosszabbul keres� f�n�k fizet�s�t, �s fizet�si kateg�ri�j�t.
