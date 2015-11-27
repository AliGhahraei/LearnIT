from django.shortcuts import render
from django.http import HttpResponseRedirect
from django import forms
from django.contrib.auth.decorators import login_required
from django.utils.safestring import mark_safe
from django.forms.formsets import BaseFormSet

from django.forms.models import ModelForm
from principal.models import Materia, Carrera, Materias_Carrera,Temas_Materia, Tema, Usuario
from django.contrib.auth.models import User

def requerido(stringOriginal):
	return mark_safe(('<span class=error>*</span> '+stringOriginal))

class FormSetRequerido(BaseFormSet):
	def __init__(self, *args, **kwargs):
		super(FormSetRequerido, self).__init__(*args, **kwargs)
		for form in self.forms:
			form.empty_permitted = False

class FormaMateria(ModelForm):
	class Meta:
		model=Materia
		fields=['materia']
		labels = {
			'materia': requerido('Subject Name:')
		}
	def __init__(self, *args, **kwargs):
		super(FormaMateria, self).__init__(*args, **kwargs)
		self.fields['materia'].requred = True

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

@login_required
def crearMateria(request):
	if request.method == 'POST':
		formMateria = FormaMateria(request.POST, prefix='materia')
		if formMateria.is_valid():
			materia = formMateria.save()
			relMateriasCarrera = Materias_Carrera()
			relMateriasCarrera.carrera=request.user.usuario.carrera
			relMateriasCarrera.materia=materia
			relMateriasCarrera.save()
			return HttpResponseRedirect('/')
	else:
		formMateria = FormaMateria(prefix='materia')

	return render(request, 'materia/crearMateria.html', {
		'formMateria': formMateria,
		})
