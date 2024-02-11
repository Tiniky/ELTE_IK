import Data.Char

--Feladatsor/óravázlat a 6. gyakorlathoz

------------
--Ismétlés--
------------

--Definiálj egy `countSpaces` függvényt, amely megszámlálja, hogy egy tetszőleges paraméterül kapott String hány szóközt tartalmaz!
countSpaces :: String -> Int
countSpaces [] = 0
countSpaces (' ':xs) = 1 + countSpaces xs
countSpaces (_:xs) = countSpaces xs

--Definiálj egy `firstTwo` függvényt, amely eldönti, hogy a lista első 2 eleme közül pontosan 1 `True`.
firstTwo :: [Bool] -> Bool
firstTwo (True:False:_) = True
firstTwo (False:True:_) = True
firstTwo _ = False

--Írjunk egy `and'` függvényt, ami eldönti egy logikai elemeket tartalmazó listáról, hogy minden eleme igaz-e. (Üres listára az eredmény igaz.)
and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs

--Készítsük el a listába egy tetszőleges helyre egy elemet beszúró `insert` függvényt az első eleme legyen a beszúrás indexe, a második a beszúrt elem a harmadik pedig a lista, amibe az elemet beszúrjuk. Rossz indexeléssel ne foglalkozzunk.
insert :: Int -> a -> [a] -> [a]
insert 0 e xs = e : xs
insert i e (x:xs) = x : insert (i-1) e xs

--Definiáljunk egy `everySecond` függvényt, amely kiválogat minden második elemet egy listából!
everySecond :: [a] -> [a]
everySecond [] = []
everySecond [x] = []
everySecond (x:y:xs) = y : everySecond xs

--Definiáljunk egy `everyNth` függvényt, amely kiválogat minden n. elemet egy listából!
everyNth :: Int -> [a] -> [a]
everyNth n [] = []
everyNth n xs = [snd x | x <- (zip[1..] xs), fst x `mod` n == 0]

--Készítsünk egy `sublist` függvényt, ami kivág egy listából egy részt! Az első paraméter az index, ahonnan a részlista kezdődik és a második paraméter a vágás hossza.
sublist :: Int -> Int -> [b] -> [b]
sublist a b (x:xs) = take (b+a) (drop (a-1)(x:xs))

----------------
--Őrfeltételek--
----------------

--  foo ...
--      | őrfeltétel = kifejezés
--      | otherwise = kifejezés

--pl.:
min' :: Ord a => a -> a -> a
min' x y 
    | x < y = x
    | otherwise = y
    
--Definiálj függvényt, ami egy mértékegység-hőmérséklet párból eldönti, hogy kellemes idő van-e! (Celsius: 20-30, Kelvin: 293-303, Farenheit: 68-86)
niceWeather :: (Ord a, Num a) => ([Char], a) -> Bool
niceWeather ("Celsius", n)
    | n >= 20 && n<=30 = True
niceWeather ("Kelvin", n)
    | n >= 293 && n<=86 = True
niceWeather ("Farenheit", n)
    | n >= 68 && n <= 86 = True
niceWeather _ = False
    
--Definiálj egy `filterEven` függvényt, amely egy tetszőleges paraméterül kapott egészeket tartalmazó listából kiválogatja a páros számokat! A megoldáshoz használj rekurziót!
filterEven :: [Int] -> [Int]
filterEven [] = []
filterEven (x:xs)
    | even x = filterEven xs
	| otherwise = x : filterEven xs

----Definiálj egy függvényt, amely egy tetszőleges paraméterül kapott Stringből eltávolítja az 'e' betűket! A megoldáshoz használj rekurziót!
--pl.: removeLetterE "feketeribizli" == "fktribizli"
removeLetterE :: String -> String
removeLetterE (x:xs)
    |x /= 'e' = x : removeLetterE xs
    |otherwise = removeLetterE xs
    
--Szedjük ki egy listából egy adott elem első előfordulását (`remove` függvény). A további előfordulásokat hagyjuk meg. Az eltávolítandó elem az első paraméter a lista a második.
remove :: Eq a => a -> [a] -> [a]
remove _ [] = []
remove y (x:xs)
    | y == x = xs
	| otherwise = x : remove y xs
    
--Definiáljunk az upperLower függvényt, amely kisbetűből nagybetűt csinál, és fordítva, az egyéb karaktereket pedig változatlanul hagyja!
abc = ['a'..'z']
ABC = ['A'..'Z']
upperLower :: String -> String
upperLower [] = []
upperLower (x:xs)
    | elem x abc = toUpper x : upperLower xs
    | elem x ABC = toLower x : upperLower xs
	| otherwise = upperLower xs


--Írjuk meg a lookup' függvényt, ami kulcs-érték párok listájából kikeresi azt az értéket, ami egy adott kulcshoz tartozik. (A kulcs érték párokat egyszerű tuple-ökkel definiáljuk.)
--lookup' 2 [(3,"xy"),(2,"abc"),(4,"qwe")] == "abc"
lookup' :: Eq a => a -> [(a, b)] -> b
lookup' x ((a,b):xs)
	| x == a = b
	| otherwise = lookup' x xs
