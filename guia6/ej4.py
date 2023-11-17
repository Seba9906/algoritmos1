def peso_pino(altura:int)->int:
    if altura <= 3:
        peso:int = altura * 300
    else:
        peso = 900 + (altura - 3) * 200 #un pino de 3 metros pesa 900 kilos, asi que sumamos eso y restamos la altura representativa de esos 900 kg
    return peso
altura = 3
# print(peso_pino(altura))

def es_peso_util(peso_util:int)->bool:
    return 400 <= peso_util <=1000
# print(es_peso_util(1200))

def sirve_pino(altura: int) -> str:
    peso = peso_pino(altura)
    if 400 <= peso <= 1000:
        return f"un pino de {altura} metros de altura pesa {peso_pino(altura)} kg y es util"
    else:
        return f"un pino de {altura} metros de altura pesa {peso_pino(altura)} kg y no le sirve a la fabrica"
print(sirve_pino(3))
print(sirve_pino(10))