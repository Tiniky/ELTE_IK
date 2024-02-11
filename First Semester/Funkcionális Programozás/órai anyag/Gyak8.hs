--Feladatsor/óravázlat a 8. gyakorlathoz

--Ismétlés

--Definiálj egy függvényt, amely egy számpárokat tartalmazó listából előállít egy olyan listát, amely a számpárok összegeit tartalmazza!
sumPairs :: Num a => [(a,a)] -> [a]
sumPairs xs = map addPair xs
    where
	    addPair (x,y) = x+y

-- Számoljuk meg egy adott tulajdonságú elem előfordulásait egy listában!
filterCount :: (a -> Bool) -> [a] -> Int
filterCount _ [] = 0
filterCount a (x:xs)
    | a x = 1 + filterCount a xs
    | otherwise = filterCount a xs
	
-- Definiáljuk újra a takeWhile' függvényt!
--takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' f (x:xs)
    | f x = x : takeWhile' f xs
	| otherwise = []
    
-- Definiáljuk egy `dropSpaces` függvényt, amely eldobja a szóközöket egy szöveg elejéről! 
dropSpaces :: String -> String
dropSpaces xs = dropWhile (==' ') xs

-- szoköz eldobása előlről és hátulról is
trim :: String -> String
trim xs = (reverse . dropSpaces . reverse . dropSpaces) xs

trim' :: String -> String
trim' xs = reverse $ dropSpaces $ reverse $ dropSpaces xs

-- Definiáljuk újra a zipWith' függvényt!
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ _ [] = []
zipWith' _ [] _ = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- Definiáljuk újra a zip függvényt a zipWith segítségével!
zip' :: [a] -> [b] -> [(a,b)]
zip _ [] = []
zip [] _ = []
zip (x:xs) (y:ys) = (x,y) : zip xs ys 

-- Definiáljuk újra az iterate függvényt!
iterate' :: (a -> a) -> a -> [a]
iterate f n = n : iterate f (f n)

-- Definiáljunk függvényt, amely előállíja a következő végtelen sorozatot: [1,-1,1,-1,1,-1 .. ]
--(Tipp: használjuk az előbb definiált iterate függvényt!)
funIterate1 = take 10 $ iterate negate 1

-- Definiáljunk függvényt, amely előállíja a következő végtelen sorozatot: [1,-2,3,-4,5,-6,7,-8,9,-10 .. ]
-- o.o no thanks

-- Függvényalkalmazás operátor ($)
-- http://lambda.inf.elte.hu/Higherorder.xml#feladat-a-doll%C3%A1r-oper%C3%A1tor

calcExample = abs ((+6) (negate (sqrt 100)))
calcExample' = abs $ (+6) $ negate $ sqrt 100

-- Függvénykompozíció operátor (.)
calcExample'' = (abs . (+6) . negate . sqrt) 100