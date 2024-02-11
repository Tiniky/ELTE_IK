import Data.Maybe
import Data.List

type Matrix = [[Int]]

--Első szint: Azonos méretű mátrixok 
isSameSize :: Matrix -> Matrix -> Bool
isSameSize [] [] = True
isSameSize xs ys = sum [ 1| n <-(concat [take 1000 n| n<-xs])] == sum [ 1|n<-(concat [take 1000 m| m<-ys])]

--Második szint: Bűvös négyzet
ugyanaz :: Eq a => [a] -> Bool
ugyanaz [] = True
ugyanaz (x:xs) = and $ map (== x)(xs)

egyedi :: Eq a => [a] -> Bool
egyedi [] = True
egyedi [x] = True
egyedi (x:y:xs)
    | x==y = False
    | otherwise = egyedi (y:xs)

pluszEgy :: [Int] -> Bool
pluszEgy [x] = True
pluszEgy (x:xs)
    | (x:xs) == [1..length (x:xs)] = True
    | otherwise = False

magicSquare :: Matrix -> Maybe Int
magicSquare [[x]] = Just x
magicSquare xs
    | (length xs)^2 == length (concat [take 10 n| n<-xs]) && ugyanaz [sum n| n<-xs] && pluszEgy(sort (concat xs)) =  Just $ head [sum n| n<-xs]
    | otherwise = Nothing

--Harmadik szint: Minimális költségű transzformáció
transp :: Matrix -> Matrix
transp xs = [[(xs !! 0) !! 0, (xs !! 1) !! 0, (xs !! 2) !! 0],[(xs !! 0) !! 1, (xs !! 1) !! 1, (xs !! 2) !! 1],[(xs !! 0) !! 2, (xs !! 1) !! 2, (xs !! 2) !! 2]]

fordit :: Matrix -> Matrix
fordit xs = [[(xs !! 2) !! 0, (xs !! 1) !! 0, (xs !! 0) !! 0],[(xs !! 2) !! 1, (xs !! 1) !! 1, (xs !! 0) !! 1],[(xs !! 2) !! 2, (xs !! 1) !! 2, (xs !! 0) !! 2]]

egy = [[2,9,4],[7,5,3],[6,1,8]]
ketto = fordit egy
harom = fordit ketto
negy = fordit harom
egyT = transp egy
kettoT = transp ketto
haromT = transp harom
negyT = transp negy

buvosNegyzetek = [egy, egyT, ketto, kettoT, harom, haromT, negy, negyT]

koltsegek :: Matrix -> [Int]
koltsegek xs = [sum $ map abs [concat xs !! i - concat egy !! i | i<-[0..8]], sum $ map abs [concat xs !! i - concat egyT !! i | i<-[0..8]], sum $ map abs [concat xs !! i - concat ketto !! i | i<-[0..8]], sum $ map abs [concat xs !! i - concat kettoT !! i | i<-[0..8]], sum $ map abs [concat xs !! i - concat harom !! i | i<-[0..8]], sum $ map abs [concat xs !! i - concat haromT !! i | i<-[0..8]], sum $ map abs [concat xs !! i - concat negy !! i | i<-[0..8]], sum $ map abs [concat xs !! i - concat negyT !! i | i<-[0..8]]]

minimalCost :: Matrix -> Maybe Int
minimalCost xs
    | length (take 10 xs) /= 3 || (length $ concat [take 10 n | n <- xs]) /= 9 = Nothing
    | magicSquare xs /= Nothing = Just 0
    | otherwise = Just $ minimum $ koltsegek xs