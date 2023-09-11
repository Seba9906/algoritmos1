absoluto :: Int -> Int
absoluto n | n >= 0 = n
           | otherwise = -n
absolutoMaximo :: Int -> Int -> Int
absolutoMaximo n m| (absoluto n) >= (absoluto m) = n
                  | otherwise = (absoluto m)