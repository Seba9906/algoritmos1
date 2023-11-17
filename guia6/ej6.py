import time
def contador_1_al_10():
    i:int = 1
    while i <= 10:
        print(i)
        i+=1
# contador_1_al_10()
def contador_10_40_pares():
    i:int=10
    while i <= 40:
        if i % 2 == 0:
            print(i)
        i+=1
# contador_10_40_pares()
def eco():
    contador:int = 0
    while contador < 10:
        print("eco")
        contador+=1
# eco()

def lanzamiento_cohete(numero:int):
    while numero>=1:
        print(numero)
        time.sleep(1)
        numero-=1
    print("Despegue!")
# lanzamiento_cohete(10)
def viaje_en_el_tiempo(partida:int,llegada:int):
    while partida >= llegada:
        partida -=1
        print(f"viajo un año al pasado, estamos en el año {partida}")
# viaje_en_el_tiempo(2020,2018)
def viaje_en_el_tiempo_v2(anio_partida):
    anio_objetivo = -384  # 384 a.C. se representa como -384
    
    print("Iniciando viaje en el tiempo...\n")
    while anio_partida > anio_objetivo:
        anio_partida -= 20
        
        if anio_partida >= 0:
            print(f"Estamos en el año {anio_partida} d.C.")
        else:
            print(f"Estamos en el año {-anio_partida} a.C.")
    
    print("\nHemos llegado lo más cerca posible a conocer a Aristóteles en el año 384 a.C.")

# viaje_en_el_tiempo_v2(2010)



