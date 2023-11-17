import random
from parte1 import pertenece,ordenados
def reemplazar_pares(lista:list)->list:
    for i in range(len(lista)):
        if i % 2 == 0:
            lista[i] = 0
    return lista
# print(reemplazar_pares([1,1,1,1,1]))

def reemplazar_pares_v2(lista:int)->list:
    lista_nueva=[]
    for indice,numero in enumerate(lista):
        if indice % 2 == 0:
            lista_nueva.append(0)
        else:
            lista_nueva.append(numero)
    return lista_nueva
# print(reemplazar_pares_v2([2,2,2,2,2,2]))

def sin_vocales(cadena:str)->str:
    cadena_sin_vocales:str=""
    for letra in cadena:
        if letra not in 'aeiouAEIOUáéíóúÁÉÍÓÚ ':
            cadena_sin_vocales += letra
        else:
            cadena_sin_vocales
    return cadena_sin_vocales
# print(sin_vocales("qwerty  uiopasdfghjklñ    zxcvbnm"))

def reemplaza_vocales(cadena:str)->str:
    cadena_sin_vocales:str=""
    for letra in cadena:
        if letra not in 'aeiouAEIOUáéíóúÁÉÍÓÚ ':
            cadena_sin_vocales += letra
        else:
            cadena_sin_vocales += "_"
    return cadena_sin_vocales
# print(reemplaza_vocales("ajijojujyuyiyo"))

def da_vuelta_str(cadena:str)->str:
    return cadena[::-1]
# print(da_vuelta_str("hola"))

def eliminar_repetidos(cadena:str)->str:
    cadena_sin_rep:str = ""
    for letra in cadena:
        if letra != ' 'and letra not in cadena_sin_rep:
            cadena_sin_rep += letra
    " ".join(cadena_sin_rep)
    return cadena_sin_rep
# print(eliminar_repetidos("aa eeiio ouupp"))
def promedio(notas:list)->int:
    suma:int = 0
    for nota in notas:
        suma += nota
    return suma/len(notas)

def aprobado(notas:list)->list:
    prom = promedio(notas)    
    mayor_igual_a_4 = True
    alguna_menor_a_4 = False
    for nota in notas:
        if nota < 4:
            mayor_igual_a_4 = False
            alguna_menor_a_4 = True
    if mayor_igual_a_4 and prom >= 7:
        return 1
    elif mayor_igual_a_4 and 4 <= prom < 7:
        return 2
    elif alguna_menor_a_4 or prom <4:
        return 3
# print(aprobado([1,1,10,10]))

def estudiantes()->list:
    nombres = []
    while True:
        nombre = input("Ingrese el nombre del estudiante, ingreso 'listo' para terminar ")
        if nombre == "listo":
            break
        else:
            nombres.append(nombre)
    return nombres
# print(estudiantes())

def sube()->list:
    historial = []
    saldo = 0
    while True:
        ingreso = (input(""" seleccione una opcion:  
    'C' = Cargar creditos,
    'D' = Descontar creditos,
    'X' = Finalizar Simulacion.
    """))
        if ingreso == "X":
            print("finalizando simulacion")
            break
        elif ingreso == 'C':

            monto = int(input("ingrese el monto a cargar: "))
            saldo += monto
            historial.append(("C",monto))
            print(f"credito cargado, saldo acutal: {saldo} ")

        elif ingreso == 'D':
            monto = int(input("ingrese el monto a descontar: "))
            saldo -= monto
            historial.append(("D",monto))
            print(f"credito descontado, saldo actual: {saldo} ")
    return historial 
# print(sube())

def siete_y_medio():

    historial_jugadas = []
    total = 0

    while True:
        carta = random.randint(0,12)

        while carta == 8 or carta == 9:
            carta = random.randint(0,12)

        if carta == 10 or carta == 11 or carta == 12:
            carta = 0.5
        total += carta
        historial_jugadas.append(carta)

        print(f"Has sacado una carta de valor {carta}. Total acumulado: {total}")
        if total == 7.5:
            print("¡Felicidades! Has obtenido 7 y medio.\nEste es el historial de tu partida: ")
            return historial_jugadas
        elif total > 7.5:
            print("Te has pasado de 7.5. ¡Has perdido!\nEste es el historial de tu partida: ")
            return historial_jugadas
        respuesta = input("¿Deseas otra carta? Escribe 'plantar' para terminar tu jugada o 'mas' para una nueva carta: ").lower()
        if respuesta == "plantar":
            print("Has decidido plantarte.\nEste es el historial de tu partida: ")
            return historial_jugadas
# print(siete_y_medio())

def pertenece_a_cada_uno(l:list[list[int]],e:int)->bool:
    res:list[bool] = []
    for sublista in l:
        if pertenece(sublista,e) == True:
            res.append(True)
        else:
            res.append(False)
    return res
# print(pertenece_a_cada_uno([[1,2,3],[1],[23,4,5],[23]],23))

def es_matriz(l:list[list[int]])->bool:
    if len(l) == 0:
        return False
    longitud_fila_referencia = len(l[0])
    for fila in l:
        if len(fila) == 0 or len(fila) != longitud_fila_referencia:
            return False
    return True
def filas_ordenadas(m:list[list[int]])->list[bool]:
    res:list[bool] = []
    for i in m:
        if ordenados(i) == True:
            res.append(True)
        if ordenados(i) == False:
            res.append(False)
    return res
# print(filas_ordenadas([[1,2,3],[4,6,5],[7,8,9]]))
def filas_ordenadas_v2(m:list[list[int]])->list[bool]:
    res:list[bool] = []
    for fila in m:
        res.append(ordenados(fila))
    return res
# print(filas_ordenadas_v2([[1,2,3],[4,6,5],[7,8,9]]))

