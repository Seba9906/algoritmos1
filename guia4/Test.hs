module Test where
fibonacci:: Integer ->Integer
fibonacci n
      |n==0 = 0
      |n==1 = 1
      |otherwise = fibonacci(n-1)+fibonacci(n-2)

parteEntera :: Float ->Integer
parteEntera x | x < 1 && x >= 0 = 0
              | x > -1 && x <= 0 = 0
              | x >= 1 = 1 + parteEntera(x-1)
              | otherwise = (-1) + parteEntera(x+1)

esDivisible :: Integer ->Integer ->Bool
esDivisible x y | x == y = True
                | x <= y = False
                | otherwise = esDivisible(x-y) y

sumaImpares :: Integer ->Integer
sumaImpares n = contarSuma 1 n
contarSuma :: Integer -> Integer -> Integer
contarSuma num cont | cont == 0 = 0
                    | otherwise = num + contarSuma(num + 2) (cont - 1)

medioFact :: Integer -> Integer
medioFact n | n == 0 = 1
            | otherwise = n * medioFact (n-2)

sumaDigitos :: Integer ->Integer
sumaDigitos n | n == 0 = 0
              | otherwise = n `mod` 10 + sumaDigitos (n `div` 10)

ultimodigito :: Integer -> Integer 
ultimodigito n = n `mod` 10

sacarUltimoDigito :: Integer -> Integer --aux
sacarUltimoDigito n = n `div` 10

todosDigitosIguales :: Integer ->Bool
todosDigitosIguales n | n < 10 = True
                      | otherwise = ultimodigito(n) == ultimodigito(sacarUltimoDigito n) && todosDigitosIguales(sacarUltimoDigito n)

cantDigitos :: Integer -> Integer
cantDigitos n | n < 10 = 1
              | otherwise = 1 + cantDigitos(sacarUltimoDigito(n))
iesimoDigito :: Integer ->Integer ->Integer
iesimoDigito n i = (n `div` 10^(cantDigitos n-i)) `mod` 10

ultimoDigito :: Integer -> Integer --aux
ultimoDigito n = mod n 10

primerDigito :: Integer -> Integer --aux
primerDigito n | n < 10 = n
               | otherwise = primerDigito (div n 10) 

sacarPrimerDigito :: Integer -> Integer --aux
sacarPrimerDigito n | n < 10 = 0
                    | otherwise = n `mod` ( 10^ (cantDigitos n-1))

sacarUltimoyPrimero :: Integer -> Integer --aux
sacarUltimoyPrimero n = sacarPrimerDigito(sacarUltimoDigito(n))

esCapicua :: Integer -> Bool
esCapicua n | n < 0 = False
            | n < 10 = True
            | otherwise = (primerDigito n ) == (ultimoDigito n) && esCapicua(sacarUltimoyPrimero n)

f1 :: Integer -> Integer
f1 n | n == 0 = 1
     | otherwise = 2^n + f1 (n-1)
f2 :: Integer -> Float -> Float
f2 n q | n == 1 = q^n
       | otherwise = q^n + f2 (n-1) q
f3 :: Integer -> Float -> Float
f3 n q = f2 (2*n) q


f4 :: Int -> Float -> Float
f4 n q = f4' n (2*n) q 

f4' :: Int -> Int -> Float -> Float
f4' i n q | i > 2*n = 0 -- el indice i no puede valer mas que el techo de la sumatoria, usamos el 0 como finalizacion de la recursion
          | otherwise = q^i + f4' (i+1) n q 

factorial :: Integer -> Float
factorial n | n == 0 = 1
            | otherwise = fromIntegral n * (factorial(n-1))

eAprox :: Integer -> Float
eAprox n | n == 0 = 1
         | otherwise = (1/factorial n) + eAprox(n-1)
e :: Float
e = eAprox 10

raizDe2Aprox' :: Integer ->Float
raizDe2Aprox' n | n == 1 = 2
               | otherwise = 2 + (1/raizDe2Aprox' (n-1))
raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = raizDe2Aprox' n-1

f13' :: Integer -> Integer -> Integer
f13' i j | j == 0 = 0 -- si j es 0 no hay casos para sumar
         | otherwise = i^j + f13' i (j-1)

f13 :: Integer -> Integer -> Integer
f13 i j | i == 0 = 0 -- lo mismo para i
        | otherwise = f13' i j + f13 (i-1) j

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m = sumaAux q n m 1 1
  where
     sumaAux q n m a b
       | a > n = 0 -- en este caso ya no hay mas terminos que sumar
       | b > m = sumaAux q n m (a+1) 1 -- si b supera el techo (m) debemos reiniciarlo a pasar al siguiente valor de a de la sumatoria
       | otherwise = q^(a+b) + sumaAux q n m a (b+1) 
f15' :: Integer -> Integer -> Float
f15' p q | q == 0 = 0 -- si q es 0 no hay casos para sumar
         | otherwise = fromIntegral p/ fromIntegral q + f15' p (q-1)

f15 :: Integer -> Integer -> Float
f15 p q | p == 0 = 0 -- lo mismo para p
        | otherwise = f15' p q + f15 (p-1) q

menorDivisor :: Integer ->Integer
menorDivisor n = menorDivisorDesde n 2  -- 2 es el menor divisor asi que arrancamos con ese
menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n d | d * d > n = n
                      | n `mod` d == 0 = d
                      | otherwise = menorDivisorDesde n (d+1)

esPrimo :: Integer ->Bool
esPrimo p = menorDivisor p == p

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos a b = mcd a b == 1
mcd :: Integer -> Integer -> Integer
mcd a b | b == 0 = a
        | otherwise = mcd b (mod a b)
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 1 2 --arranco el contador en 1 y 2 es el primer primero /= 1
nEsimoPrimoAux :: Integer -> Integer -> Integer -> Integer
nEsimoPrimoAux n contador candidatoPrimo | esPrimo candidatoPrimo && contador == n = candidatoPrimo --por ej si n es 3 vos necesitas que el contador cuente el tercer primo, por lo que en el caso base necesitamos que contador llegue a ser igual a n
                                         | esPrimo candidatoPrimo = nEsimoPrimoAux n (contador + 1) (candidatoPrimo + 1) -- tenemos que subir el contador y cambiar el candidato
                                         | otherwise = nEsimoPrimoAux n contador (candidatoPrimo + 1) -- no es primo, seguimos con el mismo contador y cambiamos el primo

esFibonacci :: Integer -> Bool
esFibonacci n = esFibonacciAux n 0
esFibonacciAux :: Integer -> Integer -> Bool
esFibonacciAux n contador | n == fibonacci contador = True
                          | fibonacci contador > n = False -- si el valor del contador fibonacci supera el n ya nos dice que el nro no esta en la secuencia
                          | otherwise = esFibonacciAux n (contador + 1)

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = mayorDigitoParAux n (-1) -- si no encuentra un digito par devuelve -1
mayorDigitoParAux :: Integer -> Integer -> Integer
mayorDigitoParAux n max | n == 0 = max
                        | ((ultimoDigito n) `mod` 2 == 0) && (ultimoDigito n) > max = mayorDigitoParAux (sacarUltimoDigito n) (ultimoDigito n) -- ej 1234 -> 4 es par y 4 > -1 = mDPA (123) (4)
                        | otherwise = mayorDigitoParAux(sacarUltimoDigito n) max

esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos n = esSumaDePrimerosKPrimos 1 n
esSumaDePrimerosKPrimos :: Integer -> Integer -> Bool
esSumaDePrimerosKPrimos k n |(sumaKprimos k) == n = True
                            |(sumaKprimos k) > n = False
                            |otherwise = esSumaDePrimerosKPrimos (k+1) n
sumaKprimos :: Integer -> Integer
sumaKprimos k | k==0 = 0
              | otherwise = nEsimoPrimo k + sumaKprimos (k-1)




