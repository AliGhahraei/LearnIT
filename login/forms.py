from django import forms

class NameForm(forms.Form):
        username = forms.CharField(label='Your username:', max_length=8)
        password = forms.CharField(widget=forms.PasswordInput())
        widgets = {
            'password': forms.PasswordInput(),
        }
