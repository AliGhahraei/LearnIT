from django.db import models
from precise_bbcode.fields import BBCodeTextField
from django.contrib.auth.models import User
import datetime

# Create your models here.

class Categoria(models.Model):
    nombre=models.CharField(max_length=30)
    def __str__(self):
        return self.nombre


""" 
Al extender de la clase User (con el campo user y el OneToOneField), tenemos acceso a:

    * Usuario -> username
    * Contraseña -> password
    * Nombre -> first_name
    * Apellido -> last_name
    * Privilegios -> user_permissions

así como a todos los otros atributos y métodos de esta
"""

class Usuario(models.Model):
    user=models.OneToOneField(User)
    fechaDeNacimiento=models.DateTimeField()
    categoria=models.ForeignKey(Categoria)
    def __str__(self):
        return self.user.username

class Reseña(models.Model):
    titulo=models.CharField(max_length=50)
    fecha=models.DateTimeField(default=datetime.datetime.now())
    usuario=models.ForeignKey(Usuario)
    referencia=models.CharField(max_length=100)
    contenido=BBCodeTextField(blank=True)
    califReview=models.FloatField()
    califGente=models.FloatField(null=True, blank=True)
    categoria=models.ForeignKey(Categoria)
    def __str__(self):
        return self.titulo

class Noticia(models.Model):
    titulo=models.CharField(max_length=100)
    fecha=models.DateTimeField()
    usuario=models.ForeignKey(Usuario)
    categoria=models.ForeignKey(Categoria) 
    def __str__(self):
        return self.titulo
