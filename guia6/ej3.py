from ej2 import es_multiplo_de
#1
def alguno_es_0(nro1:float,nro2:float)->bool:
    return nro1==0 or nro2==0
# print(alguno_es_0(0.23,4))

#2
def ambos_son_0(nro1:float,nro2:float)->bool:
    return nro1 == 0 and nro2 == 0
# print(ambos_son_0(1,0))

#3
def es_nombe_largo(nombre:str)->bool:
    return 3 <= len(nombre) <= 8
# print(es_nombe_largo(""))

#4
def es_bisiesto(año:int)->bool:
    return es_multiplo_de(año,400) or (es_multiplo_de(año,4) and not (es_multiplo_de(año,100) ))
# print(es_bisiesto(2020))
