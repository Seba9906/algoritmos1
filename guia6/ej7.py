import time
def contador_1_al_10_for():
    for i in range(1,11):
        print(i)
# contador_1_al_10_for()

def contador_1_40_pares_for():
    for i in range(10,41,2):
        print(i)
# contador_1_40_pares_for()

def eco():
    for i in range(0,10):
        print("eco")
# eco()

def lanzamiento_cohete(numero:int):
    for i in range(numero,0,-1):
        print(i)
    print("lanzamiento")
# lanzamiento_cohete(10)

def viaje_en_el_tiempo_for(partida:int,llegada:int):
    for año in range(partida-1,llegada-1,-1):
        print(f"Viajo un año al pasado, esta en el año {año}")
# viaje_en_el_tiempo_for(2020,2010)

def viaje_en_el_tiempo_forV2(partida)->str:
    objetivo=-384
    for año in range(partida,objetivo-1,-20):
        if año > 0:
            print(f"Viajó 20 años al pasado, estamos en el año: {año} d.C")
        elif año ==0:
            print(f"Viajó 20 años al pasado, estamos en el año 0")
        else:
            print(f"Viajó 20 años al pasado, estamos en el año: {-año} a.C")
    print(f"llegamos lo mas cercano al año {-objetivo} d.C")
viaje_en_el_tiempo_forV2(1000)




def ej1()->int:
    for i in range(1,11):
        print(i)
def ej2()->int:
    for i in range(10,41):
        if i%2==0:
            print(i)
def ej3():
    for i in range(0,10):
        time.sleep(0.5)
        print("eco")
def ej4(numero):
    for i in range(numero,0,-1):
        time.sleep(0.5)
        print(i)
    print("despegue")
def ej5(partida:int,llegada:int)->str:
    for i in range(partida,llegada-1,-1):
        print(f"estamos en el año {i}, viajamos un año al pasado")
    print(f"llegamos al año {llegada}")
