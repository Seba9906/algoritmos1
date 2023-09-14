--a)
prodInt :: (Float , Float) -> (Float , Float) -> Float
prodInt v w = ((fst v) * (fst w)) + ((snd v)*(snd w))
-----------------------------------------------------------------------------------------------------
--b)
todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor v w = (fst v) < (fst w) && (snd v) < (snd w)
-----------------------------------------------------------------------------------------------------
--c)
distanciaPuntos :: (Float,Float) -> (Float,Float) -> Float
distanciaPuntos (x1,y1) (x2,y2) = sqrt((x2-x1)^2+(y2-y1)^2)
-----------------------------------------------------------------------------------------------------
--d)
sumaTerna :: (Integer,Integer,Integer) -> Integer
sumaTerna (x,y,z) = x + y + z
-----------------------------------------------------------------------------------------------------
--e)
sumarSoloMultiplos :: (Integer,Integer,Integer) -> Integer -> Integer
sumarSoloMultiplos (x,y,z) n = esMultiplo n x + esMultiplo n y + esMultiplo n z
esMultiplo :: Integer -> Integer -> Integer
esMultiplo x y | y `mod` x == 0 = y 
               | otherwise = 0
--otra forma--
sumarSoloMultiplosV2 :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplosV2 (x, y, z) n =
  esMultiplo n x + esMultiplo n y + esMultiplo n z
  where
    esMultiplo x y
      | y `mod` x == 0 = y
      | otherwise = 0
-----------------------------------------------------------------------------------------------------
--f)
posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (x,y,z) | esPar x && x/=0 =1
                     | esPar y && y/=0 =2
                     | esPar z && z/=0 = 3
                     | otherwise = 4
                     where
                        esPar n = n `mod` 2 == 0
-----------------------------------------------------------------------------------------------------
--g)
crearPar:: a -> b ->(a,b)
crearPar a b = (a,b)
-----------------------------------------------------------------------------------------------------
--h)
invertir :: (a,b) -> (b,a)
invertir v = (snd v, fst v)