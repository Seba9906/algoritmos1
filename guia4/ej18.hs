mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = mayorDigitoParAux n (-1)
--primero verifico que el ultimo digito evaluado sea par y mayor al valor almacenado en max
--si cumple llamo recursivamente a la funcion con el n transformado en (sacarUltimoDigito n) y el valor almacenado en max como ultimoDigito n
-- si no cumple llamo a la funcion recursiva con el nuevo n y el mismo valor de max
mayorDigitoParAux :: Integer -> Integer -> Integer
mayorDigitoParAux n max | n == 0 = max
                        | esPar (ultimoDigito n) && ultimoDigito n > max = mayorDigitoParAux (sacarUltimoDigito n) (ultimoDigito n)
                        | otherwise = mayorDigitoParAux(sacarUltimoDigito n) max
esPar :: Integer -> Bool
esPar n = mod n 2 == 0

sacarUltimoDigito :: Integer -> Integer
sacarUltimoDigito n = div n 10 

ultimoDigito :: Integer -> Integer
ultimoDigito n = mod n 10
