--Feladatsor/óravázlat a 3. gyakorlathoz

------------------
--Mintaillesztés--
------------------

not' True = False
not' False = True

or' :: Bool -> Bool -> Bool
--or' True True = True
--or' True False = True
--or' False True = True
--or' False False = False
--or' True _ = True
--or' _ True = True
--or' _ _ = False
or' False False = False
or' _ _ = True

and' :: Bool -> Bool -> Bool
and' True True = True
and' _ _ = False

whatNumber :: Integer -> String
whatNumber 1 = "Egy!"
whatNumber 2 = "Ketto"
whatNumber 3 = "Harom"
whatNumber x = "Nem 1 es 3 kozotti"

--Definiáljunk egy függvényt, amely egy sortörést egy szóközre cserél!
replaceNewline :: Char -> Char
replaceNewline '\n' = ' '
replaceNewline x = x

---------
--Tuple--
---------

--Definiáld a first függvényt, amely visszaadja egy rendezett pár első elemét!
first :: (p1,p2) -> p1
first pair = fst pair

first' :: (p1,p2) -> p1
first' (a,_) = a

--Definiáld a swap függvényt, amely megcseréli egy rendezett pár elemeit! Mi lesz a típusa a függvénynek?
--pl.: swap (1, False) = (False, 1)
swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

swap' :: (a, b) -> (b, a)
swap' pair = (snd pair, fst pair)

--Definiáld a "triplicate" nevű függvényt, amely egy tetszőleges paraméterként adott x egy rendezett hármast ad vissza, amelynek minden eleme x!
--Mi lesz a típusa?
triplicate :: a -> (a, a, a)
triplicate x = (x, x, x)

--Definiáld az "isEven" függvényt, amely egy megadott egész számból egy olyan rendezett párt készít, amelynek első eleme maga a szám, és a második eleme egy logikai érték, amely megadja, hogy a szám páros-e.
isEven :: Integral a => a -> (a, Bool)
isEven x = (x, even x)

--Definiáld az addPair függvényt, amely elemenként összead két számokból álló rendezett párt!
--Oldd meg a feladatot mintaillesztéssel és a fst, snd függvények segítségével is!
--Pl.: addPair (1,2) (1,1) = (2,3)
addPair :: Num a => (a, a) -> (a, a) -> (a, a)
addPair (a, b) (c, d) = (a + c, b + d)

addPair' :: Num a => (a, a) -> (a, a) -> (a, a)
addPair' pair1 pair2 = (fst pair1 + fst pair2, snd pair1 + snd pair2)

--Definiálj egy függvényt, amely megadja két egész számnak az egymással való egész osztás eredményét és az osztási maradékot egy rendezett párként!
divAndMod :: Integral a => a -> a -> (a,a)
divAndMod x y =  (x `div` y, x `mod` y)

--Definiálj függvényt, amely megadja egy síkbeli pont az origótól való távolságát!
distFromOrigo :: Floating a => (a,a) -> a
distFromOrigo (x, y) = sqrt (x^2 + y^2)

--Definiálj függvényt, amely megadja két síkbeli pont egymástól való távolságát!
distance :: Floating a => (a,a) -> (a,a) -> a
distance (x1, y1) (x2, y2) = sqrt ((x2 - x1)^2 + (y2 - y1)^2)

----------
--Listák--
----------
--http://lambda.inf.elte.hu/Lists.xml

--Példa konkrét listákra:
exampleList1 :: Num a => [a]
exampleList1 = [1,2,3,4,5]

exampleList2 :: [Bool]
exampleList2 = [True, False, False, True]

exampleList3 :: [Char] -- == String
exampleList3 = ['a', 'l', 'm', 'a']

exampleList4 :: [(Integer, Bool)]
exampleList4 = [(2, True), (-6, False)]

--Adjatok nem üres példát a következő típusú listákra!
exerciseList1 :: [(Integer, Integer)]
exerciseList1 = [(1,2), (3,4), (5,6)]

exerciseList2 :: Integral a => [(a, Char)]
exerciseList2 = [(1, 'a'),(2, 'b'),(3, 'c')]

exerciseList3 :: (Fractional a, Integral b) => [(a, a, b)]
exerciseList3 = [(0.5, 6.9, 2),(0.2, 1.0, 27)]

exerciseList4 :: Num a => [[a]]
exerciseList4 = [[100,50],[0],[(7,8),(1,2)]]

--Konkatenálás: ++
exampleConcat = [1,2,3] ++ [4,5,6]

--Pontpont kifejezések

exampleList5 = [1..10]
exampleList6 = [9,8..0]
exampleList7 = ['a'..'z']

--Soroljuk fel 10-től visszafelé -10-ig a számokat!

--sum, product
exampleSum = sum [1..10]
exampleProd = product [1..10]

--Definiáljátok a faktoriális függvényt!
--fact :: Integral a => a -> a


--------------------
--Listagenerátorok-- (list comprehension)
--------------------
--http://lambda.inf.elte.hu/Comprehensions.xml

listComp = [n^2 | n <- [1..10], even n]

--Állítsuk elő a 2 hatványait növekvő sorrendben 1-től 2^10-ig!

--Soroljuk fel az első 10 négyzetszám kétszeresét!

--Soroljuk fel 1 és 100 között azokat a számokat, amelyek oszthatóak 3-mal, de nem oszthatóak 5-tel!

--Definiálj egy függvényt, amely összeadja a páros számokat egy paraméterül megkapott n számig!

--Definiálj egy függvényt, amely egy tetszőleges paraméterül kapott Stringből eltávolítja az 'e' betűket!

--Soroljuk fel a 60 osztóit!

--Állítsunk elő 1-50 között a számokat és 3-mal való osztási maradékukat egy rendezett párokat tartalmazó listában.

--Állítsuk elő azt a listát, amely sorrendben tartalmazza az összes (óra, perc) párt!


