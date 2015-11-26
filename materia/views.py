from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from principal.models import Usuario, Materia, Tema, Temas_Materia
from django.contrib.auth.models import User
# Create your views here.


@login_required
def verTemas(request, idMateria):
	miMateria = Materia.objects.filter(pk=idMateria)
	nombreMateria = miMateria[0]
	listTemas = Temas_Materia.objects.filter(materia=miMateria)
	return render(request, 'materia/verTemas.html',{
	'listTemas': listTemas,
	'materia' : miMateria,
	'nMateria' : nombreMateria,
	})