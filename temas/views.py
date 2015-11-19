from django.shortcuts import render
from django.http import HttpResponseRedirect
from django import forms
from django.contrib.auth.decorators import login_required
from django.utils.safestring import mark_safe
from django.forms.formsets import BaseFormSet

from django.forms.models import ModelForm
from django.forms import formset_factory
from principal.models import Tema, Ejercicio, Materia, Carrera, Materias_Carrera, Formula, Temas_Materia, Ejercicios_Tema, Formulas_Tema

paginaPrincipal='/'

def requerido(stringOriginal):
    return mark_safe(('<span class=error>*</span> '+stringOriginal))

class FormSetRequerido(BaseFormSet):
    def __init__(self, *args, **kwargs):
        super(FormSetRequerido, self).__init__(*args, **kwargs)
        for form in self.forms:
            form.empty_permitted = False

class FormaTema(ModelForm):
    class Meta:
        model=Tema
        fields=['tema','resumenTeorico', 'referencias']
        labels = {
            'tema': requerido('Name'),        
            'resumenTeorico': 'Summary',        
            'referencias': 'References and external links',        
        }
    def __init__(self, *args, **kwargs):
        super(FormaTema, self).__init__(*args, **kwargs)
        self.fields['tema'].requred = True
        self.fields['resumenTeorico'].required = False
        self.fields['referencias'].required = False

class FormaEjercicios(ModelForm):
    class Meta:
        model=Ejercicio
        fields=['problema','solucion']
        labels = {
            'problema': 'Problem',
            'solucion': 'Solution',
        }
    def __init__(self, *args, **kwargs):
        super(FormaEjercicios, self).__init__(*args, **kwargs)
        self.fields['problema'].required = True
        self.fields['solucion'].required = True

class FormaFormulas(ModelForm):
    class Meta:
        model=Formula
        fields=['formula']
        labels = {
            'formula': 'Formula',
        }

@login_required
def crearTema(request):
    FabricaEjercicios = formset_factory(FormaEjercicios, formset=FormSetRequerido)
    FabricaFormulas = formset_factory(FormaFormulas)
        
    if request.method == 'POST':
        if 'anadirEjercicio' in request.POST:
            copiaPost = request.POST.copy()
            copiaPost['ejercicios-TOTAL_FORMS'] = int(copiaPost['ejercicios-TOTAL_FORMS'])+1
            formTema = FormaTema(request.POST, prefix='tema')
            conjuntoEjercicios = FabricaEjercicios(copiaPost, prefix='ejercicios')
            conjuntoFormulas = FabricaFormulas(request.POST, prefix='formulas')
            
            carreraUsuario = request.user.usuario.carrera
            relMateriasCarrera = Materias_Carrera.objects.filter(carrera=carreraUsuario)
            materias = []
            for relacion in relMateriasCarrera:
                materias.append(Materia.objects.get(materia=relacion.materia))
            noErrores = True

            return render(request, 'temas/crearTema.html', {
                'formTema': formTema, 
                'conjuntoEjercicios': conjuntoEjercicios,
                'conjuntoFormulas': conjuntoFormulas,
                'materias': materias,
                'noErrores': noErrores,
            })

        elif 'anadirFormula' in request.POST:
            copiaPost = request.POST.copy()
            copiaPost['formulas-TOTAL_FORMS'] = int(copiaPost['formulas-TOTAL_FORMS'])+1
            formTema = FormaTema(request.POST, prefix='tema')
            conjuntoEjercicios = FabricaEjercicios(request.POST, prefix='ejercicios')
            conjuntoFormulas = FabricaFormulas(copiaPost, prefix='formulas')
            
            carreraUsuario = request.user.usuario.carrera
            relMateriasCarrera = Materias_Carrera.objects.filter(carrera=carreraUsuario)
            materias = []
            for relacion in relMateriasCarrera:
                materias.append(Materia.objects.get(materia=relacion.materia))
            noErrores = True

            return render(request, 'temas/crearTema.html', {
                'formTema': formTema, 
                'conjuntoEjercicios': conjuntoEjercicios,
                'conjuntoFormulas': conjuntoFormulas,
                'materias': materias,
                'noErrores': noErrores,
            })

        elif 'submit' in request.POST:
            formTema = FormaTema(request.POST, prefix='tema')
            conjuntoEjercicios = FabricaEjercicios(request.POST, prefix='ejercicios')
            conjuntoFormulas = FabricaFormulas(request.POST, prefix='formulas')
            

            if formTema.is_valid() and conjuntoEjercicios.is_valid() and conjuntoFormulas.is_valid():
                tema = formTema.save()
                materia = Materia.objects.get(materia=request.POST['selectorMateria'])
                relTemasMateria = Temas_Materia()
                relTemasMateria.materia=materia
                relTemasMateria.tema=tema
                relTemasMateria.save()

                for formaEjercicio in conjuntoEjercicios:
                    ejercicio = formaEjercicio.save()
                    relEjerciciosTema = Ejercicios_Tema()
                    relEjerciciosTema.ejercicio=ejercicio
                    relEjerciciosTema.tema=tema
                    relEjerciciosTema.save()

                for formaFormula in conjuntoFormulas:
                    formula = formaFormula.save()
                    relFormulasTema = Formulas_Tema()
                    relFormulasTema.tema = tema
                    relFormulasTema.formula = formula
                    relFormulasTema.save()

                return HttpResponseRedirect(paginaPrincipal)
            else:
                carreraUsuario = request.user.usuario.carrera
                relMateriasCarrera = Materias_Carrera.objects.filter(carrera=carreraUsuario)
                materias = []
                for relacion in relMateriasCarrera:
                    materias.append(Materia.objects.get(materia=relacion.materia))
                
    else:
        conjuntoEjercicios = FabricaEjercicios(prefix='ejercicios')
        conjuntoFormulas = FabricaFormulas(prefix='formulas')
        formTema = FormaTema(prefix='tema')

        carreraUsuario = request.user.usuario.carrera
        relMateriasCarrera = Materias_Carrera.objects.filter(carrera=carreraUsuario)
        materias = []
        for relacion in relMateriasCarrera:
            materias.append(Materia.objects.get(materia=relacion.materia))

    return render(request, 'temas/crearTema.html', {
        'formTema': formTema, 
        'conjuntoEjercicios': conjuntoEjercicios,
        'conjuntoFormulas': conjuntoFormulas,
        'materias': materias,
    })
