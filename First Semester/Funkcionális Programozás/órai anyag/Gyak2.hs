--Feladatsor/óravázlat a 2. gyakorlathoz

------------
--Ismetles--
------------

--A szökőévek a következők: minden néggyel osztható szám, kivéve a százzal is oszthatóakat. A négyszázzal osztható számok azonban szökőévek. 
--Definiálj függvényt, amely eldönti egy paraméterként megadott évről, hogy szökőév-e!

isDivisibleBy :: Int -> Int -> Bool
isDivisibleBy x y = x `mod` y == 0

isDivBy4 :: Int -> Bool
isDivBy4 x = x `isDivisibleBy` 4

isDivBy100 :: Int -> Bool
isDivBy100 x = x `isDivisibleBy` 100

isDivBy400 :: Int -> Bool
isDivBy400 x = x `isDivisibleBy` 400

isLeapYear :: Int -> Bool
isLeapYear x = isDivBy400 x || (isDivBy4 x && not(isDivBy100 x))

-----------------
--Polimorfizmus--
-----------------

--Milyen típussal rendelkezhetnek az alábbi függvények?

f1 :: Num a => a -> a
f1 x = 2*x+1

f2 :: Integral a => a ->  Bool
f2 x = 3*x `div` 3 == 0

f3 :: Fractional a => a -> a
f3 x = (x+100) / 7

decreasing :: Ord a => a -> a -> a -> Bool
decreasing x y z = x >= y && y >= z

equal3 :: Eq a => a -> a -> a -> Bool
equal3 x y z = x == y && y == z

--Még általánosabb függvények!

firstParam :: a -> b -> a
firstParam a b = a

-------------
--Konverzio--
-------------

--Számoljuk ki a 10^9 gyökéhez legközelebb eső egész  számot!
--(sqrt fgv)
constSqrt :: Integral a => a
constSqrt = round (sqrt (10^9))

--Definiálj egy függvényt, amely megadja két egész szám összegének a gyökét!
sumSqrt :: Integral a => a -> a -> Double
sumSqrt x y = sqrt (fromIntegral(x+y))

------------------
--Mintaillesztés--
------------------

not' :: Bool -> Bool
not' True = False
not' _ = True

or' :: Bool -> Bool -> Bool
or' False False = False
or' _ _ = True

and' :: Bool -> Bool -> Bool
and' True True = True
and' _ _ = False

--Tuple
first :: (p1,p2) -> p1
first (a,b) = a

--Definiáld a "triplicate" nevű függvényt, amely egy tetszőleges paraméterként adott x egy rendezett hármast ad vissza, amelynek minden eleme x!
--Mi lesz a típusa?
triplicate :: a -> (a,a,a)
triplicate x = (x,x,x)

--Definiáld az "isEven" függvényt, amely egy megadott egész számból egy olyan rendezett párt készít, amelynek első eleme mga a szám, és a második eleme egy logikai érték, amely megadja, hogy a szám páros-e.
isEven :: Integral a => a -> (a, Bool)
isEven x = (x, x `mod` 2 == 0)

--Definiálj egy függvényt, amely megadja két egész számnak az egymással való egész osztás eredményét és az osztási maradékot egy rendezett párként!
divMod' :: Integral a => a -> a -> (a,a)
divMod' x y = (x `div` y, x `mod` y)





