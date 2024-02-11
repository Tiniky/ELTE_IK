--Feladatsor/óravázlat a 3. gyakorlathoz

------------------
--Mintaillesztés--
------------------

not' :: Bool -> Bool
not' True = False
not' False = True

or' :: Bool -> Bool -> Bool
or' False False = False
or' _ _ = True

and' :: Bool -> Bool -> Bool
and' True True = True
and' _ _ = False

--Definiáljunk egy függvényt, amely egy sortörést egy szóközre cserél!
replaceNewline :: Char -> Char
replaceNewline '\n' = ' '
replaceNewline x = x


---------
--Tuple--
---------

--Definiáld a first függvényt, amely visszaadja egy rendezett pár első elemét!
first :: (p1,p2) -> p1
first (a,b) = a

--Definiáld a swap függvényt, amely megcseréli egy rendezett pár elemeit! Mi lesz a típusa a függvénynek?
--pl.: swap (1, False) = (False, 1)
swap' :: (a,b) -> (b,a)
swap' (x,y) = (y,x)

--Definiáld a "triplicate" nevű függvényt, amely egy tetszőleges paraméterként adott x egy rendezett hármast ad vissza, amelynek minden eleme x!
--Mi lesz a típusa?
triplicate :: a -> (a,a,a)
triplicate x = (x,x,x)

--Definiáld az "isEven" függvényt, amely egy megadott egész számból egy olyan rendezett párt készít, amelynek első eleme maga a szám, és a második eleme egy logikai érték, amely megadja, hogy a szám páros-e.
isEven :: Integral a => a -> (a, Bool)
isEven x = (x, x `mod` 2 == 0)

--Definiáld az addPair függvényt, amely elemenként összead két számokból álló rendezett párt!
--Oldd meg a feladatot mintaillesztéssel és a fst, snd függvények segítségével is!
--Pl.: addPair (1,2) (1,1) = (2,3)
addPair :: Num a => (a,a) -> (a,a) -> (a,a)
addPair (x,y) (a,b) = (x+a,y+b)

--Definiálj egy függvényt, amely megadja két egész számnak az egymással való egész osztás eredményét és az osztási maradékot egy rendezett párként!
divMod' :: Integral a => a -> a -> (a,a)
divMod' x y = (x `div` y, x `mod` y)

--Definiálj függvényt, amely megadja egy síkbeli pont az origótól való távolságát!
distFromOrigo :: Floating a => (a,a) -> a
distFromOrigo (a,b) = sqrt (a*a + b*b)

--Definiálj függvényt, amely megadja két síkbeli pont egymástól való távolságát!
distFromEachOther :: Floating a => (a,a) -> (a,a) -> a
distFromEachOther (x,y) (a,b) = sqrt( (a-x)*(a-x) + (b-y)*(b-y))

----------
--Listák--
----------
--http://lambda.inf.elte.hu/Lists.xml
{-
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
exerciseList2 = [(1,'a'), (3,'c'), (5,'e')]

exerciseList3 :: (Fractional a, Integral b) => [(a, a, b)]
exerciseList3 = [(1.2, 1, 'a'), (3.4, 2, 'b'), (5.6, 3, 'c')]

exerciseList4 :: Num a => [[a]]
exerciseList4 = [[1],[2],[3]]

--Konkatenálás: ++
exampleConcat = [1,2,3] ++ [4,5,6]
exampleConcat = [1,2,3,4,5,6]

--Pontpont kifejezések

exampleList5 = [1..10]
exampleList5 = [1,2,3,4,5,6,7,8,9,10]

exampleList6 = [9,8..0]
exampleList6 = [9,8,7,6,5,4,3,2,1,0]

exampleList7 = ['a'..'z']
exampleList7 = "abcdefghijklmnopqrstuvwxyz"

--Soroljuk fel 10-től visszafelé -10-ig a számokat!
tenToTen = [10,9..(-10)]

--sum, product
exampleSum = sum [1..10]		--összeadja az elemeket
exampleSum = 55

exampleProd = product [1..10]	--összeszorozza az elemeket
exampleProd = 3628800
-}
--Definiáljátok a faktoriális függvényt!
fact :: Integral a => a -> a
fact 0 = 1
fact x = x * fact(x-1)

--------------------
--Listagenerátorok-- (list comprehension)
--------------------
--http://lambda.inf.elte.hu/Comprehensions.xml

listComp = [n^2 | n <- [1..10], even n]

--Állítsuk elő a 2 hatványait növekvő sorrendben 1-től 2^10-ig!
kettoHatvany = [2^n | n <-[1..10]]

--Soroljuk fel az első 10 négyzetszám kétszeresét!
negyzetSzamok = [2*n^2 | n <- [1..10]] 

--Soroljuk fel 1 és 100 között azokat a számokat, amelyek oszthatóak 3-mal, de nem oszthatóak 5-tel!
osztHaromDeNemOt = [n | n <- [1..100], n `mod` 3 == 0 && n `mod` 5 /=0]

--Definiálj egy függvényt, amely összeadja a páros számokat egy paraméterül megkapott n számig!
sumNig n = sum [x|x<-[1..n], even x]

--Definiálj egy függvényt, amely egy tetszőleges paraméterül kapott Stringből eltávolítja az 'e' betűket!
noMoreE :: String -> String
noMoreE x = [n|n<-x, n /= 'e']

--Soroljuk fel a 60 osztóit!
hatvanOszt = [n|n<-[1..60], 60 `mod` n == 0]

--Állítsunk elő 1-50 között a számokat és 3-mal való osztási maradékukat egy rendezett párokat tartalmazó listában.
szamokOtvenig = [(n,n `mod` 3) | n<-[1..50]]

--Állítsuk elő azt a listát, amely sorrendben tartalmazza az összes (óra, perc) párt!
oraPerc = [(h,p)| h<-[0..23], p<-[0..59]]

