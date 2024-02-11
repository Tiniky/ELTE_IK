import Data.Char
import Data.List
import Data.Function

type Line = String
type File = [Line]

testFile0 :: File
testFile0 = ["asd  qwe", "-- Foo", "", "\thello world "]

--Számlaló függvények
countWordsInLine :: Line -> Int
countWordsInLine xs = sum [1| n<-words xs]

countWords :: File -> Int
countWords xs = sum $ map countWordsInLine xs

countChars :: File -> Int
countChars xs = sum [1| n<-concat xs]

--Nagybetűsítés
capitalizeWordsInLine :: Line -> Line
capitalizeWordsInLine [] = []
capitalizeWordsInLine xs = unwords $ map (\x -> (toUpper $ head x) : tail x) $ words xs

--Transzformációk
hossz = sum [1|n <- (map countWordsInLine testFile0)] -1

isComment :: Line -> Bool
isComment [] = False
isComment ('-':xs) = True
isComment (_:xs) = False

dropComments :: File -> File
dropComments xs = [n|n<-xs, isComment n == False]

numberLines :: File -> File
numberLines xs = zipWith (\x y -> show x ++ ": " ++ y) [1..hossz+1] xs

dropTrailingWhitespaces :: Line -> Line
dropTrailingWhitespaces xs = unwords $ words xs

replaceTab :: Int -> Char -> [Char]
replaceTab n '\t' = concat $ replicate n " "
replaceTab _ x = [x]

replaceTabs :: Int -> File -> File
replaceTabs _ [] = []
replaceTabs n xs = [concat $ map (replaceTab n) x | x <-xs]