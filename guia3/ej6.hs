bisiesto :: Integer ->Bool
bisiesto anio = (esMultiploDe anio 4) ||(not(esMultiploDe anio 100) && esMultiploDe anio 400)
      where
            esMultiploDe x y = x `mod` y == 0
            