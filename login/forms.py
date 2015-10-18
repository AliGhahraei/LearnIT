from django import forms

class NameForm(forms.Form):
        username = forms.CharField(label='Your name', max_length=8)
        password = forms.CharField(widget=forms.PasswordInput())
        widgets = {
            'password': forms.PasswordInput(),
        }
