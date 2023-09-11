absoluto :: Int -> Int
absoluto n | n >= 0 = n
           | otherwise = -n
absolutoMaximo :: Int -> Int -> Int
absolutoMaximo n m| (absoluto n) >= (absoluto m) = n
                  | otherwise = (absoluto m)
maximo3 :: Int -> Int -> Int -> Int
maximo3 m n o
  | m >= n && m >= o = m
  | n >= m && n >= o = n
  | otherwise = o
