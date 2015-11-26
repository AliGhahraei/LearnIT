from django.shortcuts import render
from django.http import HttpResponse

from principal.models import Usuario, Materia, Carrera, Materias_Carrera
from django.contrib.auth.models import User

# Create your views here.
def verCarrera(request):
    miCarrera = request.user.usuario.carrera
    miUsername = request.user.username
    miNombre = request.user.first_name
    miApellido = request.user.last_name

    return render( request, 'carrera/verCarrera.html', {
    	'usuario' : miUsername,
    	'nombres' : miNombre,
    	'apellidos' : miApellido,
    	'carrera' : miCarrera
    })