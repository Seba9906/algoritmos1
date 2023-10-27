f :: Integer -> Integer -> Integer
f i j | i == 1 = faux 1 j
      | otherwise = faux i j + f(i-1) j
faux :: Integer -> Integer -> Integer
faux i j | j == 1 = i
         | otherwise = i^j + faux i (j-1)