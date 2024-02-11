import Data.Char
import Data.List
import Data.Maybe
import Data.Function

--Párok párja
splitQuadruple :: (a,b,c,d) -> ((a,b),(c,d))
splitQuadruple (x,y,a,b) = ((x,y),(a,b))

--Számok távolsága
dist1 :: Num a => a -> a -> a
dist1 x y = abs $ x-y

--Kroenecker-delta
kroeneckerDelta :: Eq a => a -> a -> Int
kroeneckerDelta x y
    | x == y = 1
    | otherwise = 0

--Előfordulások
freq :: Eq a => a -> [a] -> Int
freq x xs = sum[1| n<-xs, n==x]

--Nagybetű
hasUpperCase :: String -> Bool
hasUpperCase "" = False
hasUpperCase (x:xs)
    | not (isUpper x) = False || hasUpperCase xs
    | otherwise = True

--Azonosító
identifier :: String -> Bool
identifier "" = False
identifier xs
    | isLetter (head xs) && sum [1| n<-xs, isSpace n == True] == 0 = True
    | otherwise = False

--Csere
replace :: Int -> a -> [a] -> [a]
replace x y xs = (take x xs) ++ [y] ++ drop (x+1) xs

--Páros-páratlan
paripos :: [Int] -> Bool
paripos [] = True
paripos [x]
    | even x = True
    | otherwise = False
paripos (x:y:xs)
    | even x && odd y = True && paripos xs
    | otherwise = False

--Biztonságos osztás
safeDiv :: Int -> Int -> Maybe Int
safeDiv 0 _ = Just 0
safeDiv _ 0 = Nothing
safeDiv x y = Just $ floor (realToFrac x / realToFrac y)

{-
--Elválasztójelek
parseCSV :: String -> [String]
parseCSV "" = [""]
parseCSV xs = takeWhile (/=";") xs 
-}

--C Kombinátor
c :: (a -> b -> c) -> (b -> a -> c)
c f a b = b `f` a


--Kivéve, ha...
selectUnless :: (t -> Bool) -> (t -> Bool) -> [t] -> [t]
selectUnless f1 f2 xs = [n | n<-(filter f1 xs), map f2 [n] == [False]]

--W kombinátor
w :: (a -> a -> a) -> a -> a
w f x = x `f` x


--Iteratív alkalmazás
ntimes :: (a -> a -> a) -> a -> Int -> a
ntimes _ a 1 = a
ntimes f a x = a `f` ntimes f a (x-1)

--Binárisok I.
data Binary = On | Off
    deriving (Eq, Show)

switch :: Binary -> Binary
switch On = Off
switch _ = On

--Binárisok II.
bxor :: [Binary] -> [Binary] -> [Binary]
bxor [] [] = []
bxor [On] [On] = [On]
bxor [Off] [Off] = [On]
bxor [_] [_] = [Off]
bxor (x:xs) (y:ys)
    | x==y = [On] ++ bxor xs ys
    | otherwise = [Off] ++ bxor xs ys