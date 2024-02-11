import Data.Maybe

--Időpontok reprezentálása
data Time = T Int Int deriving Show

--Szöveggé alakítás
showTime :: Time -> String
showTime (T x y) = show x ++ "." ++ show y

--Egyenlőségvizsgálat
eqTime :: Time -> Time -> Bool
eqTime (T x y) (T a b) = a==x && y==b

--Korábbi időpont
isEarlier :: Time -> Time -> Bool
isEarlier (T x y) (T a b)
    | x < a = True
    | x==a && y<b = True
    | otherwise = False

--Két időpont között
isBetween :: Time -> Time -> Time -> Bool
isBetween (T x y) (T a b) (T n m)
    | isEarlier (T x y) (T a b) && isEarlier (T a b) (T n m) = True
    | isEarlier (T n m) (T a b) && isEarlier (T a b) (T x y) = True
    | otherwise = False

--Legkésőbbi időpont
latest :: [Time] -> Maybe Time
latest [] = Nothing
latest [x] = Just x
latest (x:y:xs)
    | isEarlier y x = latest (x:xs)
    | otherwise  = latest (y:xs)
	
--US Time
data USTime = AM Int Int | PM Int Int deriving (Eq, Show)

--USTime szöveggé
showUSTime :: USTime -> String
showUSTime (AM x y) = show x ++ "." ++ show y ++ " am"
showUSTime (PM x y) = show x ++ "." ++ show y ++ " pm"

--USTime átalakítása Time-ra
usTimeToTime :: USTime -> Time
usTimeToTime (AM x y)
    | x == 12 = (T 00 y)
	| otherwise = (T x y)
usTimeToTime (PM x y)
    | x == 12 = (T x y)
	| otherwise = (T (x+12) y)
	
--Time átalakítása USTime-ra 
timeToUSTime :: Time -> USTime
timeToUSTime (T x y)
    | x == 00 = (AM (x+12) y)
    | x < 12 = (AM x y)
	| x == 12 = (PM x y)
	|otherwise = (PM (x-12) y)