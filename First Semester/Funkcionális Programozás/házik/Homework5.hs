--Lista konstrukció
putIntoList :: a -> [a]
putIntoList x = [x]

interval :: Int -> Int -> [Int]
interval a b = if a < b then [a..b] else if a == b then [a] else []


--Lista dekonstrukció
headTail :: [a] -> (a, [a])
headTail (a:b) = (head (a:b), tail (a:b))

doubleHead :: [a] -> [b] -> (a,b)
doubleHead (x:xs) (y:ys) = (head (x:xs),head (y:ys))

--Rekurzív függvények
hasZero :: [Int] -> Bool
hasZero [] = False
hasZero(0:_) = True
hasZero (_:b) = hasZero b

hasEmpty :: [[a]] -> Bool
hasEmpty [] = False
hasEmpty ([]:_) = True
hasEmpty (_:b) = hasEmpty b


doubleAll :: [Int] -> [Int]
doubleAll [] = []
doubleAll (a:b) = [n*2 | n <- (a:b)]

isLonger :: [a] -> [b] -> Bool
isLonger [] [] = False
isLonger [_] [] = True
isLonger [] [_] = False
isLonger (x:xs)(y:ys) = length (take 100 (x:xs)) > length (take 100 (y:ys))


--Bónusz
evens :: [Int] -> [Int]
evens (x:xs) = [ n | n <- (x:xs), n`mod`2==0]

sumFirst :: Int -> [Int] -> Int
sumFirst x (a:b) = sum (take x (a:b))

second (x:y:xs) = y : second xs
second _ = []
everySecond :: [a] -> [a]
everySecond [] = []
everySecond (x:xs) = x: second xs
