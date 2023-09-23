module Ejercicio16 where
--a)
menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorAux n 2 --2 en lugar de uno xq pide el menor divisor entero mayor q uno

menorDivisorAux :: Integer -> Integer -> Integer
menorDivisorAux n x | esDivisible n x = x 
                    | otherwise = menorDivisorAux n (x+1)

esDivisible :: Integer ->Integer ->Bool
esDivisible x y | x==y = True
                | x<y = False
                | otherwise = esDivisible(x-y) y
--b)
esPrimo :: Integer ->Bool 
esPrimo p = menorDivisor p == p
--c)
sonCoprimos :: Integer ->Integer ->Bool
sonCoprimos a b = mcd a b == 1
mcd :: Integer -> Integer -> Integer
mcd a b | b == 0 = a
        | otherwise = mcd b (mod a b)
--d)
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 1 2 --arranco con 2 por que 2 es el primer nro primo
nEsimoPrimoAux :: Integer -> Integer -> Integer -> Integer
nEsimoPrimoAux n contador auxiliar | esPrimo auxiliar && contador == n = auxiliar
                                   | esPrimo auxiliar = nEsimoPrimoAux n (contador + 1) (auxiliar + 1)
                                   | otherwise = nEsimoPrimoAux n contador (auxiliar + 1)
