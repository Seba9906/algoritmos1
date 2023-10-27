--a)
menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisor' n 2 --el ejcio pide menor divisor > 1
menorDivisor' :: Integer -> Integer
menorDivisor' n m | esDivisible n m = m
                  | otherwise = menorDivisor' n (m+1)
esDivisible :: Integer -> Integer -> Bool
esDivisible x y | x == y = True
                | x < y = False
                | otherwise = esDivisible (x-y) y
