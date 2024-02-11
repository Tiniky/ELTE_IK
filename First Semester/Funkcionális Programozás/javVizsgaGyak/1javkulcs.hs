module Vizsga2 where
import Data.Char
import Data.List

squareSum :: Num a => (a, a) -> (a, a, a)
squareSum (a, b) = (a, b, a*a + b*b)

names :: [String] -> [String] -> [String]
names [] _ = []
names _ [] = []
names (x:xs) (y:ys) = (x ++ " " ++ y) : names xs ys 

triangleArea :: (Double, Double, Double) -> Maybe Double
triangleArea (x,y,z)
    | x + y > z && x + z > y && y + z > x &&
     (x * x + y * y) == z * z = Just (x * y / 2)
    | otherwise = Nothing

doubleIdxs:: Eq a  => [(a,a)] -> Maybe [Int]
doubleIdxs [] = Nothing
doubleIdxs l@(x:xs)
    | seged l 1 /= [] = Just (seged l 1) 
    | otherwise = Nothing 
 where
     seged [] n = []
     seged ((x,y):xs) n
        | x == y = n : seged xs (n + 1)
        | otherwise = seged xs (n + 1)

snakeToCamel :: String -> String
snakeToCamel "" = ""
snakeToCamel [x] = [x]
snakeToCamel (x:y:xs)
    | x == '_' = toUpper y : snakeToCamel xs
    | otherwise = x : snakeToCamel (y:xs)

removeExtremes :: Ord a => [a] -> [a]
removeExtremes [] = []
removeExtremes l@(x:xs) = seged l (minimum l) (maximum l)
 where
     seged [] _ _ = []
     seged (x:xs) min max
        | x == min || x == max = seged xs min max
        | otherwise = x : seged xs min max

replaceLastOcc :: Eq a => a {-mit-} -> a {-mire-} -> [a] -> Maybe [a]
replaceLastOcc _ _ [] = Nothing
replaceLastOcc a b l@(x:xs)
    | elem a l = Just $ reverse (seged a b (reverse l))
    | otherwise = Nothing
 where
     seged _ _ [] = []
     seged a b (x:xs)
        | x == a = b : xs
        | otherwise = x : seged a b xs

anagram :: String -> String -> Bool
anagram [] [] = True
anagram _ [] = False
anagram [] _ = False
anagram l1@(x:xs) l2@(y:ys)
    | elem x l2 = anagram (delete x l1) (delete x l2)
    | otherwise = False

sumWithLenghtN :: Num a => Int -> [[a]] -> a
sumWithLenghtN _ [] = 0
sumWithLenghtN n (x:xs)
    | seged n x = sum x + sumWithLenghtN n xs
    | otherwise = sumWithLenghtN n xs
     where
         seged 0 [] = True
         seged _ [] = False
         seged n (x:xs)
            | n <= 0 = False
            | otherwise = seged (n - 1) xs

isSteady :: Eq b => (a -> b) -> [a] -> Bool
isSteady _ [] = True
isSteady _ [x] = True
isSteady f (x:y:xs)
    | f x == f y = isSteady f (y:xs)
    | otherwise = False

data Parcell = P String Double Int
 deriving (Show, Eq)

deliveryFee :: Parcell -> Maybe Double
deliveryFee (P "Asgard" x y) = Just (100 * x)
deliveryFee (P "Midgard" x y) = Just (10 * x)
deliveryFee (P "Vanaheim" x y) = Just (80 * x)
deliveryFee (P "Alfheim" x y) = Just (50 * x)
deliveryFee _ = Nothing

delivery :: [Parcell] -> Double
delivery [] = 0
delivery (x:xs)
    | deliveryFee x /= Nothing = seged x + delivery xs
    | otherwise = delivery xs
     where
        seged (P "Asgard" a b) = 100 * a + fromIntegral b
        seged (P "Midgard" a b) = 10 * a + fromIntegral b
        seged (P "Vanaheim" a b) = 80 * a + fromIntegral b
        seged (P "Alfheim" a b) = 50 * a + fromIntegral b
-- az utolsó tesztesetnél .12870.599999999999 helyett .6

--inconsistencyInGrowing :: [[a]] -> Maybe (Int, Int)

--findAndReplace :: String {- miben -} -> String {- mit -} -> String {- mire -} -> String

shrinkText :: String -> String
shrinkText "" = ""
shrinkText l@(x:xs)
    | not $ elem ')' l = l
    | x == '(' = seged xs
    | otherwise = x : shrinkText xs
     where
         seged "" = ""
         seged (x:xs)
            | x == ')' = shrinkText xs
            | otherwise = seged xs
--az utolsó tesztesettel nem tud mit kezdeni

($) :: (a -> b) -> a -> b