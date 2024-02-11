import Data.List

filterFilter :: (a->Bool) -> ([[a]] -> [[a]])
filterFilter _ [] = []
filterFilter f (x:xs) = filter f x : filterFilter f xs

iterateUntil :: (a -> Bool) -> (a -> a) -> a -> [a]
iterateUntil f g x
    | not $ f $ g x = x : iterateUntil f g (g x)
    | otherwise = [x]

--last $ [take n (iterate g x) | n<-[1..100], not $ f (last $ take n (iterate g x))]

elemsGreaterThanIndex :: [Int] -> [Int]
elemsGreaterThanIndex xs = [xs !! m | m <-[0..(length xs)-1], (> m) $ xs !! m-1] 