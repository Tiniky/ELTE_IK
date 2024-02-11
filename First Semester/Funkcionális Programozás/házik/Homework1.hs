--Kifjezések
intExpr1 :: Int
intExpr1 = 1 + 1

intExpr2 :: Int
intExpr2 = 2 * 5

intExpr3 :: Int
intExpr3 = 3 * 9

--Hét
inc :: Int -> Int
inc x = x + 1

double :: Int -> Int
double n = n * 2

seven1 :: Int
seven1 = inc(double(inc(inc(inc 0))))

seven2 :: Int
seven2 = inc(inc(inc(double(double(inc 0)))))

seven3 :: Int
seven3 = inc(double(inc(double(inc 0))))

--Típusszignatúra
foo :: Int -> Int -> Int
foo a b = a ^ b