--Folyó mellett (1 pont)
byDunaOrTisza :: String -> Bool
byDunaOrTisza x
    | take 4 x == "Duna" = True
    | take 5 x == "Tisza" = True
    | otherwise = False

--Duplák (1 pont)
howManyDoubles :: Eq a => [[a]] -> Int
howManyDoubles xs = sum [1 | n<-xs, head n == last n]

--Black Jack pontok (1 pont)
blackJackPoints :: Integral a => [a] -> Maybe a
blackJackPoints ls
    | length kiszurt == 0 && osszeg <= 21 = Just osszeg
    | otherwise = Nothing
    where
        kiszurt = filter (>11) ls
        osszeg = sum [n|n<-ls, not $ elem n kiszurt]

--Hárommal nem osztható elem (2 pont)
notDivisibleByThree:: Integral a => [a] -> Maybe Int
notDivisibleByThree [] = Nothing
notDivisibleByThree x
    | elem False $ oszthato = Just $ head [n+1 | n<-[0..], oszthato !! n == False]
    | otherwise = Nothing
    where
        oszthato = [mod n 3 == 0 | n<-x]

--Csoport (2 pont)
crowd :: Int -> String
crowd x
    | x <= 0 = ""
    | x == 1 = "(-_-)"
    | x == 2 = "(-_-)(-_-)"
    | mod x 2 == 1 = (concat $ replicate fele1 "(-_") ++ crowd 1 ++ (concat $ replicate fele1 "_-)")
    | mod x 2 == 0 = (concat $ replicate fele2 "(-_") ++ crowd 2 ++ (concat $ replicate fele2 "_-)")
    where
        fele1 = round $ ((fromIntegral x) - 1)/2
        fele2 = round $ ((fromIntegral x) - 2)/2

--Legalább n darab (2 pont)
atLeastNFrom :: Eq a => Int -> a -> [a] -> Bool
atLeastNFrom _ _ [] = True
atLeastNFrom x y ls
    | x <= 0 = True
    | not $ elem y ls = False
    | sum [1 | n<-ls, n == y] >= x = True
    | otherwise = False
--meghal végtelenre

--Feltételes leképezés (2 pont)
mapEither :: (a -> Bool) -> (a -> b) -> (a -> b) -> [a] -> [b]
mapEither feltetel f1 f2 xs = [if (map feltetel xs) !! i == True then f1 (xs!!i) else f2 (xs!!i) | i<-[0..(length xs)-1]]
--meghal végtelenre

--Bukások száma (2 pont)
--aaam wth

--Futamhossz kódolás (2 pont)
encode :: String -> String
encode "" = ""
encode (x:xs)
    | (length $ takeWhile (==x) (x:xs)) == 1 = [x] ++ encode xs
    | otherwise = [x] ++ (show $ length $ takeWhile (==x) (x:xs)) ++ encode (dropWhile (==x) (x:xs))

--Két lista összefésülése (2 pont)
--imagine

--Adattípusok definiálása (1 pont)
data Weather = Sunny | Cloudy | Rainy
    deriving (Show, Eq)

data Forecast = Prediction Weather Int
    deriving (Show, Eq)

--Nyaralási terv (3 pont)
summerVacation :: [Forecast] -> [Weather]
summerVacation (Prediction Sunny y) = [Sunny]
summerVacation (Prediction Cloudy y) = [Cloudy]
summerVacation ((Prediction x y):ls)
    | x /= Rainy = [x] ++ summerVacation ls
    | otherwise = []