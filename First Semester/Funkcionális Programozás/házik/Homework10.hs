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