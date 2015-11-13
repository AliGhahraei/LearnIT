from django.db import models
from django.contrib.auth.models import User

# Create your models here.

""" 
Al extender de la clase User (con el campo user y el OneToOneField), tenemos acceso a:

    * Usuario -> username
    * Contraseña -> password
    * Nombre -> first_name
    * Apellido -> last_name
    * Privilegios -> user_permissions

así como a todos los otros atributos y métodos de esta
"""

class Carrera(models.Model):
    carrera=models.CharField("Major",max_length=60)
    def __str__(self):
        return self.carrera

class Usuario(models.Model):
    user=models.OneToOneField(User)
    carrera=models.ForeignKey(Carrera)
    def __str__(self):
        return self.user.username

class Materia(models.Model):
    materia=models.CharField(max_length=60)
    def __str__(self):
        return self.materia

class Materias_Carrera(models.Model):
    carrera=models.ForeignKey(Carrera)
    materia=models.ForeignKey(Materia)
    def __str__(self):
        return self.materia.materia+"-"+self.carrera.carrera

class Tema(models.Model):
    tema=models.CharField(max_length=50)
    resumenTeorico=models.TextField(max_length=5000)
    referencias=models.TextField(max_length=2000)
    def __str__(self):
        return self.tema
    
class Temas_Materia(models.Model):
    tema=models.ForeignKey(Tema)
    materia=models.ForeignKey(Materia)
    def __str__(self):
        return self.tema.tema+"-"+self.materia.materia

class Ejercicio(models.Model):
    problema=models.TextField(max_length=5000)
    solucion=models.TextField(max_length=5000)
    def __str__(self):
        return self.problema

class Ejercicios_Tema(models.Model):
    tema=models.ForeignKey(Tema)
    ejercicio=models.ForeignKey(Ejercicio)
    def __str__(self):
        return self.ejercicio.problema+"-"+self.tema.tema

class Formula(models.Model):
    formula=models.TextField(max_length=500)
    def __str__(self):
        return self.formula

class Formulas_Tema(models.Model):
    formula=models.ForeignKey(Formula)
    tema=models.ForeignKey(Tema)
    def __str__(self):
        return self.formula.formula+"-"+self.tema.tema
