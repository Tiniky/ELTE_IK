f1 :: Int -> Int
f1 x = 2^x

f2 :: Bool -> Bool -> Bool -> Bool
f2 True True False = True
f2 False True True = True
f2 True False True = True
f2 _ _ _ = False

f3 :: (a, b, c) -> (c, b, a)
f3 (a1, a2, a3) = (a3, a2, a1)

f4 :: [Int] -> Int
f4 [] = 0
f4 [x] = x
f4 (x:xs) = sum $ take 3 (x:xs)

f5 :: Ord a => [a] -> Bool
f5 [] = True
f5 [x] = True
f5 (x:y:xs)
    | x<y = True && f5 (y:xs)
    | otherwise = False

f6 :: [a] -> a
f6 xs = last $ init xs

f7 :: String -> String
f7 xs = 