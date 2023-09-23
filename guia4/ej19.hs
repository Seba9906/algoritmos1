import Ejercicio16
esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos 1 = False
esSumaInicialDePrimos n = esSumaAux n 2 1 --2 es la suma hasta el primer primo y el 1 es el contador
esSumaAux :: Integer -> Integer -> Integer -> Bool
esSumaAux n suma contadorPrimos
      | n == suma = True
      | n < suma = False
      | otherwise = esSumaAux n (suma + nEsimoPrimo (contadorPrimos + 1 )) (contadorPrimos + 1) 