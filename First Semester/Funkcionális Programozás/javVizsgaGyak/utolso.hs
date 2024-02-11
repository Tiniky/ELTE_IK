import Data.Maybe
import Data.List
import Data.Char

isTriangularNumber :: Integral a => a -> Bool
isTriangularNumber x
    | x <= 0 = False
    | elem x szamok = True
    | otherwise = False
    where szamok = [sum [1..n]| n<-[1..x]] 

camelToSnake :: String -> String
camelToSnake "" = ""
camelToSnake (x:xs)
    | isUpper x = '_' : toLower x : camelToSnake xs
    | otherwise = x : camelToSnake xs

sumMaybe :: Num a => [Maybe a] -> a
sumMaybe [] = 0
sumMaybe (x:xs)
    | isJust x = abs $ fromJust x + sumMaybe xs
    | otherwise = 0 + sumMaybe xs

threeDivs :: Integral a => (a,a) -> (a,a) -> (a,a) -> Maybe a
threeDivs (a,b) (x,y) (m,n)
    | b == 0 || y == 0 || n == 0 = Nothing
    | otherwise = Just $ (div a b) + (div x y) + (div m n)

howManyDifferences :: Eq a => [(a,a)] -> Int
howManyDifferences [] = 0
howManyDifferences (x:xs)
    | fst x == snd x = 0 + howManyDifferences xs
    | otherwise = 1 + howManyDifferences xs

getDigitsFromCode :: String -> String
getDigitsFromCode xs = [n| n<-xs, isDigit n]

type RegNum = String
type Level = Int
type SpotNum = Int

data Status = Free | Occupied RegNum
    deriving (Show, Eq)

data ParkingSpace = PS Level SpotNum Status
    deriving (Show, Eq)

type ParkingLot = [ParkingSpace]

freeSpaces :: ParkingLot -> Int -> Int
freeSpaces [] _ = 0
freeSpaces ((PS x y z):ls) n
    | x == n && z == Free = 1 + freeSpaces ls n
    | otherwise = 0 + freeSpaces ls n

applyIfIncreases :: Ord a => (a -> a) -> [a] -> [a]
applyIfIncreases _ [] = []
applyIfIncreases f (x:xs)
    | f x > x = f x : applyIfIncreases f xs
    | otherwise = x : applyIfIncreases f xs

elemFreqByFirstOcc :: Eq a => [a] -> [(a, Int)]
elemFreqByFirstOcc [] = []
elemFreqByFirstOcc (x:xs) = [(n, sum[1|m<-(x:xs), m==n]) | n<-egyedi (x:xs)]
    where
        egyedi [] = []
        egyedi (x:xs) = x : egyedi (filter ((/=) x) xs)
        