medioFact :: Integer ->Integer
medioFact n 
      | n == 0 = 1
      | otherwise = n * medioFact(n-2)

