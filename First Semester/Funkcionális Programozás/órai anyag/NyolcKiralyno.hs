queens :: Int -> [[Int]]
queens 0 = [[]]
queens n = [q:b | b <- queens (n-1), q <- [0..7], safe q b ] where
    safe q b = and [not (checks q b i) | i <- [0..length b-1]] where
		checks q b i = q == b !! i || abs (q-b !! i) == i+1