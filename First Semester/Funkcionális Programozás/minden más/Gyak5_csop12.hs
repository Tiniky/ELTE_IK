--Feladatsor/óravázlat a 5. gyakorlathoz


------------
--Rekurzió--
------------

--fact :: Int -> Int

-- fact 3 
-- 3 * (fact 2)
-- 3 * (2 * (fact 1))
-- 3 * (2 * (1 * (fact 0)))
-- 3 * (2 * (1 * (1)))
-- 3 * (2 * 1)
-- 3 * 2
-- 6

--fib :: Int -> Int


--Definiáljuk a pow függvényt, amely egy paraméterként megadott n számot a k-adik hatványra emel!
--pow :: Int -> Int -> Int


-------------------
--Minták listákra--
-------------------
--http://lambda.inf.elte.hu/Patterns.xml#mint%C3%A1k-list%C3%A1kra

--Minták listákra
--Üres lista minta:     []
--Egyelemű lista:       [a]
--Kételemű lista:       [a,b]
--Nemüres lista minta:   a:b

-- Lista szerkezete
-- head [1,2,3,4] == 1        -- fejelem lekérése
-- tail [1,2,3,4] == [2,3,4]  -- farok rész lekérése
-- last [1,2,3,4] == 4        -- utolsó elem lekérése
-- init [1,2,3,4] == [1,2,3]  -- lista lekérése az utolsó elem nélkül

-- null [] == True

-- Elem hozzáfűzése egy lista elejére
-- 5 : [1,2,3] == [5,1,2,3]
-- 1 : 2 : 3 : [] == [1,2,3]

-- Első x elem lekérése
-- take 3 [1,2,3,4] == [1,2,3]
-- take 0 [1,2,3,4] == []
-- take 10 [1,2,3,4] == [1,2,3,4]

-- Első x elem eldobása
-- drop 3 [1,2,3,4] == [4]
-- drop 0 [1,2,3,4] == [1,2,3,4]
-- drop 10 [1,2,3,4] == []

-- Egy elem megtalálható-e egy listában?
-- elem 4 [1,2,3,4] == True
-- elem 0 [1,2,3,4] == False

--Definiáljatok egy olyan függvényt, amely megadja, hogy egy adott karakter számjegy-e! 
--isDigit :: Char -> Bool

-- Elem ismétlése végtelenszer
-- repeat 5 == [5,5..]

-- Lista ismétlése végtelenszer
-- take 10 cycle [1,2,3] == [1,2,3,1,2,3,1,2,3,1]

-- Párokból álló lista készítése két listából.
-- zip [1..5] ['a'..'e'] == [(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e')]
-- zip [1..5] ['a'..] == [(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e')]
-- zip [1..] ['a'..'e'] == [(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e')]

--Definiáljuk a null' függvényt mintaillesztés segítségével, amely eldönti egy listáról, hogy üres-e!
--null' :: [a] -> Bool

--Definiáljuk a head' függvényt mintaillesztés segítségével, amely visszaadja egy lista első elemét!
--head' :: [a] -> a


--Definiáljuk az “1 elemű-e a lista” függvényt mintaillesztéssel!
--isSingleton :: [a] -> Bool


--Definiáljunk egy olyan függvényt, amely eldönti, hogy 0-val kezdődik-e a lista!
--headZero :: (Num a, Eq a) => [a] -> Bool


--Definiáljuk újra a length függvényt, amely megadja egy lista fejelem utáni részét!
--tail' :: [a] -> [a]


--Definiáljuk újra a length függvényt, amely megadja egy lista hosszát!
--length' :: [a] -> Int


--Definiáljuk újra a sum függvényt, amely összegez egy számlistát!
--sum' :: Num a => [a] -> a


--Definiáljuk újra a last függvényt, amely visszaadja egy lista utolsó elemét!
--last' :: [a]{-nemüres-} -> a


--Definiáljuk újra az init függvényt, amely egy lista összes elemét visszaadja, az utolsót kivéve!
--init' :: [a]{-nemüres-} -> [a]


--Definiáljuk újra a minimum függvényt, amely kiválasztja a legkisebb elemet egy listából!
--A függvényhez használjuk fel a min függvényt, amely két elem közül megadja a kisebbet!
--minimum' :: Ord a => [a]{-véges, nemüres-} -> a


--Definiáljuk a concat függvényt, amely összefűzi egy Stringeket tartalmazó lista elemeit!
--concat' :: [[a]] -> [a]



--Definiáljuk a zip függvényt, amely elemenként párosít két listát!
--zip' :: [a] -> [b] -> [(a,b)]
