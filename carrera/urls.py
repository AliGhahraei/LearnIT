from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^verCarrera$', views.verCarrera, name='verCarrera'),
]
