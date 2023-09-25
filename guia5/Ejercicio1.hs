longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = 1 + longitud xs
ultimo :: [t] -> t
ultimo (x:xs) | longitud xs == 0 = x
              | otherwise = ultimo xs
ultimov2 :: [t] -> t
ultimov2 [x] = x
ultimov2 (_:xs) = ultimo xs
principio :: [t] -> [t]
principio [x] = [] --caso base para excluir el ultimo elto
principio (x:xs) = x : principio xs --agregamos x a la lista que llamamos recursivamente la funcion y el resto de la cola.
reverso::[t]->[t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]
-- Llamada inicial: reverso [1, 2, 3, 4]

-- La lista de entrada es [1, 2, 3, 4].
-- Primer llamado recursivo: reverso [2, 3, 4]

-- La cola de la lista [1, 2, 3, 4] es [2, 3, 4].
-- Llamamos a reverso con la cola [2, 3, 4].
-- Segundo llamado recursivo: reverso [3, 4]

-- La cola de la lista [2, 3, 4] es [3, 4].
-- Llamamos a reverso con la cola [3, 4].
-- Tercer llamado recursivo: reverso [4]

-- La cola de la lista [3, 4] es [4].
-- Llamamos a reverso con la cola [4].
-- Cuarto llamado recursivo: reverso []

-- La cola de la lista [4] es [].
-- Llamamos a reverso con la cola [].
-- Caso base: reverso [] devuelve []

-- Como reverso [] es el caso base, devuelve [].
-- Volviendo desde el cuarto llamado recursivo:

-- El resultado del cuarto llamado fue [].
-- Ahora, en el tercer llamado, concatenamos [] con [4] para obtener [4].
-- Volviendo desde el tercer llamado recursivo:

-- El resultado del tercer llamado fue [4].
-- En el segundo llamado, concatenamos [4] con [3] para obtener [4, 3].
-- Volviendo desde el segundo llamado recursivo:

-- El resultado del segundo llamado fue [4, 3].
-- En el primer llamado, concatenamos [4, 3] con [2] para obtener [4, 3, 2].
-- Volviendo desde el primer llamado recursivo:

-- El resultado del primer llamado fue [4, 3, 2].
-- Finalmente, en la llamada inicial, concatenamos [4, 3, 2] con [1] para obtener el resultado final: [4, 3, 2, 1].