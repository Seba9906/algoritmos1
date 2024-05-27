def pertenece(l:list,e:int)->bool:
    for i in range(len(l)):
        if l[i] == e:
            return True
    return False
def pertenece1(l:list,e:int)->bool:
    return True if e in l else False
def pertenece2(l:list,e:int)->bool:
    if e in l:
        return True
    else:
        return False        
# print(pertenece([1,2,3,4],2))
# print(pertenece1([1,2,3,4],0))
# print(pertenece2([1,2,3,4],2))

def divide_a_todos(l:list,e:int)->bool:
    for i in range(len(l)):
        if l[i] % e == 0:
            i+=1
        else:
            return False
    return True
# print(divide_a_todos([24,4,6,7],2))

def suma_total(l:list)->int:
    contador:int=0
    for i in range(len(l)):
        contador+= l[i]
    return contador
# print(suma_total([1,2,3,-1]))

def ordenados(l:list)->bool:
    for i in range(len(l)-1):
        if l[i] > l[i+1]:
            return False
    return True
# print(ordenados([1,2,3,2]))

def lista_palabras(l:list)->bool:
    for palabra in l:
        if len(palabra) > 7:
            return True
    return False
# print(lista_palabras(["que", "pesados"]))

def palindromo(texto:str)->bool:
    texto_limpio = ''.join(texto.split()).lower()
    texto_invertido = texto_limpio[::-1]
    return  texto_limpio == texto_invertido
# print(palindromo("neuQuen"))

def fortaleza_contraseña(contraseña:str)->str:
    minusculas:int=0
    mayusculas:int=0
    numeros:int=0
    for digito in contraseña:
        if digito.islower():
            minusculas+=1
        elif digito.isupper():
            mayusculas+=1
        elif digito.isdigit():
            numeros+=1
    if len(contraseña) <= 5:
        return "ROJA"
    elif len(contraseña) > 8 and minusculas >= 1 and mayusculas >= 1 and numeros >= 1:
        return "VERDE"
    else:
        return "AMARILLO"
# print(fortaleza_contraseña("123huygutyfdrxjfchgvuh897+))"))  
# print(fortaleza_contraseña("123qwertIOP"))  
# print(fortaleza_contraseña("123s5"))  #me devuelve amarillo si usp len(contraseña) < 5 consultar por qué

def movimientos_bancarios(historial:list)->list:
    saldo_inicial:int=0
    for operacion,monto in historial:
        if operacion == "I":
            saldo_inicial+=monto
        elif operacion == "R":
            saldo_inicial -= monto
    return saldo_inicial
# print(movimientos_bancarios([("I",2000),("R",100),("I",50)])) 

def vocales_distintas(palabra:str)->bool:
    palabra = palabra.lower()
    vocales_halladas:list=[]
    for vocal in palabra:
        if vocal in 'aeiou' and vocal not in vocales_halladas:
            vocales_halladas.append(vocal)
    return len(vocales_halladas)>=3
# print(vocales_distintas("mueeeeee"))

#------------------Parte 2--------------------------------------
def reemplazar_pares_inout(l:list)->list:
    for i in range(len(l)):
        if l[i] % 2 == 0:
            l[i] = 0
    return l
# print(reemplazar_pares_inout([1,2,3,4]))
def reemplazar_pares_in(l:list)->list:
    modificada:list=[]
    for i in range(len(l)):
        if l[i] % 2==0:
            modificada.append(0)
        else:
            modificada.append(l[i])
    return modificada
print(reemplazar_pares_in([1,2,3,4]))

def cadena_sin_vocales(palabra:str)->str:
    palabra_sin_vocales:str=""
    for caracter in palabra:
        if caracter not in 'aáAÁeéEÉiíIÍoóOÓuúUÚ':
            palabra_sin_vocales+=caracter
        else:
            palabra_sin_vocales
    return palabra_sin_vocales
# print(cadena_sin_vocales("asdefru")) #si la cadena tiene espacios se imprimen o se sacan? 

def reemplaza_vocales(cadena:str)->str:
    resultado:str=""
    for caracter in cadena:
        if caracter in "aáAÁeéEÉiíIÍoóOÓuúUÚ":
            resultado+="_"
        else:
            resultado+=caracter
    return resultado
# print(reemplaza_vocales("reemplaza las vocales"))

def da_vuelta_str(cadena:str)->str:
    cadena_inversa=cadena[::-1]
    return cadena_inversa
def da_vuelta_strr(cadena:str)->str:
    resultado:str=""
    for caracter in cadena:
        resultado = caracter + resultado 
    return resultado      
# print(da_vuelta_strr("asd"))

def eliminar_repetidos(cadena:str)->str:
    resultado:str=""
    for caracter in cadena:
        if caracter not in resultado:
            resultado += caracter
        else:
            resultado
    return resultado
# print(eliminar_repetidos("eseeseese"))
