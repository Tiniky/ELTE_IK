import Data.List
--Feladatsor/óravázlat a 11. gyakorlathoz
--Tekintsük az alábbi definíciót! Mi a B 42 kifejezés típusa?

data D = A Int | B Int [Char]

--String -> D
--D
--B Int
--D -> String

-------------------------
-- Névtelen függvények --
-------------------------

-- Írj a következő függvényekkel ekvivalens névtelen függvényt!

f1 :: Int -> Bool
--f1 a = even a && a `mod` 5 == 0
f1 = (\a -> even a && a `mod` 5 == 0)

f2 :: Num a => a -> a -> a
--f2 a b = a^2 + b^2
f2 = (\a b -> a^2 + b^2)

f3 :: (b, a) -> (a, b, a)
--f3 (a,b) = (b,a,b)
f3 = (\a b -> (b,a,b)

f4 :: [b] -> ([b], b)
--f4 (x:xs) = (xs, x)
f4 = (\(x:xs) -> (xs,x))

-- Válogasd ki a hosszú szavakat egy listából (egy szó hosszúnak számít, ha legalább 8 betű)

-- filterLongWords ["alma", "almafa","cseresznye","cseresznyefa"] == ["cseresznye","cseresznyefa"]
filterLongWords :: [String] -> [String]
--filterLongWords xs = filterLongWords (\x -> length x > 7) xs
filterLongWords xs = filterLongWords (\x -> length (take 8 x) == 8) xs

-- Válogasd ki azokat a párokat egy listából, ahol a pár második komponense nagyobb, mint az első!

filterIncPairs :: Ord a => [(a, a)] -> [(a, a)]
filterIncPairs xs = filter (\(x,y) -> y > x) xs

--Definiáld a monogram függvényt, mely egy név monogramját adja meg! Használd a wordsöt és magasabb rendű függvényt.

--monogram "Jim Carrey" == "J. C."
--monogram "Ilosvai Selymes Péter" == "I. S. P."
monogram :: String -> String
--monogram xs = unwords $ map (\x -> take 1 x ++ ".") $ words xs
--monogram xs = unwords $ map (\x -> [head x, '.']) $ words xs
monogram xs = unwords $ map (\x -> head x : '.' : []) $ words xs

--Definiáld a `uniq` függvényt, mely elhagyja az ismétléseket! (Tipp: használható a Data.List-ből a sort és a group)

-- uniq "Mississippi" == "Mips"
-- uniq "papagaj" == "agjp"
-- uniq "" == ""

uniq :: Ord a => [a] -> [a]
uniq xs = map head $ group $ sort xs

-- Definiáld a repeated függvényt, mely csak az ismétlődő elemeket tartja meg egy listában!
--repeated "Mississippi" == "ips"
--repeated [1,2,3,4,2,5,6,7,1] == [1,2]
--repeated "" == ""

repeated :: Ord a => [a] -> [a]
repeated xs = map head $ filter (\x -> length x > 1) $ group $ sort xs


-- Futamhossz kódolás/dekódolás
-- Az `encode` egy szövegben egymás után ismétlődő elemeket keresve tömörítse a paraméterként kapott listát!
-- encode "abbccccb" == [(1, 'a'), (2, 'b'), (4, 'c'), (1, 'b')]
-- encode (sort "abrakadabra") == [(5, 'a'), (2, 'b'), (1, 'd'), (1, 'k'), (2, 'r')]

--encode :: String -> [(Int, Char)]

-- A decode függvény visszaalakítja az előző encode függvény által kódolt listát szöveggé.

--decode :: [(Int, Char)] -> String


--Állítsunk elő súlyozott összeget! A súlyok az értékek elé vannak párosítva egy listában.

-- weightedSum [(1,1), (1,2)] == 3
-- weightedSum [(1,1), (2,2)] == 5

--weightedSum :: Num a => [(a,a)] -> a

--Definiáld a `replacePred` függvényt, amely kap egy predikátumot, a cserélendő elemet, és egy listát. Minden elemre amelyikre teljesül a predikátum, ott a függvény kicséréli a lista elemét a cserélendő elemmel.

--replacePred even 55 [1,2,3,4,5] == [1,55,3,55,5]
--replacePred isUpper 'x' "DdDd" == "xdxd"
--replacePred (\x -> even x && mod x 3 == 0) 42 [10,20,30] == [10,20,42]

replacePred :: (a -> Bool) -> a -> [a] -> [a]
replacePred p e xs = map (\x -> if p x then e else x)


--Fibonacci párok: Állítsuk elő a (0,1), (1,1), (1,2), (2,3), (3,5), (5,8), … (végtelen) sorozatot! A sorozat előállítási szabálya: (a, b) -> (b, a+b).
--fibPairs :: [(Integer, Integer)]

--Pascal háromszög: Állítsuk elő a Pascal-háromszöget: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],…].

--pascalTriangle :: [[Integer]]

-- Közelítsük az a négyzetgyökét az \x->(x+a/x)/2 függvénnyel.


