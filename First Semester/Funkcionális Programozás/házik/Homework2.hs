--Háromszög szerkeszthetősége
areTriangleSides :: Int -> Int -> Int -> Bool
areTriangleSides a b c = a<b+c && b<a+c && c<a+b

--Locsolási terv
refill :: Int
refill = round((50*1/4)/1.8)

--Típusszignatúra
f1 :: Integral a => a
f1 = 3 * 9

f2 :: Num a => a -> Bool -> a
f2 x True = x
f2 x False = -x

f3 :: a -> a
f3 y = y

