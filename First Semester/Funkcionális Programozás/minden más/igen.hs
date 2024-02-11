--1)
filterMap :: (a -> Bool) -> (a -> b) -> [a] -> [b]
filterMap _ _ [] = []
filterMap a b (x:xs)
	| a x = b x : filterMap a b xs
	| otherwise = filterMap a b xs
	
--2)
mapTuple :: (a -> b) -> (a, a) -> (b, b)
mapTuple a (x,y) = (a x, a y)

--3)
some :: (a -> Bool) -> [a] -> Bool
some _ [] = False
some a (x:xs)
	| a x = (sum [1| n<-(x:xs), a n]) >= 2
	
--4)
mapWhile :: (a -> Bool) -> (a -> b) -> [a] -> [b]
mapWhile _ _ [] = []
mapWhile a b (x:xs)
	| a x = [b m|m<-[n| n<-(x:xs), a n]]
	| otherwise = []