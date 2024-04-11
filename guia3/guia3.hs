--ej1--
--a--
-- f :: Int -> Int
-- f 1 = 8
-- f 4 = 131
-- f 16 = 16
-- --b--
-- g :: Int -> Int
-- g 8 = 16
-- g 16 = 4
-- g 131 = 1
-- --c--
-- h :: Int -> Int
-- h x = f (g (x))
-- k :: Int -> Int
-- k x = g (f (x))

--ej2--
absoluto :: Int -> Int
absoluto n | n < 0 = -(n)
           | otherwise = n

maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto n m  | absoluto(n) >= absoluto(m) = absoluto(n)
                    | otherwise = absoluto(m)

maximo3 :: Int -> Int -> Int -> Int
maximo3 n m o  | n >= m && n >= o = n
               | m >= n && m >= o = m
               | otherwise = o

algunoEs0 :: Float -> Float -> Bool
algunoEs0 n m = (n == 0 || m == 0) 

algunoEs0PM :: Float -> Float -> Bool
algunoEs0PM _ 0 = True
algunoEs0PM 0 _ = True
algunoEs0PM _ _ = False

ambosSon0 :: Float -> Float -> Bool
ambosSon0 n m = n == 0 && m == 0

ambosSon0PM :: Float -> Float -> Bool
ambosSon0PM 0 0 = True
ambosSon0PM _ _ = False

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo n m
    | (n <= 3) && (m <= 3) = True
    | (n > 3) && (n <= 7) && (m > 3) && (m <= 7) = True
    | (n > 7) && (m > 7) = True
    | otherwise = False

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos a b c
    | a == b && b == c = a
    | a == b = c
    | a == c = b
    | b == c = a
    | otherwise = a + b + c

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = x `mod` y == 0

digitoUnidades :: Int -> Int
digitoUnidades n = absoluto(n) `mod` 10

digitoDecenas :: Int -> Int
digitoDecenas n = digitoUnidades ( n `div` 10)

--ej 3
{--a*a + a*b*k = 0 <=> a*b*k= -a*a <=> k = -a*a/a*b => -a/b, como la especificacion
nos dice que estamos en el campo de los enteros para que esto pase a debe ser divisible por b --}
estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b = a `mod` b == 0

--ej 4

prodInt :: (Float,Float) -> (Float,Float) -> Float
prodInt (x1,y1) (x2,y2) = (x1 * x2) + (y1 * y2)

todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor (x1,y1) (x2,y2) = (x1 < x2) && (y1 < y2)

distanciaPuntos :: (Float,Float) -> (Float,Float) -> Float
distanciaPuntos (x1,y1) (x2,y2) = sqrt ((x2-x1)**2 + (y2-y1)**2)

sumaTerna :: (Float,Float,Float) -> Float
sumaTerna (x1,x2,x3) = x1 + x2 + x3

sumarSoloMultiplos :: (Int,Int,Int) -> Int -> Int
sumarSoloMultiplos (a, b, c) n = sumaMultiplo a + sumaMultiplo b + sumaMultiplo c
    where
        sumaMultiplo x 
            | esMultiploDe x n = x
            | otherwise = 0

esPar :: Int -> Bool
esPar x = x `mod` 2 == 0

posPrimerPar :: (Int,Int,Int) -> Int
posPrimerPar (a, b, c) 
    | esPar a = 0
    | esPar b = 1
    | esPar c = 2
    | otherwise = 4

crearPar :: a -> b -> (a,b)
crearPar a b = (a,b)

invertir :: a -> b -> (b,a)
invertir a b = (b,a)

--ej5

f :: Int -> Int
f n | n <= 7 = n^2
    | otherwise = 2*n-1

g :: Int -> Int
g n | esPar n = n `div` 2
    | otherwise = 3*n+1

todosMenores :: (Int, Int, Int) -> Bool
todosMenores (a, b, c) = (f(a) > g(a)) && (f(b) > g(b)) && (f(c) > g(c)) 

--ej6
bisiesto :: Int -> Bool
bisiesto n | n `mod` 4 /= 0 = False
           | n `mod` 100 == 0 && n `mod` 400 /= 0 = False
           | otherwise = True

--ej7
distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) -> Float
distanciaManhattan (x1,y1,z1) (x2,y2,z2) = abs(x1-x2) + abs(y1-y2) + abs(z1-z2)

--ej8
sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos n = (digitoUnidades n) + (digitoDecenas n)

comparar :: Int -> Int -> Int
comparar a b | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
            | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
            | sumaUltimosDosDigitos a == sumaUltimosDosDigitos b = 0