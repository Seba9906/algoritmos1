def pertenece(l:list,e:int)->bool:
    return True if e in l else False
def pertenece_v2(l:list,e:int)->bool:
    if e in l:
        return True
    else:
        return False
def pertenece_v3(l:list,e:int)->bool:
    for i in range(len(l)):
        if l[i] == e:
            return True
    return False
# print(pertenece([1,2,3],3))
# print(pertenece([1,2,2],3))


# print(pertenece_v2([1,2,3],3))
# print(pertenece_v2([1,2,2],3))


# print(pertenece_v3([1,2,3],3))
# print(pertenece_v3([1,2,2],3))
def divideATodos(l:list,e:int)->bool:
    for i in range(len(l)):
        if l[i] % e == 0:
            return True
        else:
            return False

# print(divideATodos([4,6,8],5))

def sumaTotal(l:list)->int:
    contador:int = 0
    for i in range(len(l)):
        contador += l[i]
    return contador
# print(sumaTotal([1,2,3]))

def ordenados(l:list)->bool:
    for i in range(1,len(l)):
        if l[i-1] > l[i]:
            return False
    return True
# print(ordenados([1,1,1,1,2]))

def palabraLarga(l:list)->bool:
    for palabra in l:
        if len(palabra) > 7:
            return True
    return False
# print(palabraLarga(["hola","1230000000"]))

def quitar_tildes(texto: str) -> str:
    reemplazos = {
        'á': 'a', 'é': 'e', 'í': 'i', 'ó': 'o', 'ú': 'u',
        'Á': 'A', 'É': 'E', 'Í': 'I', 'Ó': 'O', 'Ú': 'U'
    }
    for original,reemplazo in reemplazos.items():
        texto = texto.replace(original,reemplazo)
    return texto

def palindromo(texto:str)->bool:
    texto = ''.join(texto.split()).lower()
    print(texto)
    textoLimpio = quitar_tildes(texto)
    print(textoLimpio)
    textoInvetido = textoLimpio[::-1]
    print(textoInvetido)
    return textoLimpio == textoInvetido
# print(palindromo("neuquen u neu quen u "))

def fortaleza_contraseña(contraseña:str)->str:
    minusculas = 0
    mayusculas = 0
    numero = 0
    for digito in contraseña:
        if digito.islower():
            minusculas += 1
        elif digito.isupper():
            mayusculas += 1
        elif digito.isdigit():
            numero += 1
    if len(contraseña) > 8 and minusculas >= 1 and mayusculas >= 1 and numero >= 1:
        return "VERDE"
    if len(contraseña) < 5:
        return "ROJO"
    else:
        return "AMARILLO"
# print(fortaleza_contraseña("123huygutyfdrxjfchgvuh897+´{}"))  

def movimientosCuentaBancaria(historial:list)->int:
    saldo_inicial = 0
    for operacion,monto in historial:
        if operacion == "I":
            saldo_inicial += monto
        elif operacion == "R":
            saldo_inicial -= monto
    return saldo_inicial
# print(movimientosCuentaBancaria([("I",2000),("R",100),("I",50)])) 

def palabra_vocalizada(palabra:str)->bool:
    palabra = palabra.lower()
    vocales:str = set()
    for letra in palabra:
        if letra in "aeiou":
            vocales.add(letra)
    return len(vocales) >= 3
# print(palabra_vocalizada("murceeeeee"))
# no se puede usar set en el parcial :/

def palabra_vocalizada_v2(palabra: str) -> bool:
    palabra.lower()
    vocaleshalladas: list = []
    for letra in palabra:
        if letra in 'aeiou' and letra not in vocaleshalladas:
            vocaleshalladas.append(letra)
    return len(vocaleshalladas) >= 3
# print(palabra_vocalizada_v2("mueeeeeeeeaeeee"))

