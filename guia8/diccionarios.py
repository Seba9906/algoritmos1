def agrupar_por_longitud(nombre_archivo:str):
    diccionario:dict[int]={}
    archivo = open(nombre_archivo,'r',encoding='utf-8')
    palabras = archivo.read().split()
    archivo.close()
    for palabra in palabras:
        longitud_palabra=len(palabra)
        if longitud_palabra in diccionario:
            diccionario[longitud_palabra] += 1
        else:
            diccionario[longitud_palabra] = 1
    return diccionario
# print(agrupar_por_longitud('archivo.txt'))

def frecuencias(nombre_archivo:str)->dict:
    archivo = open(nombre_archivo, "r", encoding='utf8')
    lineas = archivo.readlines()
    archivo.close()
    frecuencia: dict = {}
    for linea in lineas:
        palabras = linea.split()
        for palabra in palabras:
            if palabra not in frecuencia:
                frecuencia[palabra] = 1
            else:
                frecuencia[palabra] += 1
    return frecuencia

def la_palabra_mas_frecuente(nombre_archivo: str) -> str:
    frecuencia_palabras = frecuencias(nombre_archivo)
    palabra_mas_frecuente: str = ''
    max_frecuencia: int = 0
    for palabra, frecuencia in frecuencia_palabras.items():
        if frecuencia > max_frecuencia:
            max_frecuencia = frecuencia
            palabra_mas_frecuente = palabra
    return f"la palabra mas frecuente es {palabra_mas_frecuente}"

# print(la_palabra_mas_frecuente('archivo.txt'))

def indice_nesima_ocurrencia(lista, elemento, n):
    contador = 0  # Contador para la cantidad de veces que hemos visto el elemento
    indice = 0  # Variable para rastrear el índice actual
    
    # Iterar sobre la lista
    for actual in lista:
        # Verificar si el elemento actual es igual al elemento que estamos buscando
        if actual == elemento:
            contador += 1  # Incrementar el contador
            # Verificar si hemos alcanzado la n-ésima ocurrencia
            if contador == n:
                return indice  # Retornar el índice actual
        indice += 1  # Incrementar el índice
    
    # Si hemos llegado al final sin encontrar la n-ésima ocurrencia, retornar None o -1
    return None

# Ejemplo de uso:
lista = [-1,1,1,5,3,1,2,8]
elemento = 1
n = 2
indice = indice_nesima_ocurrencia(lista, elemento, n)
print(indice)  # Salida esperada: 5


def enesima_aparicion(lista:list,n:int,e:int)->int:
    apariciones = 0
    indice_actual = 0
    for elemento in lista:
        if elemento == e:
            apariciones += 1
            if apariciones == n:
                return indice_actual
        indice_actual += 1
    return None

def es_capicua(lista:list):
    return lista == lista[::-1]
def todas_capicuas(lista_de_listas:list[list[int]])->bool:
    for lista in lista_de_listas:
        if not es_capicua(lista):
            return False
    return True




def contar_posiciones(caballos, carreras):
    # Inicializar el diccionario de resultados con listas de ceros
    resultados = {}
    for caballo in caballos:
        resultados[caballo] = [0] * len(caballos)

    # Iterar sobre cada carrera y las posiciones de llegada
    for lista_caballos in carreras.values():
        for posicion in range(len(lista_caballos)):
            # Obtener el nombre del caballo en la posición actual
            caballo = lista_caballos[posicion]
            # Incrementar el contador de la posición en la que llegó el caballo
            resultados[caballo][posicion] += 1

    return resultados

# Datos de ejemplo
caballos = ["rayo", "pepe", "toto"]
carreras = {
    "carrera1": ["pepe", "rayo", "toto"],
    "carrera2": ["rayo", "pepe", "toto"]
}

# Aplicar la función y mostrar el resultado
res = contar_posiciones(caballos, carreras)
print(res)

def longitud_maxima(lista_de_listas):
    maxima_longitud = 0
    for lista in lista_de_listas:
        if len(lista) > maxima_longitud:
            maxima_longitud = len(lista)
    return maxima_longitud

def intercalar_listas(lista_de_listas):
    # Usa la función auxiliar para encontrar la longitud de la lista más larga
    max_length = longitud_maxima(lista_de_listas)
    
    # Lista para guardar los elementos intercalados
    resultado = []
    
    # Itera sobre el rango del tamaño de la lista más larga
    for i in range(max_length):
        # Itera sobre cada lista en la lista de listas
        for lst in lista_de_listas:
            # Asegúrate de no salirte del índice de la lista actual
            if i < len(lst):
                # Agrega el elemento actual al resultado
                resultado.append(lst[i])
    
    return resultado

# Ejemplo de uso:
listas = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]
intercalada = intercalar_listas(listas)
print(intercalada)  # Salida esperada: [1, 4, 6, 2, 5, 7, 3, 8, 9]
