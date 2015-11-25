from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^verMaterias$',views.verMaterias,name='verMaterias'),
    url(r'^verCarrera$',views.verCarrera,name='verCarrera'),
]
