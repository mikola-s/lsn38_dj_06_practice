from django import forms
from .models import Gender


class SearchForm(forms.Form):
    search = forms.CharField(max_length=255, required=False)
    gender = forms.ChoiceField(choices=[('', '------')] + list(Gender.objects.all().values_list()),
                               required=False)
