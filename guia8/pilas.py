from queue import LifoQueue as Pila
from queue import Queue as Cola
import random
def generar_nros_al_azar(n:int,desde:int,hasta:int)->Pila:
    p = Pila()
    for _ in range(n):
        p.put(random.randint(desde,hasta))
    return p
# n = 5
# desde=10
# hasta=458
# pila=generar_nros_al_azar(n,desde,hasta)
# while not pila.empty():
#     print(pila.get())

def cantidad_de_elementos(p:Pila)->int:
    pila_temporal = Pila()
    contador:int=0
    while not p.empty():
        pila_temporal.put(p.get())
        contador+=1
    while not pila_temporal.empty():
        p.put(pila_temporal.get())
    return contador

def copiaPila(p:Pila)->Pila:
    elementos:[int] = []
    while not p.empty():
        elementos.append(p.get())
    p_copia: Pila = Pila()
    for i in range(len(elementos)-1,-1,-1):
        p.put(elementos[i])
        p_copia.put(elementos[i])
    return p_copia

def buscar_el_maximo(p:Pila) ->int:
    p_copia:Pila=copiaPila(p)
    while not p_copia.empty():
        a = p_copia.get()
        if p_copia.empty():
            return a
        b= p_copia.get()
        if a>b:
            p_copia.put(a)
        else:
            p_copia.put(b)

def pila_a_lista(p:Pila)->list:
    elem_temporales = []
    elem = []
    while not p.empty():
        elem = p.get()
        elem_temporales.append(elem)
    while elem_temporales:
        elem = elem_temporales.pop()
        p.put(elem)
        elem.append(elem)
    return elem
# p = Pila()
# p.put(1)
# print(pila_a_lista(p))
# p.put(2)
# print(pila_a_lista(p))
# p.put(3)
# print(pila_a_lista(p))
# print(buscar_el_maximo(p))
def esta_bien_balanceada(s:str)->bool:
    balance:int=0
    for char in s:
        if char == "(":
            balance+=1
        elif char == ")":
            balance-=1
            if balance < 0:
                return False #caso ')('
    return balance == 0

def evaluar_expresion(expresion:str)->int:
    tokens = expresion.split()
    p=Pila()
    for token in tokens:
        if token.isdigit():
            p.put(int(token))
        else:
            b = p.get()
            a = p.get()
            if token == '+':
                resultado = a + b
            elif token == '-':
                resultado = a - b
            elif token == '*':
                resultado = a*b
            elif token == '/':
                resultado = a/b
            p.put(resultado) #apilo resultado
    return p.get()
# expresion = "3 4 + 5 * 2 -"
# resultado = evaluar_expresion(expresion)
# print(resultado)

def generar_nros_al_azar_cola(n:int,desde:int,hasta:int)->Cola:
    pila_de_numeros = generar_nros_al_azar(n,desde,hasta)
    cola = Cola()
    while not pila_de_numeros.empty():
        cola.put(pila_de_numeros.get())
    return cola
# n = 10  
# desde = 1 
# hasta = 100  

# cola_de_numeros = generar_nros_al_azar_cola(n, desde, hasta)


# while not cola_de_numeros.empty():
#     print(cola_de_numeros.get(), end='-')
def generar_nros_al_azar_cola_v2(n:int,desde:int,hasta:int)->Cola:
    cola=Cola()
    while n>0:
        nro_randon = random.randint(desde,hasta)
        cola.put(nro_randon)
        n-=1
    return cola
# n = 10  
# desde = 1 
# hasta = 100  

# cola_de_numeros = generar_nros_al_azar_cola_v2(n, desde, hasta)


# while not cola_de_numeros.empty():
#     print(cola_de_numeros.get(), end=' ')
def cantidad_de_elementos_cola(c:Cola)->int:
    cola_temporal:Cola=Cola()
    contador:int=0
    while not c.empty():
        cola_temporal.put(c.get())
        contador+=1
    while not cola_temporal.empty():
        c.put(cola_temporal.get())
    return contador
def imprimir_elementos_cola(c: Cola):
    cola_temporal = Cola()
    while not c.empty():
        elemento = c.get()
        print(elemento, end=' ')
        cola_temporal.put(elemento)
    while not cola_temporal.empty():
        c.put(cola_temporal.get())
    print()  # Para añadir una nueva línea al final
# c=Cola()
# c.put(1)
# c.put(2)
# c.put(3)
# c.put(4)
# print(cantidad_de_elementos(c))

# print("Contenido de la cola antes de cantidad_de_elementos_cola:")
# imprimir_elementos_cola(c)

# contador = cantidad_de_elementos_cola(c)
# print(f"La cola tiene {contador} elementos.")

# print("Contenido de la cola después de cantidad_de_elementos_cola:")
# imprimir_elementos_cola(c)

def copiaCola(c:Cola)->Cola:
    c_copia=Cola()
    c_temporal=Cola()
    while not c.empty():
        elemento = c.get()
        c_copia.put(elemento)
        c_temporal.put(elemento)
    while not c_temporal.empty():
        c.put(c_temporal.get())
    return c_copia
def buscar_el_maximo_cola(c:Cola)->int:
    cola_copia=copiaCola(c)
    while not c.empty():
        a = cola_copia.get()
        if cola_copia.empty():
            return a
        b = cola_copia.get()
        if a>b:
            cola_copia.put(a)
        else:
            cola_copia.put(b)
    return cola_copia.get()
def armarSecuenciaBingo()->Cola:
    lista=list(range(0,10))
    random.shuffle(lista)
    bolillero:Cola=Cola()
    for bolilla in lista:
        bolillero.put(bolilla)
    return bolillero
def jugarCartonDeBingo(carton:list,bolillero:Cola) ->int:
    cantSinMarcar:int = len(carton) #veo de cuanto es el carton
    jugadas:int=0
    bolilleroAux:Cola=Cola() #cola para almacenar bolillas
    while cantSinMarcar > 0:
        numero:int=bolillero.get()#saco una bolilla
        bolilleroAux.put(numero)
        if numero in carton:
            cantSinMarcar-=1
        jugadas+=1
    while not bolillero.empty():
        bolilleroAux.put(bolillero.get())
    while not bolilleroAux.empty():
        bolillero.put(bolilleroAux.get())
    return jugadas

def pacienteUrgentes(c:Cola)->int:
    cAux=copiaCola(c)
    contadorUrgentes:int=0
    while not cAux.empty():
        prioridad,nombre,especialidad=cAux.get()
        if 1<=prioridad<=3:
            contadorUrgentes+=1
    return contadorUrgentes
# cola_pacientes = Cola()
# cola_pacientes.put((2, 'Juan Perez', 'Cardiología'))
# cola_pacientes.put((5, 'Maria Gomez', 'Traumatología'))
# cola_pacientes.put((1, 'Carlos Diaz', 'Neurología'))
# cola_pacientes.put((3, 'Ana Ruiz', 'Pediatría'))

# print(pacienteUrgentes(cola_pacientes))

def a_clientes(c:Cola)->Cola:
    colaPrioritaria = Cola()
    colaPreferencial = Cola()
    colaRegular = Cola()
    while not c.empty():
        cliente = c.get()
        nombreApellido,dni,cuentaPreferencial,tienePrioridad = cliente
        if tienePrioridad:
            colaPrioritaria.put(cliente)
        elif cuentaPreferencial:
            colaPreferencial.put(cliente)
        else:
            colaRegular.put(cliente)
    #juntamos todo en la cola final con el orden correcto de atencion
    colaFinal:Cola = Cola()
    while not colaPrioritaria.empty():
        colaFinal.put(colaPrioritaria.get())
    while not colaPreferencial.empty():
        colaFinal.put(colaPreferencial.get())
    while not colaRegular.empty():
        colaFinal.put(colaRegular.get())
    return colaFinal
# Ejemplo de uso
cola_ingreso = Cola()
cola_ingreso.put(('Juan Pérez', 12345678, False, True))
cola_ingreso.put(('Juan Pazz', 12345378, True, True))

cola_ingreso.put(('María González', 23456789, True, False))
cola_ingreso.put(('Carlos Ruiz', 34567890, False, False))

cola_atencion = a_clientes(cola_ingreso)
while not cola_atencion.empty():
    cliente_atendido = cola_atencion.get()
    print(cliente_atendido)


def cuenta_posiciones_por_nacion(naciones, torneos):
    # Inicializar el diccionario resultados
    resultados = {}
    for nacion in naciones:
        resultados[nacion] = [0] * len(naciones)
    
    # Iterar sobre cada torneo
    for anio, posiciones in torneos.items():
        # Iterar sobre los índices de las posiciones para ese año
        for i in range(len(posiciones)):
            # Obtener la nación que corresponde a la posición actual
            nacion = posiciones[i]
            # Actualizar la cuenta de la posición para la nación
            resultados[nacion][i] += 1
    
    return resultados

# Ejemplo de uso
naciones = ["arg", "aus", "nz", "sud"]
torneos = {
    2023: ["nz", "sud", "arg", "aus"],
    2022: ["nz", "sud", "aus", "arg"]
}

# Llamando a la función e imprimiendo el resultado
resultado = cuenta_posiciones_por_nacion(naciones, torneos)
for nacion, posiciones in resultado.items():
    print(f"{nacion}: {posiciones}")
