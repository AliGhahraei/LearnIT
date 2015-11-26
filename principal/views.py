from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from principal.models import Usuario, Materia, Carrera, Materias_Carrera
from django.contrib.auth.models import User

@login_required
def index(request):
    miCarrera = request.user.usuario.carrera
    miUsername = request.user.username
    miCorreo = request.user.email
    miNombre = request.user.first_name
    miApellido = request.user.last_name

    matsCarrera = Materias_Carrera.objects.filter(carrera=miCarrera)
    lista_materias = []
    for relacion in matsCarrera:
        lista_materias.append(Materia.objects.get(materia=relacion.materia))

    return render( request, 'principal/index.html', {
    	'usuario' : miUsername,
    	'nombres' : miNombre,
    	'correo' : miCorreo,
    	'apellidos' : miApellido,
    	'carrera' : miCarrera,
    	'lista_materias' : lista_materias
    })
