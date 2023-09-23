esDivisible :: Integer ->Integer ->Bool
esDivisible x y
      | x == y = True
      | x <= y = False
      | otherwise = esDivisible(x-y) y
