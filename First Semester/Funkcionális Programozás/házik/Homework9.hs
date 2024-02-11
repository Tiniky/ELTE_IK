----3D Vektor
data Vector3 = V Int Int Int
    deriving (Eq, Show)

--Komponensek összege
componentSum :: Vector3 -> Int
componentSum (V x y z) = x+y+z

--Vektorális szorzat
crossProduct :: Vector3 -> Vector3 -> Vector3
crossProduct (V x y z) (V x2 y2 z2) = V (y*z2-y2*z) (x2*z-x*z2) (x*y2-y*x2)

--Vektor-lista összegzés
vectorListSum :: [Vector3] -> Vector3
vectorListSum [] = V 0 0 0
vectorListSum [x] = x
vectorListSum (V x y z:xs) = V (x + sum[getX a| a <-xs]) (y + sum[getY b| b <-xs]) (z + sum[getZ c| c <-xs])

getX :: Vector3 -> Int
getX (V x y z) = x

getY :: Vector3 -> Int
getY (V x y z) = y

getZ :: Vector3 -> Int
getZ (V x y z) = z

----Háttértár
data Storage
    = HDD String Int Int
    | SSD String Int
    deriving (Eq, Show)

--Kapacitás
capacity :: Storage -> Int
capacity (HDD _ _ x) = x
capacity (SSD _ x) = x

--HDD vagy SSD
isHDD :: Storage -> Bool
isHDD (HDD x _ _) = True
isHDD (SSD _ _) = False

--Legnagyobbnál is nagyobbak
hugeHDDs :: [Storage] -> [Storage]
hugeHDDs [] = []
hugeHDDs (x:xs) = [n | n <- x:xs, isHDD n && capacity n >  maximum [capacity m | m <- x:xs, not(isHDD m)]]