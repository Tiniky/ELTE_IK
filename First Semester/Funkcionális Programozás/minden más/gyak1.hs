one :: Int
one = 1

two :: Int
two = one + 1

inc :: Int -> Int
inc n = n + 1

isEven :: Int -> Bool
isEven k = k `mod` 2 == 0

isOdd :: Int -> Bool
isOdd k = k `mod` 2 /= 0

isOddBetter :: Int -> Bool
isOddBetter k = not (isEven k)

add :: Int -> Int -> Int
add a b = a + b

second :: Int -> Int -> Int
second a b = b