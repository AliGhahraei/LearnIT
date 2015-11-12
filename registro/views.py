from django.shortcuts import render
from django.http import HttpResponseRedirect
from django import forms
from django.forms.widgets import PasswordInput
from django.utils.safestring import mark_safe

from django.forms.models import ModelForm 
from principal.models import Usuario
from django.contrib.auth.models import User

paginaPrincipal='/'

def requerido(stringOriginal):
    return mark_safe(('<span class=error>*</span> '+stringOriginal))

class FormaPerfil(ModelForm):
    class Meta:
        model = Usuario
        exclude = ['formPerfil']
        fields = ['carrera']
        labels = {
            'carrera': requerido('Major'),
        }
    
class FormaUsuario(ModelForm):
    class Meta:
        model = User
        exclude = ['formUsuario']
        fields = ['username','password','first_name','last_name', 'email']
        widgets = {
            'password': PasswordInput(), 
        }
        labels = {
            'username': requerido('Username'),
            'password': requerido('Password'),
        }
    
def registra(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect(paginaPrincipal)
    else:
        if request.method == 'POST':
            formPerfil = FormaPerfil(request.POST, prefix='formPerfil')
            formUsuario = FormaUsuario(request.POST, prefix='formUsuario')

            if formPerfil.is_valid() and formUsuario.is_valid():
                usuario = User.objects.create_user(formUsuario.cleaned_data['username'],formUsuario.cleaned_data['email'],formUsuario.cleaned_data['password'])
                usuario.first_name=formUsuario.cleaned_data['first_name']
                usuario.last_name=formUsuario.cleaned_data['last_name']
                perfil = formPerfil.save(commit=False)
                perfil.user = usuario
                perfil.save()

                return HttpResponseRedirect(paginaPrincipal)  
        else:
            formPerfil = FormaPerfil(prefix='formPerfil')
            formUsuario = FormaUsuario(prefix='formUsuario')
        return render(request, 'registro/registro.html', {
            'formUsuario': formUsuario,
            'formPerfil': formPerfil
        })
