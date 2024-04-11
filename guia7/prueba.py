def ultima_aparicion(l:list,e:int)->int:
    acum:int=0
    for i in range(len(l)):
        if l[i] == e:
            acum = i
    return acum
# print(ultima_aparicion([-5,5,5,5,5,-5,-5],-5))

def elementos_exclusivos(l:list,t:list)->list:
    res:list=[]
    for element in l:
        if element not in t and element not in res:
            res.append(element)
    for element in t:
        if element not in l and element not in res:
            res.append(element)
    return res
l=[1,2,3,3,35,4,6,9]
t=[3,4,2,2,2,3,3,5,4,6,2]
print(elementos_exclusivos(l,t))
