ultimoDigito :: Integer -> Integer
ultimoDigito n = mod n 10

primerDigito :: Integer -> Integer
primerDigito n | n < 10 = n
               | otherwise = primerDigito (div n 10) --ej div 1234 10 -> 123 `div` 10 -> 12 `div` 10 -> 1, res = 1

sacarPrimerDigito :: Integer -> Integer
sacarPrimerDigito n | n < 10 = n
                    | otherwise = primerDigito(div n 10)

sacarUltimoDigito :: Integer -> Integer
sacarUltimoDigito n = div n 10


sacarUltimoyPrimero :: Integer -> Integer
sacarUltimoyPrimero n = sacarPrimerDigito(sacarUltimoDigito(n))
      
esCapicua :: Integer ->Bool
esCapicua n | n < 10 = True
            | otherwise = (primerDigito(n) == ultimoDigito(n)) && (primerDigito(sacarUltimoyPrimero n) == ultimoDigito(sacarUltimoyPrimero n))