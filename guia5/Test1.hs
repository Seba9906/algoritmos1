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

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x1:x2:xs) | x1 /= x2 = False
                        | otherwise = todosIguales(x2:xs)

todosDistintos :: (Eq t) => [t] -> Bool 
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x1:x2:xs) | x1 == x2 = False
                          | otherwise = todosDistintos(x2:xs)

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [_] = []
quitar n (x:xs) | n == x = xs
                | otherwise = x : quitar n xs

quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x:xs) | n == x = quitarTodos n xs
                | otherwise = x : quitarTodos n xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos(quitarTodos x xs)

todosEn :: (Eq t) => [t] -> [t] -> Bool --nos fijamos que todos los elementos de l1 esten en l2 sin importan repeticiones
todosEn [] _ = True
todosEn (x:xs) ys = pertenece x ys && todosEn xs ys

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = todosEn(eliminarRepetidos xs) (eliminarRepetidos ys) -- sacamos las repeticiones de l1 y l2 y comparamos usando todosEn 

-- mismosElementos :: (Eq t) => [t] -> [t] -> Bool
-- mismosElementos [] [] = True
-- mismosElementos _ [] = True
-- mismosElementos [] _ = False
-- mismosElementos (x:xs) ys | pertenece x ys = mismosElementos(eliminarRepetidos x xs) (eliminarRepetidos x ys)
--                           | otherwise = False

capicua :: (Eq t) => [t] -> Bool 
capicua x = x == reverso x

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria [] = 0
productoria (x:xs) = x * productoria xs

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x > y = maximo (x:xs)
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

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | esPar(x) = x : pares xs
             | otherwise = pares xs
             where
                esPar x = x `mod` 2 == 0

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) | (n `mod` x) == 0 = x : multiplosDeN n xs
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
sacarBlancosRepetidos (x:xs) = sacarBlancosRepetidosAux x xs -- si tenemos espacios uniformes va a sacar todos los espacios si no manejamos la recursion aparte
   where
      sacarBlancosRepetidosAux x [] = [x]
      sacarBlancosRepetidosAux x (y:ys)
         | x == ' ' && y == ' ' = sacarBlancosRepetidosAux x ys
         | otherwise = x : sacarBlancosRepetidosAux y ys

quitarBlancosIni :: [Char] -> [Char]
quitarBlancosIni [] = []
quitarBlancosIni (x:xs) | x == ' ' = quitarBlancosIni xs
                        | otherwise = (x:xs)

quitarBlancosIniFin :: [Char] -> [Char]
quitarBlancosIniFin x = reverso(quitarBlancosIni(reverso(quitarBlancosIni(x)))) --el reverso inicial es para volver a ordenar la palabra

contarPalabrasSinBlancosRep :: [Char] -> Integer
contarPalabrasSinBlancosRep [] = 0
contarPalabrasSinBlancosRep [x] = 1
contarPalabrasSinBlancosRep (x:xs) | x == ' ' = 1 + contarPalabrasSinBlancosRep xs
                                   | otherwise = contarPalabrasSinBlancosRep xs 

contarPalabras :: [Char] -> Integer
contarPalabras x = contarPalabrasSinBlancosRep(quitarBlancosIniFin(sacarBlancosRepetidos(x)))

-- palabras :: [Char] -> [[Char]]
-- palabras s = palabrasAux s []

-- -- Función auxiliar que toma la cadena actual y la palabra que se está construyendo
-- palabrasAux :: [Char] -> [Char] -> [[Char]]
-- palabrasAux [] [] = []                     -- Caso base: cadena vacía, palabra vacía
-- palabrasAux [] palabra = [palabra]         -- Caso base: fin de la cadena, agrega la última palabra
-- palabrasAux (' ':xs) [] = palabrasAux xs []       -- Espacios al inicio o múltiples espacios entre palabras
-- palabrasAux (' ':xs) palabra = palabra : palabrasAux xs []  -- Final de una palabra, comienza otra
-- palabrasAux (x:xs) palabra = palabrasAux xs (palabra ++ [x]) -- Agrega carácter a la palabra actual

extraerPrimerPalabra :: [Char] -> [Char]
extraerPrimerPalabra [] = []
extraerPrimerPalabra (x:xs) | x == ' ' = []
                            | otherwise = x : extraerPrimerPalabra xs
quitarPrimerPalabra :: [Char] -> [Char]
quitarPrimerPalabra [] = []
quitarPrimerPalabra (x:xs) | x == ' ' = xs
                           | otherwise = quitarPrimerPalabra xs

palabrasAux :: [Char] -> [[Char]]
palabrasAux [] = []
palabrasAux l | palabra == [] = palabrasAux(quitarPrimerPalabra l)
              | otherwise = palabra : palabrasAux ( quitarPrimerPalabra l)
              where
               palabra = extraerPrimerPalabra l
palabras :: [Char] -> [[Char]]
palabras l = palabrasAux(quitarBlancosIni(sacarBlancosRepetidos(l)))

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga l = mayorLongitud (palabras l)
   where
      mayorLongitud [] = []
      mayorLongitud [x] = x
      mayorLongitud (x:y:xs) | longitud x >= longitud y = mayorLongitud (x:xs)
                             | otherwise = mayorLongitud (y:xs)
                                 where
                                    longitud [] = 0
                                    longitud (_:xs) = 1 + longitud xs

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar(x:xs) = sacarBlancosRepetidos(x) ++ aplanar xs



