ultimoDigito :: Integer -> Integer
ultimoDigito n = mod n 10

primerDigito :: Integer -> Integer
primerDigito n
  | n < 10 = n
  | otherwise = primerDigito (div n 10)

sacarPrimerDigito :: Integer -> Integer
sacarPrimerDigito n
  | n < 10 = 0
  | otherwise = n `mod` (10 ^ (cantDigitos n - 1))

sacarUltimoDigito :: Integer -> Integer
sacarUltimoDigito n = div n 10

sacarUltimoyPrimero :: Integer -> Integer
sacarUltimoyPrimero n = sacarUltimoDigito (sacarPrimerDigito n)

cantDigitos :: Integer -> Integer
cantDigitos n
  | n < 10 = 1
  | otherwise = 1 + cantDigitos (sacarUltimoDigito n)

esCapicua :: Integer -> Bool
esCapicua n
  | n < 0 = False
  | n < 10 = True 
  | otherwise = (primerDigito n == ultimoDigito n) && esCapicua (sacarUltimoyPrimero n)
