--Feladatsor/óravázlat a 5. gyakorlathoz


------------
--Rekurzió--
------------
--itt fgv definícióban felhasználjuk a fgv-t is
--fact alapesete a 0 fact ami 1

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1)

-- fact 3 
-- 3 * (fact 2)
-- 3 * (2 * (fact 1))
-- 3 * (2 * (1 * (fact 0)))
-- 3 * (2 * (1 * (1)))
-- 3 * (2 * 1)
-- 3 * 2
-- 6

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- fib 5
-- fib (5-1) + fib (5-2)
-- fib 4 + fib 3
-- (fib (4-1) + fib (4-2)) + (fib (3-1) + fib(3-2))
-- fib (3) + fib(2) + fib (2) + (fib 1) ami 1
-- fib(2) + 1 + fib(2) + fib(2) + 1
--fib(2) = fib (2-1) + fib (2-2) = 1
--1 + 1 + 1 + 1 + 1 = 5

--Definiáljuk a pow függvényt, amely egy paraméterként megadott n számot a k-adik hatványra emel!
pow :: Int -> Int -> Int
pow n 0 = 1
--pow n 1 = n (ez a sor fölösleges)
pow n k = n * pow n (k-1) 

--mert itt a pow 2 parametert var

--pow 2 3
--2 * pow 2 (3-1)
--pow 2 2
-- 2 * (2* pow 2 (2-1))
--2 * (2 *(pow 2 1))
--2 * (2*(2* pow 2 0))
--2* (2* (2* 1)) = 8

-------------------
--Minták listákra--
-------------------
--http://lambda.inf.elte.hu/Patterns.xml#mint%C3%A1k-list%C3%A1kra

--Minták listákra
--Üres lista minta:     []
--Egyelemű lista:       [a]
--Kételemű lista:       [a,b]
--Nemüres lista minta:   a:b
--itt a az elso elem, a b pedig a lista többi resze
-- a: fejelem, b: többi rész -> ezt be kell zárójelezni a fgv-ben
--a:[] itt egyetlen elem van a listában

-- : operátorral a lista elejére tudunk illeszteni egy elemet
-- 1:2:3:4:[]


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

-- Párokból álló lista készítése két listából. (a rövidebb listáig fog menni, amíg össze tud elemeket rakni)
-- zip [1..5] ['a'..'e'] == [(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e')]
-- zip [1..5] ['a'..] == [(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e')]
-- zip [1..] ['a'..'e'] == [(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e')]

--Definiáljuk a null' függvényt mintaillesztés segítségével, amely eldönti egy listáról, hogy üres-e!

null' :: [a] -> Bool
null' [] = True
null' _ = False

--a joker helyére lehetne x-et írni

--Definiáljuk a head' függvényt mintaillesztés segítségével, amely visszaadja egy lista első elemét!

head' :: [a] -> a
head' (x:_) = x

--Definiáljuk az “1 elemű-e a lista” függvényt mintaillesztéssel!

isSingleton :: [a] -> Bool
isSingleton (x:[]) = True
--isSingleton [x] = True
isSingleton _ = False

--Definiáljunk egy olyan függvényt, amely eldönti, hogy 0-val kezdődik-e a lista!

headZero :: (Num a, Eq a) => [a] -> Bool
headZero (0:_) = True
headZero _ = False

--num nem összehasonlítható, de ehhez kellett

--Definiáljuk újra a tail függvényt, amely megadja egy lista fejelem utáni részét!
tail' :: [a] -> [a]
tail' (x:xs) = xs


--Definiáljuk újra a length függvényt, amely megadja egy lista hosszát!

length' :: [a] -> Int
length' [] = 0
--length' [x] = 1 ezekkel működnek de felesleges, elég itt egy alapeset
lenght' (_:xs) = 1 + length' xs

erre illeszkedik 3:[1,2] 

--első elem és a többit szét tudom választani, x:xs > 1-el nagyobb mint xs

--Definiáljuk újra a sum függvényt, amely összegez egy számlistát!

sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

--Definiáljuk újra a last függvényt, amely visszaadja egy lista utolsó elemét!

last' :: [a]{-nemüres-} -> a
last' (x:[]) = x
last' (_:xs) = last' xs 

--Mire illeszkedik?
-- (x:y:xs) -> olyan lista aminek van biztosan két eleme legalább
-- ((x,y):xs) -> ennek a listának az elemei tuplek

--Definiáljuk újra az init függvényt, amely egy lista összes elemét visszaadja, az utolsót kivéve!
--init' :: [a]{-nemüres-} -> [a]


--Definiáljuk újra a minimum függvényt, amely kiválasztja a legkisebb elemet egy listából!
--A függvényhez használjuk fel a min függvényt, amely két elem közül megadja a kisebbet!
--minimum' :: Ord a => [a]{-véges, nemüres-} -> a


--Definiáljuk a concat függvényt, amely összefűzi egy Stringeket tartalmazó lista elemeit!
--concat' :: [[a]] -> [a]



--Definiáljuk a zip függvényt, amely elemenként párosít két listát!

zip' :: [a] -> [b] -> [(a,b)]
zip' [] [] = []
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

-- ++-al két listát tudok összeragasztani, :-al elemet hozzárakni
