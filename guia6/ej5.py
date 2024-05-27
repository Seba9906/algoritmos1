# def devolver_el_doble_si_es_par(numero:int)->int:
#     return numero*2 if numero % 2 == 0 else numero
# # print(devolver_el_doble_si_es_par(5))
# def devolver_el_doble_si_es_parV2(numero: int) -> int:
#     condicion = 1 - (numero % 2)
#     return numero * (1 + condicion)
# # print(devolver_el_doble_si_es_parV2(4))  
# # print(devolver_el_doble_si_es_parV2(5))  

# def devolver_valor_si_es_par_sino_el_que_sigue(numero:int)->int:
#     if numero % 2 == 0:
#         return numero
#     else:
#         return numero+1
# # print(devolver_valor_si_es_par_sino_el_que_sigue(2))

# def devolver_valor_si_es_par_sino_el_que_sigue_2_if(numero:int)->int:
#     if numero % 2 == 0:
#         return numero
#     if numero % 2 != 0:
#         return numero + 1
# # print(devolver_valor_si_es_par_sino_el_que_sigue_2_if(2))
# def devolver_el_doble_si_es_multiplo_3_el_triple_si_es_multiplo9(numero:int)->int:
#     if numero % 9 == 0:
#         return numero * 3
#     elif numero % 3 == 0:
#         return numero * 2
#     else:
#         return numero
# def devolver_el_doble_si_es_multiplo_3_el_triple_si_es_multiplo9_2_if(numero:int)->int:
#     if numero % 9 == 0:
#         return numero * 3 
#     if numero % 3 == 0:
#         return numero * 3
#     return numero
# # print(devolver_el_doble_si_es_multiplo_3_el_triple_si_es_multiplo9_2_if(7))

# def lindo_nombre(nombre:str)->str:
#     if len(nombre) >= 5:
#         return "tu nombre tiene muchas letras!"
#     else:
#         return "tu nombre tiene menos de 5 caracteres"
# # print(lindo_nombre("sebastian"))
# # print(lindo_nombre("seba"))

# def elRango(numero:int) ->str:
#     if numero < 5:
#         return "Menor a 5"
#     elif 10 <= numero <= 20:
#         return "Entre 10 y 20"
#     elif numero > 20:
#         return "Mayor a 20"
#     else:
#         return "Rango no especificado"
# # print(elRango(4)) 
# # print(elRango(6))
# # print(elRango(10))
# # print(elRango(20))
# # print(elRango(22))    
# def vacaciones_o_trabajo(genero:str,edad:int)->str:
#     if edad < 18:
#         return "Anda de vaciones"
#     elif genero == "F" and edad >=60:
#         return "Anda de vacaciones"
#     elif genero == "M" and edad >= 65:
#         return "Anda de vacaciones"
#     else:
#         return "Te toca trabajar"

# def vacaciones_o_trabajo(genero:str,edad:int)->str:
#     if edad < 18 or (genero == 'M' and edad >=65) or (genero == 'F' and edad >=60):
#         return "Anda de vacaciones"
#     else:
#         return "Te toca trabajar"

# # print(vacaciones_o_trabajo("M",45))
# # print(vacaciones_o_trabajo("M",65))
# # print(vacaciones_o_trabajo("M",15))
# # print(vacaciones_o_trabajo("F",45))
# # print(vacaciones_o_trabajo("F",60))
# # print(vacaciones_o_trabajo("F",15))

