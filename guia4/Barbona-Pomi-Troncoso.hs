-- Barbona Agustina Gabriela
-- Pomi Franco Ezequiel
-- Troncoso Sebastian

------------------------------------------------------------------------------------------
--Funciones Auxiliares

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n m   | mod n m == 0 = m
                        | otherwise = menorDivisorDesde n (m+1)

esPrimo :: Integer -> Bool
esPrimo n   | n == 1 = False
            | menorDivisorDesde n 2 == n = True
            | otherwise = False

esBPseudoprimo :: Integer -> Integer -> Bool
esBPseudoprimo n b  | mod (b^(n-1)-1) n == 0 && esPrimo n == False = True
                    | otherwise = False 
                    
es3Pseudoprimo :: Integer -> Bool
es3Pseudoprimo n = esBPseudoprimo n 3

kesimo2y3PseudoprimoDesde :: Integer -> Integer -> Integer
kesimo2y3PseudoprimoDesde k n   | es2Pseudoprimo n == True && es3Pseudoprimo n == True && k == 0 = n
                                | es2Pseudoprimo n == True && es3Pseudoprimo n == True = kesimo2y3PseudoprimoDesde (k-1) (n+1)
                                | otherwise = kesimo2y3PseudoprimoDesde k (n+1) 
                                
esCarmichaelDesde :: Integer -> Integer -> Bool
esCarmichaelDesde n m   | m == 1 = True
                        | sonCoprimos n m == True && esBPseudoprimo n m == False = False
                        | otherwise = esCarmichaelDesde n (m-1)

------------------------------------------------------------------------------------------

-- EJERCICIO 1: sonCoprimos
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos n m | mod n m == 0 && m == 1 = True 
                | mod n m == 0 && m /= 1 = False
                | otherwise = sonCoprimos m (mod n m)

-- EJERCICIO 2: es2Pseudoprimo
es2Pseudoprimo :: Integer -> Bool
es2Pseudoprimo n = esBPseudoprimo n 2

-- EJERCICIO 3: cantidad3Pseudoprimos
cantidad3Pseudoprimos :: Integer -> Integer
cantidad3Pseudoprimos n | n == 1 = 0
                        | es3Pseudoprimo n == True = 1 + cantidad3Pseudoprimos (n-1)
                        | otherwise = cantidad3Pseudoprimos (n-1) 

-- EJERCICIO 4: kesimo2y3Pseudoprimo
kesimo2y3Pseudoprimo :: Integer -> Integer
kesimo2y3Pseudoprimo k = kesimo2y3PseudoprimoDesde k 1

-- EJERCICIO 5: esCarmichael
esCarmichael :: Integer -> Bool
esCarmichael n = esCarmichaelDesde n (n-1)



