import math
#1
def imprimir_hola_mundo() -> str:
    return "Hola Mundo"
# print(imprimir_hola_mundo())

#2
def imprimir_un_verso() -> str:
    print("este es un verso \ncon salto de linea ")
# imprimir_un_verso()

#3
def raizDe2(x: int) -> int:
    return round(math.sqrt(x), 4)
# print(raizDe2(2))

#4
def factorial_de_dos(n:int)->int:
    if n == 0:
        return 1
    else:
        return n * factorial_de_dos(n - 1)
# print(factorial_de_dos(2))

#5
def periemtro()->float:
    radio:float = 1
    res = 2 * math.pi * radio
    return round(res,4)
print(periemtro())


