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

# Register your models here.
admin.site.unregister(User)
admin.site.register(User,UserAdmin)

admin.site.register(Carrera)
admin.site.register(Materia)
admin.site.register(Materias_Carrera)
admin.site.register(Tema)
admin.site.register(Temas_Materia)
admin.site.register(Ejercicio)
admin.site.register(Ejercicios_Tema)
admin.site.register(Formula)
admin.site.register(Formulas_Tema)

