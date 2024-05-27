module Solucion where

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

ultimo :: [t] -> t
ultimo [x] = x
ultimo (_:xs) = ultimo xs

principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

reverso :: [t] -> [t]
reverso [] = []
reverso [x] = [x]
reverso (x:xs) = reverso xs ++ [x]

---------------------------------------------------------------------------------------------------------------------------------------------------
--ej2
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs 

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:y:xs) | x /= y = False
                      | otherwise = todosIguales (y:xs)

todosDistintos :: (Eq t) => [t] -> Bool 
todosDistintos [] = True
todosDistintos (x:xs) = not (pertenece x xs) && todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs) | n == x = xs
                | otherwise = x : quitar n xs

quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x:xs)| n == x = quitarTodos n xs
                    | otherwise = x : quitarTodos n xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs)

todosEn :: (Eq t) => [t] -> [t] -> Bool
todosEn [] _ = True
todosEn (x:xs) ys = pertenece x ys && todosEn xs ys

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = todosEn (eliminarRepetidos xs) (eliminarRepetidos ys)

capicua :: (Eq t) => [t] -> Bool
capicua x = x == reverso x

-------------------------------------------------------------------------------------------------------------------------------------------
-- sumatoria :: [Integer] -> Integer
-- sumatoria [] = 0
-- sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x >= y = maximo (x:xs) 
                | otherwise = maximo (y:xs)
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = []
sumarN n (x:xs) = (n + x) : sumarN n xs

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero x = sumarN (head x) x

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo x = sumarN (ultimo x) x

esPar :: Integer -> Bool
esPar n = n `mod` 2 == 0

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | esPar x = x: pares xs 
             | otherwise = pares xs

esMultiplo :: Integer->Integer -> Bool
esMultiplo n m = n `mod` m == 0

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs) | esMultiplo x n = x : multiplosDeN n xs
                      | otherwise = multiplosDeN n xs

insertar :: Integer -> [Integer] -> [Integer]
insertar x [] = [x]
insertar x (y:ys) | x <= y = x : y : ys
                  | otherwise = y : insertar x ys

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) = insertar x (ordenar xs)

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (x:xs)
                               | otherwise = x : sacarBlancosRepetidos (y:xs)

contarPalabras :: [Char] -> Integer
contarPalabras l = contarPalabrasSinBlancosRep (quitarBlancosIniFin(sacarBlancosRepetidos l))

quitarBlancosIni :: [Char] -> [Char]
quitarBlancosIni [] = []
quitarBlancosIni (x:xs) | x == ' ' = quitarBlancosIni xs
                        | otherwise = (x:xs)

quitarBlancosIniFin :: [Char] -> [Char]
quitarBlancosIniFin l = reverse (quitarBlancosIni (reverse (quitarBlancosIni l)))

contarPalabrasSinBlancosRep :: [Char] -> Integer
contarPalabrasSinBlancosRep [] = 0
contarPalabrasSinBlancosRep [x] = 1
contarPalabrasSinBlancosRep (x:xs) | x == ' ' = 1 + contarPalabrasSinBlancosRep xs
                                   | otherwise = contarPalabrasSinBlancosRep xs 

extraerPrimerPalabra :: [Char] -> [Char]
extraerPrimerPalabra [] = []
extraerPrimerPalabra (x:xs) | x == ' ' = []
                            | otherwise = x : extraerPrimerPalabra xs

quitarPrimerPalabra :: [Char] -> [Char]
quitarPrimerPalabra [] = []
quitarPrimerPalabra (x:xs) | x == ' ' = xs
                           | otherwise = quitarPrimerPalabra xs

palabras :: [Char] -> [[Char]]
palabras l = palabrasAux (quitarBlancosIniFin(sacarBlancosRepetidos l))

palabrasAux :: [Char] -> [[Char]]
palabrasAux [] = []
palabrasAux l   | palabra == [] = palabrasAux (quitarPrimerPalabra l)
                | otherwise = palabra : palabrasAux (quitarPrimerPalabra l)
                where
                    palabra = extraerPrimerPalabra l

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga l = mayorLongitud (palabras l)
    where
        mayorLongitud :: [[Char]] -> [Char]
        mayorLongitud [] = []
        mayorLongitud [x] = x
        mayorLongitud (x:xs) | length x > length (mayorLongitud xs) = x
                             | otherwise = mayorLongitud xs

-- aplanar :: [[Char]] -> [Char]
-- aplanar [] = []
-- aplanar (x:xs) = (quitarBlancosIniFin x) ++ aplanar xs 

-- aplanarv2 :: [[Char]] -> [Char]
-- aplanarv2 [] = []
-- aplanarv2 (x:xs) | x == ' ' = aplanarv2 xs
--                | otherwise = x : aplanarv2 xs

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [x] = quitarBlancosIniFin x
aplanarConBlancos (x:xs) = (quitarBlancosIniFin x) ++ " " ++ aplanarConBlancos xs

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos (x:xs) n | xs == [] = x
                            | otherwise = x ++ generarNBlancos n ++ aplanarConNBlancos xs n
                            where
                                generarNBlancos :: Integer -> [Char]
                                generarNBlancos 0 = []
                                generarNBlancos n = ' ' :generarNBlancos (n-1)

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada l = sumaAcumuladaAux l 0
    where
        sumaAcumuladaAux :: (Num t) => [t] -> t -> [t]
        sumaAcumuladaAux [] _ = []
        sumaAcumuladaAux (x:xs) acumulador = (x + acumulador) : sumaAcumuladaAux xs (x + acumulador)

factoresPrimos :: Integer -> [Integer]
factoresPrimos n = factoresPrimosAux n 2
    where
        factoresPrimosAux :: Integer -> Integer -> [Integer]
        factoresPrimosAux 1 _ = []
        factoresPrimosAux n divisor | mod n divisor == 0 = divisor : factoresPrimosAux( n `div` divisor) divisor --si n es divisible por el divisor, lo agregamos a la cola y llamamos la funcion con el resultado de la division entera entre el numero n y su divisor
                                    | otherwise = factoresPrimosAux n (divisor + 1)
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = factoresPrimos x : descomponerEnPrimos xs


-- Ejercicio 1
votosEnBlanco :: [(String, String)] -> [Int] -> Int  -> Int
votosEnBlanco _ votosValidos votos = votos - (sumatoria votosValidos)
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria [n] = n
sumatoria (x:xs) = x + sumatoria xs

-- Ejercicio 2
formulasValidas :: [(String, String)] -> Bool
formulasValidas formulas = noHayRepetidos (aplanar formulas)

aplanar :: [(String,String)] -> [String]
aplanar [] = []
aplanar ((x,y):xs) = x : y : aplanar xs

noHayRepetidos :: [String] -> Bool
noHayRepetidos [] = True
noHayRepetidos (x:xs) = not(elem x xs) && noHayRepetidos xs

-- Ejercicio 3
porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos presidente formulas votos = division (votosDePresidente presidente formulas votos) (sumatoria votos)

votosDePresidente :: String -> [(String,String)] -> [Int] -> Int
votosDePresidente _ [] _ = 0
votosDePresidente _ _ [] = 0
votosDePresidente presidente ((presi,_):fs) (v:vs)  | presidente == presi = v
                                                    | otherwise = votosDePresidente presidente fs vs 

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)


-- Ejercicio 4
proximoPresidente :: [(String, String)] -> [Int] -> String
proximoPresidente [(presi,_)] _ = presi
proximoPresidente (f1:f2:fs) (v1:v2:vs) | v1 >= v2 = proximoPresidente (f1:fs) (v1:vs)
                                        | otherwise = proximoPresidente (f2:fs) (v2:vs)