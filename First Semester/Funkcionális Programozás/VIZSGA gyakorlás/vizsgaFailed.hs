import Data.List
import Data.Char
import Data.Maybe
import Data.Function

--Rendezett hármas fordítása
revTup :: (a, b, c) -> (c, b, a)
revTup (x, y, z) = (z, y, x)

--Melyik listában van az elem
which :: ([Char], [Char], [Char]) -> Char -> Maybe Int
which (xs, ys, ls) x
    | elem x xs = Just 1
    | elem x ys = Just 2
    | elem x ls = Just 3
    | otherwise = Nothing

--Első három elem összege
sumFirstThree :: Num a => [a] -> Maybe a
sumFirstThree xs
    | length (take 3 xs) /= 3 = Nothing
    | otherwise = Just $ sum $ take 3 xs

--Redukció
mirrorReduction :: [Char] -> [Char]
mirrorReduction "" = ""
mirrorReduction "x" = "x"
mirrorReduction xs
    | head xs == last xs = mirrorReduction (tail $ init xs)
    | otherwise = xs


--Titkosítás
encodeText :: String -> String
encodeText "" = ""
encodeText (x:xs)
    | elem x ['a','b'..'z'] = ['z','y'..'a'] !! head [i | i<-[0..(length ['a','b'..'z'])-1], ['a','b'..'z']!!i == x] : encodeText xs
    | otherwise = x : encodeText xs

--Páratlan és páros számok összegei
sumOddEven :: [Integer] -> (Integer, Integer)
sumOddEven xs = (sum[n| n<-xs, even $ fromInteger n], sum[m| m<-xs, odd $ fromInteger m])


--Szelektív alaklmazás
selectiveApply :: (a -> a) -> (a -> Bool) -> [a] -> [a]
selectiveApply _ _ [] = [] 
selectiveApply f g xs = [if g n then f n else n | n<-xs]

--Lista összefésülés
mergeTwoToOne :: [a] -> [a] -> [a]
mergeTwoToOne [] [] = []
mergeTwoToOne [x] [y] = [x] ++ [y] 
mergeTwoToOne xs [] = xs
mergeTwoToOne [] ys = ys
mergeTwoToOne (x:y:xs) (l:ls) = x : y : l : mergeTwoToOne xs ls 


--Egyenletes eloszlás
isUniform :: Eq b => (a -> b) -> [a] -> Bool
isUniform f xs = map f (take 100 xs) == [n| n<-(map f (take 100 xs)), n==head(map f (take 100 xs))]

--Faktoriális karakterlánc
fact :: Integer -> Integer
fact 0 = 1
fact 1 = 1
fact x = x * fact (x-1)

stringFact :: [(Char, Integer)] -> String
stringFact [] = []
--stringFact [(x,y)] = replicate (fromIntegral $ fact y) x
stringFact ((x,y):xs) = replicate (fromIntegral $ fact y) x ++ stringFact xs

--Haiku
maganh = ['a','á','e','é','i','í','o','ó','ö','ő','u','ú','ü','ű','A','Á','E','É','I','Í','O','Ó','Ö','Ő','U','Ú','Ü','Ű']
isHaiku :: String -> Bool
isHaiku "" = False
isHaiku xs = length (lines xs) == 3 && length [n|n <-lines xs !! 0, elem n maganh] == 5 && length [n|n <-lines xs !! 1, elem n maganh] == 7 && length [n|n <-lines xs !! 2, elem n maganh] == 5

--Időjárás
data Weather = Sunny | Cloudy | Rainy Int | Snowy Int
    deriving (Show, Eq)

--Legnagyobb eső
rainyDays :: [Weather] -> Int
rainyDays [] = 0
rainyDays xs = length [n | n <- xs, x<-[5..20], n == Rainy x]

--Hóesés
mostSnow :: [Weather] -> Maybe Int
mostSnow [] = Nothing
mostSnow xs
    | elem (Snowy 10) xs = Just $ last [i | i<-[0..(length xs)-1], xs!!i == Snowy 10] + 1
    | otherwise = Nothing

{--Lista elforgatása
rotations :: [a] -> [[a]]
rotations "" = []
rotations [x] == [[x]]
rotations xs = xs : rotations () 
-}

{--Egyszerű mozgóátlag
sma :: Int -> [Double] -> [Double]
sma _ [] = []
sma x xs
    | x <= 0 = []
    | x == 1 = xs
    | otherwise = (sum $ take x xs)/x : sma x (tail xs)-}