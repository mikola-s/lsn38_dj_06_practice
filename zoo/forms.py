from django import forms
from .models import Gender


class SearchForm(forms.Form):
    search = forms.CharField(max_length=255)
    gender = forms.ChoiceField(choices=[('', '------')] + list(Gender.objects.filter().values_list()))
