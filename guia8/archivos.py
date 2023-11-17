def contar_lineas(nombre_archivo:str)->int:
    archivo = open(nombre_archivo,'r',encoding='utf-8')
    contador:int = 0
    for linea in archivo.readlines():
        contador += 1
    archivo.close()
    return contador
# print(contar_lineas('archivo.txt'))

def existe_palabra(palabra:str,nombre_archivo:str)->bool:
    archivo = open(nombre_archivo,'r',encoding='utf-8')
    for linea in archivo.readlines():
        print(linea)
        if palabra in linea:
            return True
        return False
    archivo.close()
# print(existe_palabra('es','archivo.txt'))

def cantidad_apariciones(nombre_archivo:str,palabra:str)->int:
    archivo = open(nombre_archivo,'r',encoding='utf-8')
    contador:int = 0
    contenido_del_archivo = archivo.read()
    palabras_del_archivo = contenido_del_archivo.split()
    for palabra_del_archivo in palabras_del_archivo:
        if palabra == palabra_del_archivo:
            contador += 1
        archivo.close()
    return contador
# print(cantidad_apariciones('archivo.txt','es'))

def clonar_sin_comentarios(nombre_archivo:str):
    archivo = open(nombre_archivo,'r',encoding='utf-8')
    archivo_sin_comentarios= open('archivo_clonado.txt','w',encoding='utf-8')
    for linea in archivo.readlines():
        linea_limpia = linea.strip() #elimino los espacios al final y al principio de la linea en caso de que hayan
        if not linea_limpia or linea.strip()[0] != '#':
            archivo_sin_comentarios.write(linea)
    archivo.close()
    archivo_sin_comentarios.close()
# clonar_sin_comentarios('archivo.txt')

def invertir_texto(archivo_origen:str,archivo_destino:str):
    contenido:list=[]
    archivo = open(archivo_origen,'r',encoding='utf-8')
    for linea in archivo.readlines():
        contenido.insert(0,linea) #aca lo que hacemos al insertar cada linea nueva en la posicion cero estamos invirtiendo el orden de las lineas alreves: ej- l1 -l2 -l3 pasa a ser l3-l2-l1
        archivo.close()
    destino = open(archivo_destino,'w',encoding=('utf-8'))
    destino.truncate()
    for linea in contenido:
        linea = linea[::-1]
        destino.write(linea)
    destino.close()
# invertir_texto('himno.txt','himno-endiablado.txt')

def frase_al_final(nombre_archivo:str,frase:str):
    #abrimos el archivo y leemos el contenido
    archivo = open(nombre_archivo,'r',encoding='utf-8')
    contenido = archivo.read()
    archivo.close()
    #ahora lo trabajamos en modo escritura
    archivo = open(nombre_archivo,'w',encoding='utf-8')
    archivo.write(contenido) #por esto almacenamos el contenido del archivo previo ya que al abrirlo en modo escritura se borrara todo lo que tenia previamente
    archivo.write("\n" + frase)
    archivo.close()
# frase_al_final('archivo.txt','sweet dreams are made of this')

def frase_al_principio(nombre_archivo:str,frase:str):
    archivo = open(nombre_archivo,'r',encoding='utf-8')
    contenido = archivo.read()
    archivo.close()    
    archivo = open(nombre_archivo,'w',encoding='utf-8')
    archivo.write(frase + "\n")
    archivo.write(contenido)
    archivo.close()
frase_al_principio('archivo.txt','the beautiful people')