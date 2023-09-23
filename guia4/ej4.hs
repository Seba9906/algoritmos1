sumaImpares :: Integer ->Integer
sumaImpares 0 = 0
sumaImpares n
      | esImpar n = n + sumaImpares(n-1)
      | otherwise = sumaImpares(n-1)
      where
            esImpar m = m `mod` 2 /=0