distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) -> Float
distanciaManhattan (x,y,z) (a,b,c) | distanciaAbsoluta (x,y,z) (a,b,c) > 0 = distanciaAbsoluta (x,y,z) (a,b,c)
                                   | otherwise = - (distanciaAbsoluta (x,y,z) (a,b,c))
                                   where
                                          distanciaAbsoluta (x,y,z) (a,b,c) = (x-a) + (y-b) + (z-c)