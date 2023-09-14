--a)
absoluto :: Integer -> Integer
absoluto n | n >= 0 = n
           | otherwise = -n
------------------------------------------------------------------------------------------------------
--b)
absolutoMaximo :: Integer -> Integer -> Integer
absolutoMaximo n m| (absoluto n) >= (absoluto m) = n
                  | otherwise = (absoluto m)
------------------------------------------------------------------------------------------------------
  --c)
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 m n o
  | m >= n && m >= o = m
  | n >= m && n >= o = n
  | otherwise = o
------------------------------------------------------------------------------------------------------
--d)
algunoes0 :: Integer -> Integer -> Bool
algunoes0 m n
  | (m == 0) || (n==0) = True
  | otherwise = False

algunoes0pat :: Integer -> Integer -> Bool
algunoes0pat _ 0 = True
algunoes0pat 0 _ = True
algunoes0pat _ _ = False
------------------------------------------------------------------------------------------------------
--e)
ambosSon0 :: Float -> Float -> Bool
ambosSon0 m n = (m == 0) && (n==0) 

ambosSon0Pat :: Float -> Float -> Bool
ambosSon0Pat 0 0 = True
ambosSon0Pat _ _ = False
------------------------------------------------------------------------------------------------------
--f)
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y = (x <= 3 && y <= 3) || ((x > 3 && x <= 7) && (y > 3 && y <= 7)) || ((x > 7) && ((y > 7)))
------------------------------------------------------------------------------------------------------
--g)
sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z
  | x == y && y == z = x
  | x == y = x + z
  | x == z = x + y
  | y == z = x + z
  | otherwise = x + y + z
------------------------------------------------------------------------------------------------------
--h)
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y | x `mod` y == 0 = True
                 | otherwise = False
------------------------------------------------------------------------------------------------------
--i)
digitoUnidades :: Integer -> Integer
digitoUnidades x = x `mod` 10 
------------------------------------------------------------------------------------------------------
--j)
digitoDecenas :: Integer -> Integer 
digitoDecenas x = digitoUnidades ( x `div` 10)
