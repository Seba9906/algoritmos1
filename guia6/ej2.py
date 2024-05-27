import math
#1
def imprimir_saludo(nombre:str)->str:
    return f"Hola {nombre}"
# print(imprimir_saludo("Pedro"))
#2
def raiz_cuadrada_de(numero:float)->float:
    res = numero ** 0.5
    return res
# print(raiz_cuadrada_de(4))

#3
def fahrenheit_a_celsius(temp_far:float)->float:
    res = (temp_far - 32) * 5 / 9
    return round(res,4)
# print(fahrenheit_a_celsius(0))

#4
def imprimir_dos_veces()->str:
    estribillo:str = """
    
    si me curan las heridas creo en tu voz \n
    creo en la vida en la noche en tu alma y no creo en todo lo demas \n 
    creo en tu estrella en aquella que busco en mis sueño mejor para poder luchar \n
    """
    return estribillo * 2 
# print(imprimir_dos_veces())

#5
def es_multiplo_de(n:int,m:int)->bool:
    return n % m == 0
# print(es_multiplo_de(2,4))

#6
def es_par(numero:int)->bool:
    return es_multiplo_de(numero,2)
# print(es_par(15))

#7
def cantidad_de_pizzas(comensales:int,min_cant_de_porciones:int)->int:
    res = math.ceil(comensales*min_cant_de_porciones/8)
    return f"se necesitan {res} pizzas para {comensales} comensales si cada uno quiere comer minimamente {min_cant_de_porciones} porciones"
# print(cantidad_de_pizzas(5,4))

#8
