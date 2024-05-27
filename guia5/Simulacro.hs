module Simulacro where
import Debug.Trace
relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs) | elementosIguales x || tuplaEnLista x xs = False
                         | otherwise = relacionesValidas xs

elementosIguales :: (String,String) -> Bool
elementosIguales (x,y) = x == y

tuplaEnLista :: (String,String) -> [(String,String)] -> Bool
tuplaEnLista _ [] = False
tuplaEnLista (x1,y1) ((x2,y2):xs) | x1 == x2 && y1 == y2 || x1 == y2 && y1 == x2 = True
                                  | otherwise = tuplaEnLista (x1,y1) xs
--------------------------------------------------------------------------------------------------

personas :: [(String, String)] -> [String]
personas [] = []
personas ((x,y):xs) = agregarSiNoEsta x (agregarSiNoEsta y (personas xs ))

-- pertenece :: String -> [String] -> Bool
-- pertenece _ [] = False
-- pertenece n (x:xs) | n == x = True
--                    | otherwise = pertenece n xs

agregarSiNoEsta :: String -> [String] -> [String]
agregarSiNoEsta elemento lista | pertenece elemento lista = lista
                               | otherwise = elemento : lista

--------------------------------------------------------------------------------------------------

amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe p ((x,y):xs) | p == x = y : amigosDe p xs
                      | p == y = x : amigosDe p xs
                      | otherwise = amigosDe p xs
--------------------------------------------------------------------------------------------------
extraerPersonas :: [(String,String)] -> [String]
extraerPersonas [] = []
extraerPersonas ((x,y):xs) = x : y : extraerPersonas xs

contarMax :: (String, Int) -> [String] -> (String, Int)
contarMax maxPersona [] = maxPersona
contarMax (maxP, maxC) (p:ps)
  | cuentaActual > maxC = contarMax (p, cuentaActual) ps
  | otherwise           = contarMax (maxP, maxC) ps
  where cuentaActual = contarApariciones p (p:ps)

contarApariciones :: String -> [String] -> Int
contarApariciones _ [] = 0
contarApariciones persona (x:xs)
  | persona == x = 1 + contarApariciones persona xs
  | otherwise    = contarApariciones persona xs

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos relaciones = fst (contarMax ("", 0) (extraerPersonas relaciones))

-- 1) Atajaron Suplentes
-- problema atajaronSuplentes (arquerosPorEquipo: seq<String X String>, goles: seq<Z>, totalGolesTorneo: Z): Z {
-- 	requiere: {equiposValidos(arquerosPorEquipo)
-- 	requiere: {|arquerosPorEquipo| = |goles|}
-- 	requiere: {Todos los elementos de goles son mayores o iguales a 0}
-- 	requiere: {La suma de todos los elementos de goles es menor o igual a totalGolesTorneo}
-- 	asegura: {
-- 	res es la cantidad de goles recibidos en el torneo por arqueros que no son titulares en sus equipos.
-- 	}
-- }

atajaronSuplentes :: [(String, String)] -> [Int] -> Int -> Int
atajaronSuplentes equipos goles totalGolesTorneo = totalGolesTorneo - atajaronSuplentesAux goles
atajaronSuplentesAux :: [Int] -> Int
atajaronSuplentesAux [] = 0
atajaronSuplentesAux (x:xs) = x + atajaronSuplentesAux xs

aplanar :: [(String,String)] -> [String]
aplanar [] = []
aplanar ((x,y):xs) = x:y:aplanar xs

pertenece :: String -> [String]->Bool
pertenece _ [] = False
pertenece x (y:ys)| x == y = True
                  | otherwise = pertenece x ys

equiposValidos :: [(String, String)] -> Bool
equiposValidos [] = True
equiposValidos((x,y):xs) = not(pertenece x (y:aplanar xs)) && not(pertenece y (x:aplanar xs))



-- 3) Porcentaje de goles
-- problema porcentajeDeGoles (arquero: String, arquerosPorEquipo: seq<String X String>, goles: seq<Z>): R {
-- 	requiere: {La segunda componente de algún elemento de arquerosPorEquipo es arquero}
-- 	requiere: {equiposValidos(arquerosPorEquipo)}
-- 	requiere: {|arquerosPorEquipo| = |goles|}
-- 	requiere: {Todos los elementos de goles son mayores o iguales a 0}
-- 	requiere: {Hay al menos un elemento de goles mayores estricto a 0}
-- 	asegura: {
-- 	res es el porcentaje de goles que recibió arquero sobre el total de goles recibidos por arqueros titulares
-- 	}
-- }

-- Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como float la división entre dos
-- numeros de tipo Int.

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b
porcentajeDeGoles :: String -> [(String, String)] -> [Int] -> Float --atajaronSuplentesAux en este contexto funciona como la sumatoria de goles
porcentajeDeGoles arquero arquerosPorEquipo goles = division (golesdelarquero arquero arquerosPorEquipo goles * 100)  (atajaronSuplentesAux goles)

-- 4) Valla Menos Vencida
-- problema vallaMenosVencida (arquerosPorEquipo: seq<String X String>, goles: seq<Z>): String {
-- 	requiere: {equiposValidos(arquerosPorEquipo)}
-- 	requiere: {|arquerosPorEquipo| = |goles|}
-- 	requiere: {Todos los elementos de goles son mayores o iguales a 0}
-- 	requiere: {|goles| > 0}
-- 	asegura: {
-- 	res es alguno de los arqueros de arquerosPorEquipo que menor goles recibió de acuerdo a goles
-- 	}
-- }

golesdelarquero :: String -> [(String,String)] -> [Int] -> Int
golesdelarquero arquero ((x,y):xs) (g:gs) | arquero == y = g
                                          | otherwise = golesdelarquero arquero xs gs

-- vallaMenosVencida :: [(String,String)] -> [Int] -> String
-- vallaMenosVencida [(x,y)] [g] = y
-- vallaMenosVencida ((x,y):xs) (g:gs) | g < golesdelarquero (vallaMenosVencida xs gs ) xs gs = y
--                                     | otherwise = vallaMenosVencida xs gs

-- es una recursion peculiar, primero desglosa la lista de todos los arqueros y sus goles y se toma al ulitmo arquero/gol recursionado como caso base
-- una vez hecho esto se compara ese ultimo arquero con los demas arqueros hasta encontrar el que tiene menos goles

vallaMenosVencida :: [(String, String)] -> [Int] -> String
vallaMenosVencida [(x, y)] [g] = y
vallaMenosVencida ((x, y):xs) (g:gs) = recorrerLista y g xs gs

recorrerLista :: String -> Int -> [(String, String)] -> [Int] -> String
recorrerLista arqueroMenosGoles cantMenorGoles [] [] = arqueroMenosGoles
recorrerLista arqueroMenosGoles cantMenorGoles ((x, y):xs) (g:gs)
    | g < cantMenorGoles = recorrerLista y g xs gs --actualizamos los valores de y siendo y el nuevo arquero candidato y g la nueva cantMenorGoles
    | otherwise = recorrerLista arqueroMenosGoles cantMenorGoles xs gs -- si g no es menor a cantMenorGoles  seguimos con los candidatos actuales


elementoEn :: [a] -> Int -> a
elementoEn (x:xs) n
    | n == 0 = x
    | otherwise = elementoEn xs (n - 1)

hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar c [] = False
hayQueCodificar c ((x,y):xs) | c == x = True
                             | otherwise = hayQueCodificar c xs

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar c frase mapeo | hayQueCodificar c mapeo = contarOcurrencias c frase 
                                          | otherwise = 0
contarOcurrencias :: Char -> [Char] -> Int
contarOcurrencias c [] = 0
contarOcurrencias c (x:xs) | c == x = 1 + contarOcurrencias c xs
                           | otherwise = contarOcurrencias c xs

laQueMasHayQueCodificar :: [Char] -> [(Char, Char)] -> Char
laQueMasHayQueCodificar frase mapeo = laQueMasHayQueCodificarAux frase frase mapeo 
laQueMasHayQueCodificarAux :: [Char] -> [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificarAux [f] _ _ = f
laQueMasHayQueCodificarAux (f1:f2:fs) fraseOriginal mapeo
  | f1 == f2 = laQueMasHayQueCodificarAux (f1:fs) fraseOriginal mapeo
  | cuantasVecesHayQueCodificar f1 fraseOriginal mapeo >= cuantasVecesHayQueCodificar f2 fraseOriginal mapeo = laQueMasHayQueCodificarAux (f1:fs) fraseOriginal mapeo
  | otherwise = laQueMasHayQueCodificarAux (f2:fs) fraseOriginal mapeo

obtenerReemplazo :: Char -> [(Char,Char)] -> Char
obtenerReemplazo caracter ((a,reemplazo):xs) | caracter== a = reemplazo
                            | otherwise = obtenerReemplazo caracter xs
codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [] _ = []
codificarFrase (f:fs) mapeo | hayQueCodificar f mapeo = obtenerReemplazo f mapeo : codificarFrase fs mapeo
                            | otherwise = f : codificarFrase fs mapeo