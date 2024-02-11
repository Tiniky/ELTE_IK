--Pont egy tengelyen
onAxis :: Integral a => (a, a) -> Bool
onAxis (0, 0) = True
onAxis (0, _) = True
onAxis (_, 0) = True
onAxis (_, _) = False

--Törtek
add :: Num a => (a, a) -> (a, a) -> (a,a)
add (a, b) (c, d) = (a*d + b*c, b*d)

--Időeltolás
shift :: (Int, Int) -> Int -> (Int, Int)
shift (x, y) c = ((x+(y+c)`div`60) - ((x+(y+c)`div`60)`div`24)*24 , y+c-((y+c)`div`60)*60)


--Hegy
mountain n = [1,2..n] ++ [n-1,n-2..1]
