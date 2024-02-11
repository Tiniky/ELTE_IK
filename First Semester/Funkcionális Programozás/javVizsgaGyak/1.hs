import Data.Char
import Data.List

--Két szám négyzetösszege (1 pont)
squareSum :: Num a => (a, a) -> (a, a, a)
squareSum (x, y) = (x, y, x^2+y^2)

--Teljes nevek (1 pont)
names :: [String] -> [String] -> [String]
names [] _ = []
names _ [] = []
names (x:xs) (y:ys) = (x ++ " " ++ y) : names xs ys

--Megszerkeszthető derékszögű háromszög területe (1 pont)
triangleArea :: (Double, Double, Double) -> Maybe Double
triangleArea (x, y, z)
    | x > 0 && y > 0 && z > 0 && x+y>z && y+z>x && z+x>y = terulet
    | otherwise = Nothing
 where 
     terulet
        | x^2 == y^2 + z^2 = Just $ y*z/2
        | y^2 == x^2 + z^2 = Just $ x*z/2
        | z^2 == y^2 + x^2 = Just $ x*y/2
        | otherwise = Nothing
        
--Megegyező elemek (2 pont)
--doubleIdxs :: Eq a  => [(a,a)] -> Maybe [Int]
--o.o

--Snake case (2 pont)
snakeToCamel :: String -> String
snakeToCamel "" = ""
snakeToCamel [x] = [x]
snakeToCamel (x:y:xs)
    | x /= '_' = x : snakeToCamel (y:xs)
    | otherwise = toUpper y : snakeToCamel xs
    
--Legkisebb és legnagyobb értékek eltávolítása (2 pont)
removeExtremes :: Ord a => [a] -> [a]
removeExtremes [] = []
removeExtremes xs = [n | n<-xs, n/=mAx && n/=mIn]
    where
    mAx = maximum xs
    mIn = minimum xs

--Utolsó előfordulás lecserélése (2 pont)
replaceLastOcc :: Eq a => a {-mit-} -> a {-mire-} -> [a] -> Maybe [a]
replaceLastOcc _ _ [] = Nothing
replaceLastOcc x y ls
    | elem x ls = Just $ reverse ( vanbenne x y (reverse ls))
    |otherwise = Nothing
 where
     vanbenne x y (l:ls)
        | l == x = y : ls
        | otherwise = l : vanbenne x y ls

--Anagramma (2 pont)
anagram :: String -> String -> Bool
anagram [] [] = True
anagram [] _ = False
anagram _ [] = False
anagram xs ys
    | elem (head xs) ys = anagram (tail xs) (delete (head xs) ys)
    | otherwise = False

--Adott hosszú listák összege (2 pont)
sumWithLenghtN :: Num a => Int -> [[a]] -> a
sumWithLenghtN 0 _ = 0
sumWithLenghtN x xs
    | x<0 = 0
    | otherwise = sum [ sum n | n<-xs, length (take (x+1) n) == x]

--Azonos érték (2 pont)
isSteady :: Eq b => (a -> b) -> [a] -> Bool
isSteady _ [] = True
isSteady f xs
    | elem False $ [ x == m | m <-[f n | n<-xs]] = False
    | otherwise = True
 where x = head [f n | n<-xs]

--Adattípus definiálása (1 pont)

type Cim = String
type Suly = Double
type Utanvet = Int

data Parcell = P Cim Suly Utanvet
    deriving (Eq, Show)

--Szállítási költség (1 pont)
deliveryFee :: Parcell -> Maybe Double
deliveryFee (P x y _)
    | x == "Asgard" = Just $ y*100
    | x == "Midgard" = Just $ y*10
    | x == "Vanaheim" = Just $ y*80
    | x == "Alfheim" = Just $ y*50
    | otherwise = Nothing

--Futár bevétele (2 pont)
maybeToDouble :: Maybe Double -> Double
maybeToDouble (Just x) = x

delivery :: [Parcell] -> Double
delivery [] = 0
delivery ((P x y z):xs)
    | deliveryFee (P x y z) == Nothing = 0 + delivery xs
    | otherwise = (maybeToDouble $ deliveryFee (P x y z))+ fromIntegral z + delivery xs 

--Zárójelben lévő szöveg kihagyása (3 pont)
shrinkText :: String -> String
shrinkText "" = ""
shrinkText (x:xs)
    | veg > 0 && kezd >= veg  = vegigmegy
    | otherwise = (x:xs)
    where 
        kezd = sum [1 | n<-(x:xs), n == '(']
        veg = sum [1 | n<-(x:xs), n == ')']
        vegigmegy (x:xs)
            |