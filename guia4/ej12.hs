raizDe2Aprox' :: Integer ->Float
raizDe2Aprox' a | a == 1 = 2
                | otherwise = 2 + (1/raizDe2Aprox' (a-1))
raizDe2Aprox :: Integer -> Float
raizDe2Aprox a = raizDe2Aprox' a - 1