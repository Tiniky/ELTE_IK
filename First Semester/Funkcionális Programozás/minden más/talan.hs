fromBin :: [Int] -> Integer
fromBin = foldr (\ (n,x) y -> y + (2^n * (fromIntegral x))) 0 . zip [0..]

polinom :: Num a => [a] -> a -> a
polinom xs n = sum (map (\(x,y) -> x*n^y)(zip xs [0..]))

factorials :: Integer -> [Integer]
factorials 0 = []
factorials x = [product [1..n] | n<-[1..x]]