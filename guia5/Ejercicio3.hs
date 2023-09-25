{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use odd" #-}

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
productoria :: [Integer] -> Integer 
productoria [] = 1
productoria (x:xs) = x * productoria xs
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x > y = maximo (x:xs)
                | otherwise = maximo(y:xs)
sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x:xs) = (x+n) : sumarN n xs
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo (x:xs) = sumarN (head(reverso xs)) (x:xs)
reverso :: [Integer] -> [Integer]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)      | x `mod` 2 /= 0 = pares xs
                  | otherwise = x:pares xs
