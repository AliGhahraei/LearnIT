from django.conf.urls import url
from . import views

urlpatterns = [
	url(r'^verTemas/(?P<idMateria>[0-9]+)/$',views.verTemas,name='verTemas'),
	url(r'^crearMateria/$',views.crearMateria,name='crearMateria'),
]
