from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^logout$',views.logoutUsuario,name='logoutUsuario'),
    url(r'^$',views.loginUsuario,name='loginUsuario'),
]
