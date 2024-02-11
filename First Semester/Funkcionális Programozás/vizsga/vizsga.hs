import Data.List

--Pozitív számok összege (1 pont)
posNumSum :: (Num a, Ord a) => (a, a, a) -> Maybe a
posNumSum (x,y,z)
    | x + y + z > 0 = Just $ x+y+z
    | otherwise = Nothing

--Szöveg díszítése (1 pont)
fancyText :: String -> String
fancyText ls = "~=:::" ++ ls ++ reverse "~=:::"

--Fejelemek (2 pont)
heads :: Eq a => [[a]] -> a -> [a]
heads [] _ = []
heads (x:xs) n
    | null x = n : heads xs n
    | otherwise = head x : heads xs n

--Indexosztó (2 pont)
maxDivisibleByIndex :: Integral a => [a] -> a
maxDivisibleByIndex xs = maximum [xs!!i| i<-[0..(length xs)-1], mod (fromIntegral (xs!!i)) (i+1) == 0]

--Váltakozó előjel (2 pont)
alternatingSignList :: (Ord a, Num a) => [a] -> [a]
alternatingSignList [] = []
alternatingSignList [x]
    | x >= 0 = [x]
    | otherwise = [-x]
alternatingSignList (x:y:xs)
    | x >= 0 && y < 0 = x : y :alternatingSignList xs
    | x < 0 && y >= 0 = -x : -y : alternatingSignList xs
    | x < 0 && y < 0 = -x : y : alternatingSignList xs
    | otherwise = x : -y :alternatingSignList xs

{-Szomszédos elemek kapcsolata (2 pont)
checkRelationBy :: (a -> a -> Bool) -> [a] -> Maybe (Int, Int)
checkRelationBy _ [] = Nothing
checkRelationBy _ [x] = Nothing
checkRelationBy f (x:y:xs)
    | (teszt f (x:y:xs)) == True = Nothing
    | otherwise = Just $ keres
    where
        teszt f (x:y:xs)
            | f x y == True = True && teszt xs
            | otherwise = False
        keres = (indexX, indexY)
            where 
                indexX = head [i | i<-[0..(length xs)-1], xs!!i == keresX f (x:y:xs)]
                indexY = head [i | i<-[0..(length xs)-1], xs!!i == keresY f (x:y:xs)]
                    where
                        keresX f (x:y:xs)
                            | f x y == False = x
                            | otherwise = keresX f (x:y:xs)
                        keresY f (x:y:xs)
                            | f x y == False = y
                            | otherwise = keresY f (x:y:xs)
-}

--Fiatalos mondat (2 pont)
isZoomerSentence :: String -> Bool
isZoomerSentence ls 
    | keres "lol" (words ls) || keres "uwu" (words ls) || keres "rawr" (words ls) || keres "xd" (words ls) = True
    | otherwise = False
    where
        keres _ [] = False
        keres n (x:xs)
            | x == n = True
            | otherwise = keres n xs

--Monoton növekvő részsorozat (2 pont)


--Mondat kiegészítése (2 pont)
insertWord :: String -> Int -> String -> String
insertWord xs _ "" = xs 
insertWord xs n ls
    | n <= 0 = xs ++ " " ++ ls
    | n >= length xs = ls ++ " " ++ xs
    | otherwise = (head $ words ls) ++ " " ++insertWord xs (n-1) (unwords . tail $ words ls)

--Listák válogatása (2 pont)
getSatisfying :: (a -> Bool) -> [[a]] -> [[a]]
getSatisfying _ [] = []
getSatisfying f (x:xs)
    | null (teszt f x) = getSatisfying f xs
    | otherwise = teszt f x : getSatisfying f xs
    where
        teszt f ls = [ x | x <-ls, f x]

getSatisfying (<3) [[1,2,4],[2,5,6][8,9]] = [[1,2],[2]]

{--Páros-páratlan indexek (2 pont)
parityIndex :: Integral a => [a] -> [(Int, a)]
parityIndex [] = []
parityIndex [x] = [(1, x)]
parityIndex ls@(x:xs)
    | elem x paros = (psIndex, x) : parityIndex xs
    | elem x paratlan = (ptlIndex, x) : parityIndex xs
    where
        paros = [n| n<-ls, even n]
        paratlan = [n | n<-ls, odd n]
        parosIndex = [1..length paros]
        paratlanIndex = [1..length paratlan]
        psIndex = head paros
        ptlIndex = head paratlan
        paratlan = drop 1 paratlan
        paros = drop 1 paros
-}

--Adattípus definiálása (1 pont)
data Result = Error String | Ok Integer
    deriving (Show, Eq)

"asd" ++ show 7 = "asd7"

--Jó eredmények szűrése (1 pont)
filterOk :: [Result] -> [Result]
filterOk [] = []
filterOk ((Ok n):xs) = (Ok n) : filterOk xs
filterOk ((Error _):xs) = filterOk xs

--Eredmények összesítése (2 pont)
sumResult :: [Result] -> Maybe Integer
sumResult [] = Nothing
sumResult ls@(x:xs)
    | filterOk ls == [] = Nothing
    | otherwise = Just . osszeg $ filterOk ls
    where
        osszeg :: Num a => [Result] -> a
        osszeg [] = 0
        osszeg [(Ok n)] = n
        osszeg ((Ok n):xs) = n + osszeg xs

{--Számlánc (3 pont)
getsTo1 :: Int -> Int
getsTo1 x = sum [lanc n |n<-[1..x]]
    where
        lanc n
            | szamok n == True = 1
            | otherwise = szamok szam
            where
                szam = (tizes n)^2 + (egyes n)^2
                szamok szam
                    | szam == 1 || szam == 89 = True
                    | otherwise = False
                    where
                        tizes n = div n 10
                        egyes n = mod n 10
-}

--Részsorozatok egyforma indexösszeggel (összesen 3 pont)
