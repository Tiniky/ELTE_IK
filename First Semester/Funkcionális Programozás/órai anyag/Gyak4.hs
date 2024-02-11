--Feladatsor/óravázlat a 4. gyakorlathoz


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
--pl.: sumEven 1 == 0; sumEven 4 == 6 stb.
sumEven n = sum [x|x<-[1..n], even x]

--Definiálj egy függvényt, amely egy tetszőleges paraméterül kapott számokat tartalmazó listából előállít egy olyan listát, amelynek minden eleme 5-tel nagyobb, mint az eredeti lista megfelelő eleme!
--pl.: plus5 [1,2,3,4,5] == [6,7,8,9,10]
plus5 (x:xs) = [n+5|n<-(x:xs)] 

--Definiálj egy függvényt, amely egy tetszőleges paraméterül kapott egészeket tartalmazó listából kiválogatja a páros számokat!
--pl.: filterEven [1, 4, 7, 42, 99] == [4,42]
filterEven (x:xs) = [n|n<-(x:xs), even n]

--Definiálj egy függvényt, amely egy tetszőleges paraméterül kapott Stringből eltávolítja az 'e' betűket!
--pl.: removeLetterE "feketeribizli" == "fktribizli"
noMoreE :: String -> String
noMoreE x = [n|n<-x, n /= 'e']

--Definiálj egy függvényt, amely megszámlálja, hogy egy tetszőleges paraméterül kapott String hány 'e' betűt tartalmaz!
countE :: String -> Int
countE x = sum[1|n<-x, n == 'e']

--Soroljuk fel a 60 osztóit!
hatvanOszt = [n|n<-[1..60], 60 `mod` n == 0]

--Írjunk egy függvényt, amely eldönti egy tetszőleges paraméterként kapott egész számról, hogy prím-e!
--Tipp: a 'null' függvény segítségével eldönthető egy listáról, hogy üres-e!
primSzam :: Int -> Bool
primSzam x = null [n|n<-[2..(x-1)], x `mod` n == 0]

--Állítsunk elő 1-50 között a számokat és 3-mal való osztási maradékukat egy rendezett párokat tartalmazó listában.
szamokOtvenig = [(n,n `mod` 3) | n<-[1..50]]

--Állítsuk elő azt a listát, amely sorrendben tartalmazza az összes (óra, perc) párt!
oraPerc = [(h,p)| h<-[0..23], p<-[0..59]]

--Adott egy (x,y) koordinátákat tartalmazó lista. Válogassuk ki azokat a koordinátákat, amelyek az x-tengelyen vannak!
xTengelyen :: Integral a => [(a,a)] -> [(a,a)]
xTengelyen x = [(fst n, snd n) | n<-x, snd n == 0]

--Számoljuk meg azokat a párokat egy listában, amelyekben a pár elemei közötti távolság legalább 2!
kettoTavolsag :: Integral a => [(a,a)] -> a
kettoTavolsag x = sum [1| n<-x, (snd n) - (fst n) >= 2 || (fst n) - (snd n) >= 2]

-------------------
--Minták listákra--
-------------------
--http://lambda.inf.elte.hu/Patterns.xml#mint%C3%A1k-list%C3%A1kra

--Definiáld a null' függvényt mintaillesztés segítségével, amely eldönti egy listáról, hogy üres-e!
null' :: [a] -> Bool
null' [] = True
null' _ = False

--Definiáld a head' függvényt mintaillesztés segítségével, amely visszaadja egy lista első elemét!
head' :: [a] -> a
head' (x:_) = x

--Definiáljuk az “1 elemű-e a lista” függvényt mintaillesztéssel!
isSingleton :: [a] -> Bool
isSingleton [] = False
isSingleton [x] = True
isSingleton _ = False



