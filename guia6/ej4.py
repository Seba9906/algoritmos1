# def peso_pino(altura:int)->int:
#     if altura <= 3:
#         peso:int = altura * 300
#     else:
#         peso = 900 + (altura - 3) * 200 #un pino de 3 metros pesa 900 kilos, asi que sumamos eso y restamos la altura representativa de esos 900 kg
#     return peso
# altura = 3
# # print(peso_pino(altura))

# def es_peso_util(peso_util:int)->bool:
#     return 400 <= peso_util <=1000
# # print(es_peso_util(1200))

# def sirve_pino(altura: int) -> str:
#     peso = peso_pino(altura)
#     if 400 <= peso <= 1000:
#         return f"un pino de {altura} metros de altura pesa {peso_pino(altura)} kg y es util"
#     else:
#         return f"un pino de {altura} metros de altura pesa {peso_pino(altura)} kg y no le sirve a la fabrica"
# print(sirve_pino(3))
# print(sirve_pino(10))

def peso_pino(altura:int)->int:
    altura_cm:int = altura *100
    peso_primera_parte:int = min(altura_cm,300) * 3 #si la altura es mayor a 300 devolvemos 300
    peso_segunda_parte:int = max(0,altura_cm-300)*2 #si la altura es menor a 300 al restarlo nos quedara 0 o negativo y devolvera 0
    return peso_primera_parte + peso_segunda_parte
# print(peso_pino(40))

def es_peso_util(peso: int) -> bool:
    return max(400, peso) == min(1000, peso)
# print(es_peso_util(200))
def sirve_pino(altura: int) -> bool:
    peso = peso_pino(altura)
    return max(400, peso) == min(1000, peso)
# print(sirve_pino(5))
def sirve_pinoo(altura:int):
    return es_peso_util(peso_pino(altura))
# print(sirve_pinoo(5))