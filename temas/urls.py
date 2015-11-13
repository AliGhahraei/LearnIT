from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^crearTema$',views.crearTema,name='crearTema'),
]
