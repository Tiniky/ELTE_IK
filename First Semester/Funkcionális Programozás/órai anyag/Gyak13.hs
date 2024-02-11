import Data.List

--Feladatsor/óravázlat a 12. gyakorlathoz

-- foldr_ (+) 0 [1,2,3] == 1 + (2 + (3 + (0)))
foldr_ :: (a -> b -> b) -> b -> [a] -> b
foldr_ f acc []     = acc 
foldr_ f acc (x:xs) = x `f` (foldr_ f acc xs)

-- foldl_ (+) 0 [1,2,3] == (((0) + 1) + 2) + 3 
foldl_ :: (b -> a -> b) -> b -> [a] -> b
foldl_ f acc []     = acc 
foldl_ f acc (x:xs) = foldl_ f (f acc x) xs

--Definiáld a sum-ot foldr/foldl segítségével!
sum' :: Num a => [a] -> a
--sum' xs = foldr (+) 0 xs
--sum' xs = foldr (\x acc -> acc + x) 0 xs
sum' xs = foldl (\x acc -> x + acc) 0 xs

--Definiáld az or-t a foldr/foldl segítségével!
or' :: [Bool] -> Bool
or' xs = foldr (||) False xs

--Definiáld az and-et a foldr/foldl segítségével!
and' :: [Bool] -> Bool
and' xs = foldr (&&) True xs

--Definiáld a concat-ot a foldr/foldl segítségével!
concat' :: [[a]] -> [a]
concat' xs = foldr (++) [] xs

--Definiáld a length-et a foldr/foldl segítségével!
length' :: [a] -> Int
length' xs = foldr (\_ acc -> acc +1) 0 xs

--Definiáld a head és last függvényeket a foldr és foldl segítségével! Üres lista esetén error legyen az eredmény. Melyiket mivel lehet?
last' :: [a] -> Int
last' xs = foldl (\_ x -> x) (error "empty list") xs

head' :: [a] -> Int
head' xs = foldr (\x _ -> x) xs

--Definiáld a maximum-ot a foldr/foldl segítségével!
maximum' :: Ord a => [a] -> a
maximum' [] = error "empty list"
maximum' (x:xs) = foldr max x xs

--Definiáld a map-et a foldr segítségével! (És foldl segítségével?)
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

--Definiálj egy beszúrásos rendezést a foldr segítségével! (Használd az insert-et egy elem rendezett listába való beszúrúsához)
isort :: Ord a => [a] -> [a] 
--isort xs = foldr insert [] xs
isort xs = foldl (flip insert) [] xs

-- Definiáld a (++) operátort a foldr segítségével!
--(+++) :: [a] -> [a] -> [a]

-- Definiáld a count függvényt foldr segítségével, amely megszámolja, hogy egy adott tulajdonsággal rendelkező elemből hány található egylistában!
--count :: (a -> Bool) -> [a] -> Int

reverse' :: [a] -> [a]
reverse' xs = rev [] xs where
    rev :: [a] -> [a] -> [a]
    rev done [] = done
    rev done (x:xs) = rev (x:done) xs


-- Definiáld a reverse-t a foldr vagy foldl segítségével!
reverseWithFoldl :: [a] -> [a]
reverseWithFoldl xs = foldl (\acc x -> x:acc) [] xs

--Definiáld az elem-et foldr segítségével!
--elem' :: Eq a => a -> [a] -> Bool

-- Definiáld az all függvényt foldr segítségével!
--all'' :: Eq a => [a] -> Bool