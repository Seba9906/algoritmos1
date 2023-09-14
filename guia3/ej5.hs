todosMenores :: (Integer, Integer, Integer) ->Bool
todosMenores (n1,n2,n3) = f(n1) > g(n1) && f(n2) > g(n2) && f(n3) > g(n3)
f :: Integer -> Integer
f n |n <=7 = n^2
    |otherwise = 2*n-1
g :: Integer -> Integer
g n | esPar n = n`div`2
    | otherwise = 3*n+1
    where
      esPar x = x `mod` 2 == 0