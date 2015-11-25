from django.shortcuts import render
from django.http import HttpResponse

from principal.models import Materia, Carrera, Materias_Carrera

# Create your views here.
def verMaterias(request):
    miCarrera = request.user.usuario.carrera
    matsCarrera = Materias_Carrera.objects.filter(carrera=miCarrera)
    lista_materias = []
    for relacion in matsCarrera:
        lista_materias.append(Materia.objects.get(materia=relacion.materia))

    return render(request, 'carrera/verMaterias.html',{
    	'lista_materias' : lista_materias,
    	'carrera' : miCarrera,
    })

def verCarrera(request):
#    miUsername = request.user.usuario.username
#    miNombre = request.user.usuario.first_name
#	miApellido = request.user.usuario.last_name
    miCarrera = request.user.usuario.carrera

    return render(request, 'carrera/verCarrera.html',{
#    	'usuario' : miUsername,
#    	'nombres' : miNombre,
#    	'apellidos' : miApellido,
    	'carrera' : miCarrera,
    })

#def verTemas(request):
#    miCarrera = request.user.usuario.carrera
#    matsCarrera = Materias_Carrera.objects.filter(carrera=miCarrera)
#    lista_materias = []
#    lista_temas = []
#    for relacion in matsCarrera:
#        lista_materias.append(Materia.objects.get(materia=relacion.materia))
#    for rel2 in 
#    return render(request, 'carrera/verMaterias.html',{
#    	'lista_materias' : lista_materias,
#    	'carrera' : miCarrera,
#    })