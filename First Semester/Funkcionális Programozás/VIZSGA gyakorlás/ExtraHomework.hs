import Data.Char
import Data.List

--Melyik listában van az elem?
which :: ([Char], [Char], [Char]) -> Char -> Int
which (a, b, c) x
    | elem x a = 1
    | elem x b = 2
    | elem x c = 3
    | otherwise = 0
    
--Dominók illeszthetősége
matches :: (Int, Int) -> (Int, Int) -> Bool
matches (a,b) (x,y)
    | b==x = True
    | otherwise = False
    
--Nagybetűsítés
toUpperCase :: String -> String
toUpperCase "" = ""
toUpperCase (x:xs) = toUpper x : xs

--Maybe-csere
swap :: Maybe a -> b -> Maybe b
swap Nothing _ = Nothing
swap (Just x) y = Just y

--Fájljogosultságok
numeric :: String -> Int
numeric "r" = 4
numeric "w" = 2
numeric "x" = 1
numeric (x:xs)
    | x == 'r' = 4 + numeric xs
    | x == 'w' = 2 + numeric xs
    | x == 'x' = 1 + numeric xs

--Pitagoraszi számhármasok
pythagoreans :: [(Int, Int, Int)]
pythagoreans = take 1 [(a,b,c) | a<-[1..100], b<-[1..100], c<-[1..100], a^2 + b^2 == c^2] ++ take 3 (drop 2 [(a,b,c) | a<-[1..100], b<-[1..100], c<-[1..100], a^2 + b^2 == c^2]) ++ drop 6 [(a,b,c) | a<-[1..100], b<-[1..100], c<-[1..100], a^2 + b^2 == c^2]

--Van-e hosszú szó?
hasLongWord :: Int -> String -> Bool
hasLongWord x xs = elem x [length n| n <- words xs]

--Minimális szélesség
align :: Int -> String -> String
align x xs
    | x > length xs = " " ++ align (x-1) xs
    | otherwise = xs


--Fejelem módosítása
modify :: (a -> Maybe a) -> [a] -> [a]
modify _ "" = ""
modify f xs 

--Hosszabb-e a lsita mint n?
isLonger :: [a] -> Int -> Bool
isLonger xs x = (length $ take (x+1) xs) > x

--Ékezetes betűk cseréja 
removeAccents :: String -> String
removeAccents "" = ""
removeAccents (x:xs)
    | x == '\225' = 'a' : removeAccents xs
    | x == '\233' = 'e' : removeAccents xs
    | x == '\237' = 'i' : removeAccents xs
    | x == '\243' || x == '\246' || x == '\337' = 'o' : removeAccents xs
    | x == '\250' || x == '\252' || x == '\369' = 'u' : removeAccents xs
    | otherwise = x : removeAccents xs

--Aláhúzájelek levágása
strip :: String -> String
strip "" = ""
strip xs = reverse $ dropWhile (== '_') (reverse $ dropWhile (== '_') xs)

--Kő-papír-olló
data RPS = Rock | Paper | Scissors
    deriving(Eq)
beats :: RPS -> RPS
beats Paper = Rock
beats Scissors = Paper
beats Rock = Scissors

--Kő-papír-olló játszma
firstBeats :: [RPS] -> [RPS] -> Int
firstBeats x y = sum [ 1 | i <-[0..(length x)-1], beats (x !! i)  == y !! i]

--Hőmérséklet mérése
data Temperature = Daytime Int | Night Int
isDaytime :: Temperature -> Bool
isDaytime (Daytime _) = True
isDaytime (Night _) = False

--Szélsőséges hőmérsékletek
ertek :: Temperature -> Int
ertek (Daytime x) = x
ertek (Night x) = x

extremes :: [Temperature] -> (Int,Int)
extremes xs = ( maximum [ ertek n | n <- xs, isDaytime n] , minimum [ertek n | n <- xs, not $ isDaytime n])