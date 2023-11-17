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
todosIgualesv2 :: (Eq t) => [t] -> Bool
todosIgualesv2 [] = True
todosIgualesv2 (x:xs) = pertenece x xs || todosIgualesv2 xs

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
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

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