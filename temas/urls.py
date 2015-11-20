from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^crearTema$',views.crearTema,name='crearTema'),
    url(r'^editarTema/(?P<idTema>[0-9]+)/$',views.editarTema,name='editarTema'),
]
