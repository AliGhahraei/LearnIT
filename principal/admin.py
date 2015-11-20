from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from .models import Usuario, Carrera, Materia, Materias_Carrera, Tema, Temas_Materia, Ejercicio, Ejercicios_Tema, Formula, Formulas_Tema 

class UsuarioInline(admin.StackedInline):
    model=Usuario
    can_delete=False
    verbose_name_plural = 'Usuarios'

class UserAdmin(admin.ModelAdmin):
    inlines=[
        UsuarioInline,
    ]

class FormulaTemaInline(admin.StackedInline):
    extra=0
    model=Formulas_Tema
    verbose_name_plural = 'Formulas'

class EjercicioTemaInline(admin.StackedInline):
    extra=0
    model=Ejercicios_Tema
    verbose_name_plural = 'Ejercicios'

class TemaAdmin(admin.ModelAdmin):
    inlines=[
        FormulaTemaInline,
        EjercicioTemaInline,
    ]

class MateriaCarreraInline(admin.StackedInline):
    extra=0
    model=Materias_Carrera
    verbose_name_plural = 'Materias'

class CarreraAdmin(admin.ModelAdmin):
    inlines=[
        MateriaCarreraInline,
    ]

class TemaMateriaInline(admin.StackedInline):
    extra=0
    model=Temas_Materia
    verbose_name_plural = 'Temas'

class MateriaAdmin(admin.ModelAdmin):
    inlines=[
        TemaMateriaInline,
    ]

admin.site.unregister(User)

admin.site.register(User,UserAdmin)
admin.site.register(Carrera,CarreraAdmin)
admin.site.register(Materia, MateriaAdmin)
admin.site.register(Tema, TemaAdmin)

admin.site.register(Ejercicio)
admin.site.register(Formula)
