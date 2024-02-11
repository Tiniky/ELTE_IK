import Data.List
import Data.Char
import Data.Function

--Rendezett összefésülés
sortMerge :: Ord a => [a] -> [a] -> [a]
sortMerge [] x = x
sortMerge x [] = x
sortMerge (x:xs) (y:ys) = sort (x : y : sortMerge xs ys)

--Túl sok szóköz
removeDuplicateSpaces :: String -> String
removeDuplicateSpaces x = unwords(words x)

--Különbségsorozat
differences :: Num a => [a] -> [a]
differences (x:xs) = zipWith(-)(xs)(x:xs)