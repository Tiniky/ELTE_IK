--Van-e igaz elem
some :: [Bool] -> Bool
some [] = False
some (True:_) = True
some (_:xs) = some xs

--Részlista
sublist :: Int -> Int -> [b] -> [b]
sublist _ _ [] = []
sublist x y ls = take y (drop x ls)

--Jelszó
password :: [Char] -> [Char]
password [] = []
password ['x'] = ['*']
password x = take (length x) (repeat '*')

--Szótár
lookup' :: Eq a => a -> [(a, b)] -> b
lookup' x ((a,b):xs)
	| x == a = b
	| otherwise = lookup' x xs

--Bináris számok
toBin :: Integer -> [Int]
toBin 0 = []
toBin x
	| x `mod` 2 == 0 = [0] ++ toBin (x `div` 2)
	| otherwise = [1] ++ toBin (x `div` 2)