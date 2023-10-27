division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)
sumatoria :: [Int]->Int
sumatoria [] = []
sumatoria (x:xs) = x + sumatoria xs
votosRecibidos :: String -> [(String,String)] -> [Int]-> Int
votosRecibidos _ [(a,b)] [x] = x
votos