from django.shortcuts import render
from django.contrib.auth.decorators import login_required

@login_required
def crearTema(request):
    return render(request, 'temas/crearTema.html')
