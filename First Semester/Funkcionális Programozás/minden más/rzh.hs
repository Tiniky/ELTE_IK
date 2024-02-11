f :: [String] -> [String]
f [] = []
f ((x:y:xs):s)
    | x+y == "ez" || x+y == "az" = (x:y:xs) : f s
	| otherwise = f s