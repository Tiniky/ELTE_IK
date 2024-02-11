import Data.List
import Data.Char

--1)Rendezett hármas fordítása (1 pont)
revTup :: (a, b, c) -> (c, b, a)
revTup (x, y, z) = (z, y, x)

--2)Melyik listában van az elem (1 pont)
which :: ([Char], [Char], [Char]) -> Char -> Maybe Int
which (xs, ys, ls) x
    | elem x xs = Just 1
    | elem x ys = Just 2
    | elem x ls = Just 3
    | otherwise = Nothing

--3)Első három elem összege (1 pont)
sumFirstThree :: Num a => [a] -> Maybe a
sumFirstThree xs
    | length (take 3 xs) /= 3 = Nothing
    | otherwise = Just $ sum $ take 3 xs

--4)Redukció (2 pont)
mirrorReduction :: [Char] -> [Char]
mirrorReduction "" = ""
mirrorReduction "x" = "x"
mirrorReduction xs
    | length xs > 1 && head xs == last xs = mirrorReduction (tail $ init xs)
    | otherwise = xs

--5)Titkosítás (2 pont)
encodeText :: String -> String
encodeText "" = ""
encodeText (x:xs)
    | elem x ['a','b'..'z'] = ['z','y'..'a'] !! head [i | i<-[0..(length ['a','b'..'z'])-1], ['a','b'..'z']!!i == x] : encodeText xs
    | otherwise = x : encodeText xs

--6)Páratlan és páros számok összegei (2 pont)
sumOddEven :: [Integer] -> (Integer, Integer)
sumOddEven xs = (sum[n| n<-xs, odd n], sum[m| m<-xs, even m])

--7)Szelektív alaklmazás (2 pont)
selectiveApply :: (a -> a) -> (a -> Bool) -> [a] -> [a]
selectiveApply _ _ [] = [] 
selectiveApply f g (x:xs)
    | g x = f x : selectiveApply f g xs
    | otherwise = x : selectiveApply f g xs

--8)Lista összefésülés (2 pont)
mergeTwoToOne :: [a] -> [a] -> [a]
mergeTwoToOne [] [] = []
mergeTwoToOne xs ls
    | length xs > 1 && (not $ null ls) = head xs : (last $ take 2 xs) : head ls : mergeTwoToOne (drop 2 xs) (tail ls)
    | length xs > 1 && null ls = xs
    | length xs == 1 && (not $ null ls) = head xs : head ls : mergeTwoToOne (tail xs) (tail ls)
    | null xs && (not $ null ls) = ls
--meghal a végtelenlistákra

--9)Egyenletes eloszlás (2 pont)
isUniform :: Eq b => (a -> b) -> [a] -> Bool
isUniform f xs = map f  xs == [n| n<-(map f xs), n==head(map f xs)]
--meghal a végtelenlistákra

--10)Faktoriális karakterlánc (2 pont)
fact :: Integer -> Integer
fact 0 = 1
fact 1 = 1
fact x = x * fact (x-1)

stringFact :: [(Char, Integer)] -> String
stringFact [] = []
stringFact ((x,y):xs) = replicate (fromIntegral $ fact y) x ++ stringFact xs
--meghal a végtelenlistákra ÉS ha y 20nál nagyobb

--11)Haiku (3 pont)
maganh = ['a','á','e','é','i','í','o','ó','ö','ő','u','ú','ü','ű','A','Á','E','É','I','Í','O','Ó','Ö','Ő','U','Ú','Ü','Ű']
isHaiku :: String -> Bool
isHaiku "" = False
isHaiku xs = length (lines xs) == 3 && length [n|n <-lines xs !! 0, elem n maganh] == 5 && length [n|n <-lines xs !! 1, elem n maganh] == 7 && length [n|n <-lines xs !! 2, elem n maganh] == 5

--12)Időjárás (1 pont)
data Weather = Sunny | Cloudy | Rainy Int | Snowy Int
    deriving (Show, Eq)

--13)Legnagyobb eső (1 pont)
getXeso :: Weather -> Int
getXeso (Rainy x) = x
getXeso _ = -1

rainyDays :: [Weather] -> Int
rainyDays [] = 0
rainyDays xs = length $ filter (>=5) [getXeso n | n <- xs]

--14)Hóesés (2 pont)
getXho :: Weather -> Int
getXho (Snowy x) = x
getXho _ = -1

mostSnow :: [Weather] -> Maybe Int
mostSnow [] = Nothing
mostSnow xs
    | maximum [getXho n | n <- xs] == -1 = Nothing
    | otherwise = Just $ last [i+1| i<-[0..((length xs) -1)], (getXho $ xs !! i) == (maximum [getXho n | n <- xs])]

{--15)Lista elforgatása (3 pont)
rotations :: [a] -> [[a]]
rotations "" = []
rotations [x] == [[x]]
rotations xs =
-}

{--16)Egyszerű mozgóátlag (3 pont)
sma :: Int -> [Double] -> [Double]
sma _ [] = []
sma x xs
    | x <= 0 = []
    | x == 1 = xs
    | otherwise = (sum $ take x xs)/x : sma x (tail xs)-}
