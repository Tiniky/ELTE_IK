import Data.Char

--Feladatsor/óravázlat a 7. gyakorlathoz

-----------------------------
-- Magasabbrendű függvények--
-----------------------------

--Számológép

calc :: Int -> Int -> (Int -> Int -> Int) -> Int
calc a b f = a `f` b  

-- map, filter

-- Definiáljuk újra rekurzióval az elemenkénti feldolgozást! (map')
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

-- Definiáljuk újra listagenerátorral az elemenkénti feldolgozást! (map'')
map'' :: (a -> b) -> [a] -> [b]
map'' f xs = [f x | x <- xs]

-- Definiáljuk újra rekurzióval a szűrést! (filter')
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x = x : filter' p xs
    | otherwise = filter' p xs

-- Definiáljuk újra listagenerátorral a szűrést! (filter'')
filter'' :: (a -> Bool) -> [a] -> [a]
filter'' p xs = [x | x <- xs, p x]

-- Számoljuk meg egy adott tulajdonságú elem előfordulásait egy listában!
filterCount :: (a -> Bool) -> [a] -> Int
filterCount _ [] = 0
filterCount a (x:xs)
    | a x = 1 + filterCount a xs
    | otherwise = filterCount a xs

-- Definiáljuk újra a takeWhile függvényt!
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' f (x:xs)
    | f x = x : takeWhile' f xs
	| otherwise = []

------------------------
-- Rekurziós feladatok--
------------------------

--Listában, rendezett párokban tároljuk egy pizza összetevőinek nevét és árát. Adjuk meg a kész pizza árát, ha tudjuk, hogy az alapanyagokon túl 500 Ft munkadíjat számolunk fel.

--pizza [("teszta", 200), ("paradicsomszosz", 150), ("pepperoni", 200), ("cheddar", 300)] == 1350
--pizza [("teszta", 200), ("sajtszosz", 130), ("bacon", 200), ("chili", 300), ("tukortojas", 200)] == 1530
--pizza [("vekony teszta", 180), ("besamel", 120), ("bazsalikom", 200), ("kaviar", 2000), ("gorgonzola", 800)] == 3800

pizza :: [(String, Int)] -> Int
pizza [] = 0
pizza [(a,b)] = b + 500
pizza ((a,b):xs) = b + pizza xs

--Egy titkosított kódból nyerjük ki az első, olyan két karakter hosszú betűsort, amit szám követ.
--Az egyes karakterek azonosításához használjuk a [Data.Char](http://lambda.inf.elte.hu/haskell/doc/libraries/base-4.11.1.0/Data-Char.html#g:1) függvényeit. (isLetter, isDigit)
--(import Data.Char)

--cipher "PYdg7iT4vdO0n4AgmGfUpRzogAf" == "dg"
--cipher "4vkYyAO174midQTt0" == "AO"
--cipher "BwxwEwqCKHuMTAaPn" == ""
--cipher "dM7" == "dM"
--cipher "Kmz" == ""
--cipher "Zk"  == ""
--cipher "T4"  == ""
--cipher "" == ""

cipher :: String -> String
cipher (x:y:z:xs)
    | isLetter x && isLetter y && isDigit z = x : y : []
	| otherwise = cipher (y:z:xs)
cipher _ = []

--Írjuk meg a saját listakülönbség függvényünket! Működése legyen hasonló a halmazelméletből ismert különbség műveletére, azaz azokat az elemeket tartalmazza a különbséglista, amely az első listának az eleme, de a másodiknak nem!
--(A `Data.List.(\\)` függvény nem használható!)

-- pl.:
--listDiff "Haskell" "the best" == "Hakll"
--listDiff "Cannot predict" "the future" == "Cannopdic"
--listDiff "Be the type of person" "you want to meet" == "Bhpfprs"
--listDiff "Eotvos Lorand" "Tudomanyegyetem" == "Evs Lr"

listDiff :: Eq a => [a] -> [a] -> [a]
listDiff [] [] = []
listDiff [y] b
	| elem y b = []
	| otherwise = [y]
listDiff (x:xs) a
	| elem x a = listDiff xs a
	| otherwise = x: listDiff xs a
	
--Adjuk meg, hogy helyesen játszották-e a szólánc játékot! A játék célja, az előzőleg elhangzó szó utolsó betűjével kell egy újabb szót alkotni. A szavakat egy-egy szóközzel választottuk el.
--A feladat megoldásában segítséget nyújthat a [words](http://lambda.inf.elte.hu/haskell/doc/libraries/base-4.11.1.0/Prelude.html#v:words) függvény.

--validGame "alma asztal lo olalkodik kutya" == True
--validGame "konverv veg golya abrosz zsifaf fules" == True
--validGame "erdo osztokel nyugat tabortuz" == False
--validGame "zokog guzsalyas sararany nyul leng" == False

validGame :: String -> Bool
validGame x
	| null(tail (words x)) == True = True
	| last (head (words x)) /= head (head (tail (words x))) = False
	| otherwise = True && validGame (tail x)
