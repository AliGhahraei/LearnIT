from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect


from .forms import NameForm

def loginUsuario(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect('/')
    else:
        if request.method == 'POST':
            form = NameForm(request.POST)
            if form.is_valid():
                user = authenticate(username=form.cleaned_data['username'],password=form.cleaned_data['password'])
                if user is not None:
                    if user.is_active:
                        login(request,user)
                        return HttpResponseRedirect('/')
                    else:
                        print("The password is valid, but the account has been disabled!")
                        return HttpResponseRedirect('/login/')
        else:
            form = NameForm()
        return render(request, 'login/login.html', {'form': form})

def logoutUsuario(request):
    logout(request)
    return HttpResponseRedirect('/login/')
