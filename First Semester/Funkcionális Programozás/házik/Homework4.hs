--Játékbolt
toysOnSale a = [(x, y*0.8) | (x,y,z) <- a, y>500 && z<10]

--Barátságos Számok
areAmicableNumbers :: Integral a => a -> a -> Bool
areAmicableNumbers x y = sum [n | n <- [1..x-1], x`mod`n == 0] == y


--Hozzárendelés
relation = [(x, x^5 - 5*x^4 + 2*x^3 - 3*x +4) | x <- [0,1..100]]
