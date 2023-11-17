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

def viaje_en_el_tiempo_v2(año_partida):
    año_objetivo = -384
    print("Iniciando viaje en el tiempo...\n")
    num_saltos = (año_partida - año_objetivo + 19) // 20
    for i in range(num_saltos):
        if año_partida -20 < año_objetivo:
            año_partida = año_objetivo
        else:
            año_partida -= 20
    
        if año_partida >= 0:
            print(f"Estamos en el año {año_partida} d.C.")
        else:
            print(f"Estamos en el año {-año_partida} a.C.")
    
    print("\nHemos llegado lo más cerca posible a conocer a Aristóteles en el año 384 a.C.")
# viaje_en_el_tiempo_v2(120)