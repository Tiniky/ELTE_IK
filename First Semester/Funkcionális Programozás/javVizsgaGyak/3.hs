import Data.List
import Data.Maybe

--Mozgóátlag
movingAvg :: Int -> [Double] -> [Maybe Double]
movingAvg _ [] = []
movingAvg x xs
    | x <= 0 = []
    | otherwise = [kiszur $ (sum $ drop ((n-1)*x) $ take (n*x) xs) / fromIntegral x | n<-[1..length xs]]
    where
        kiszur y
            | y /= 0 = Just y
            | otherwise = Nothing


--Lista átalakítás
--dropOrInsert :: Eq a => [a] -> [a] -> [a]
--dropOrInsert xs ys = [if elem n xs then delete n ys else xs ++ [n]| n<-ys]


--Kiértékelés
--eval :: String -> Integer
--eval "" = 0
--eval xs = []

--Háromszögszámok
isTriangularNumber :: Integral a => a -> Bool
isTriangularNumber x = elem x triangularNumbers
    where
        triangularNumbers = [sum [1..n]| n<-[1..x]]

{--Legkisebb lista
smallestIntSize :: [a] -> [b] -> [c] -> Maybe Int
smallestIntSize [] [] [] = Nothing
smallestIntSize (x:xs) (y:ys) (z:zs)
    | egyenlo = Nothing
    | legkisebb == (x:xs) = Just 1
    | legkisebb == (y:ys) = Just 2
    | legkisebb == (z:zs) = Just 3
    | otherwise = Nothing
    where
        egyenlo 
-}

{--Szavak tükrözése
reverseWords :: Integral a => String -> [a] -> String
reverseWords "" _ = ""
reverseWords xs (y:ys)
    | indexek
-}

type RegNum = String
type Level = Int
type SpotNum = Int

data Status = Free | Occupied RegNum
    deriving (Eq, Show)

data ParkingSpace = PS Level SpotNum Status
    deriving (Eq, Show)

type ParkingLot = [ParkingSpace]

--Sazabad helyek
freeSpaces :: ParkingLot -> Int -> Int
freeSpaces [] _ = 0
freeSpaces ((PS x y s):xs) n = [1 | a<-((PS x y s):xs), (a !! 3) == Free && (a !! 1)==n]