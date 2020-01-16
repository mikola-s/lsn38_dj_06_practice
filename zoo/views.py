from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView
from django.views.generic import FormView
from django.utils import timezone
from django.contrib import messages
from django.urls import reverse_lazy

from . import models, forms


def index(request):
    """ for task 01, 02, 03 """
    return render(request, "zoo/index.html")


def new(request):
    """ for task 01, 02, 03 """
    return render(request, "zoo/new.html")


def final(request):
    """ for task 01, 02, 03 """
    return render(request, "zoo/final.html")


def very_new(request):
    """ for task 02, 03 """
    return render(request, "zoo/very_new.html")


class AnimalList(ListView):
    """ for task 05, 06 """

    model = models.Animal
    context_object_name = "animals"

    def get_queryset(self):
        super().get_queryset()
        return models.Animal.objects.order_by("incoming_time").all()


class AnimalDetails(DetailView):
    """ for task 05, 06 """

    model = models.Animal
    context_object_name = "animal"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        five_min_delta = timezone.now() - timezone.timedelta(minutes=5)
        animal = self.model.objects.filter(pk=self.kwargs['pk'])
        context['visit_in_five_min'] = animal.filter(visitinganimals__visit_time__gte=five_min_delta).count()
        return context


class NewAnimalForm(CreateView):
    """ for task 06 """
    model = models.Animal
    template_name = 'zoo/animal_new.html'
    fields = ['name', 'animal_type', 'gender', 'age', 'incoming_time']
    success_url = reverse_lazy('zoo:animal_list')

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, f'Animal add success!!!')
        return response


class AnimalSearch(FormView):
    """ for task 07 """

    form_class = forms.SearchForm
    http_method_names = ['get']
    template_name = 'zoo/animal_list_with_search.html'

    def get(self, request, *args, **kwargs):
        print(request.GET)
        return render(self.request, 'zoo/animal_list_with_search.html')


class AnimalListWithSearch(ListView):
    """ for task 07 in generic view"""
    http_method_names = ['get']
    model = models.Animal
    context_object_name = 'animals'
    template_name = 'zoo/animal_list_with_search.html'
    queryset = model.objects.all()

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(object_list=None, **kwargs)
        context.update({'form': forms.SearchForm(self.request.GET)})
        return context

    def get_queryset(self):
        qs = super().get_queryset()
        data = self.request.GET
        if data.get('search'):
            qs = qs.filter(name__contains=data['search'])
        if data.get('gender'):
            qs = qs.filter(gender=int(data['gender']))
        return qs


def animal_list_with_search(request):
    """ fof task 07 in def """

    form = forms.SearchForm(request.GET)
    animal_list = models.Animal.objects.all()
    if form.is_valid():
        data = form.cleaned_data
        if data['search']:
            animal_list = animal_list.filter(name__contains=data['search'])
        if data['gender']:
            animal_list = animal_list.filter(gender=int(data['gender']))
    context = {'form': form, 'animal_list': animal_list}
    return render(request, 'zoo/animal_list_with_search.html', context)
