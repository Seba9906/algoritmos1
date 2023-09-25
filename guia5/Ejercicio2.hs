pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs)| n == x = True
                  | otherwise = pertenece n  xs
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:y:xs)   | x == y = True
                        | otherwise = todosIguales (y:xs) 
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = False
todosDistintos[x] = True
todosDistintos (x:xs) 
      | x == head xs = False
      | otherwise = todosDistintos xs
hayRepetidos :: (Eq t) => [t] -> Bool 
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x:xs) | pertenece x xs = True
                    | otherwise = hayRepetidos xs
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs) | n == x = xs
                | otherwise = x : quitar n xs
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x:xs) | x == n = quitarTodos n xs 
                     | otherwise = x : quitarTodos n xs
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:xs)| pertenece x xs = x : eliminarRepetidos(quitarTodos x xs)
                        | otherwise = x : eliminarRepetidos xs
-- la idea es que los eltos se evaluan primero de l1 a l2 y luego de l2 a l1
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = todosEn xs ys && todosEn ys xs 
todosEn :: (Eq t) => [t] -> [t] -> Bool
todosEn [] _ = True
todosEn (x:xs) y 
      | pertenece x y = True
      | otherwise = False
capicua :: (Eq t) => [t] -> Bool
capicua xs = xs == reverso xs
reverso :: (Eq t) => [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]