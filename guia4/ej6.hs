--mod n 10 → me da el ultimo digito de n.
--div n 10 → le saca el ultimo digito a n
sumaDigitos :: Integer -> Integer 
sumaDigitos n     | n == 0 = 0
                  | otherwise = n `mod` 10 + sumaDigitos(sacoUltimoDigito n) --esto es como un contador en imperativo. el primer numero indica de a cuanto quiero sumar
sacoUltimoDigito :: Integer -> Integer
sacoUltimoDigito x = div x 10