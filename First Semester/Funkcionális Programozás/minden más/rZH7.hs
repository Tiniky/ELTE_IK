sumPairs :: Num a => [(a,a)] -> [a]
sumPairs [] = []
sumPairs (x:xs) = fst x + snd x : sumPairs xs