factorial :: Integer -> Float
factorial n | n == 0 = 1
            | otherwise = fromIntegral n * (factorial (n-1))

eAprox :: Integer -> Float
eAprox n | n == 0 = 1
         | otherwise = (1/factorial n) + eAprox (n-1)

e :: Float
e = eAprox 10
