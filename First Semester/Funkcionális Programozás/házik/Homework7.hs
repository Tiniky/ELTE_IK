import Data.Char
import Data.List
import Data.Function

--Listák különbsége
listDiff :: Eq a => [a] -> [a] -> [a]
listDiff [] [] = []
listDiff [y] b
	| elem y b = []
	| otherwise = [y]
listDiff (x:xs) a
	| elem x a = listDiff xs a
	| otherwise = x: listDiff xs a

--Szólánc játék
validGame :: String -> Bool
validGame x
	| null(tail (words x)) == True = True
	| last (head (words x)) /= head (head (tail (words x))) = False
	| otherwise = True && validGame (tail x)


--Egyelemű listák
isSingleton :: [a] -> Bool
isSingleton [x] = True
isSingleton _ = False

countSingletons :: [[a]] -> Int
countSingletons [] = 0
countSingletons [[]] = 0
countSingletons x = sum [1|y<-x, isSingleton y]
	

--Paritás ellenőrzés
sameParity :: [Int] -> Bool
sameParity [] = True
sameParity [x] = True
sameParity (x:y:xs)
	| x `mod` 2 /= y `mod` 2 = False
	| otherwise = True && sameParity xs

--Leghosszabb egyező karakterlánc
longestChain :: String -> Int
longestChain [] = 0
longestChain [x] = 1
longestChain (x:xs) = sum[1|n <-(last(sortBy (compare `on` length)(group(x:xs))))]


--Szöveg normalizálás
abcZ = ['a'..'z'] ++ ['A'..'Z']

normalizeText :: String -> String
normalizeText [] = []
normalizeText x = map toUpper [y|y<-x, elem y abcZ]