iesimoDigito :: Integer ->Integer ->Integer
iesimoDigito n i = (n `div` 10^(cantDigitos n-i)) `mod` 10
cantDigitos :: Integer -> Integer
cantDigitos n 
      | n < 10 = 1
      | otherwise = 1 + cantDigitos(sacarUltimoDigito n) 
      where sacarUltimoDigito n = n `div` 10
