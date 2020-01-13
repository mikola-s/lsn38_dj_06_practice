from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView
from django.views.generic.base import TemplateView
from django.utils import timezone
from django.contrib import messages
from . import models
from django.urls import reverse_lazy


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
        return models.Animal.objects.order_by("incoming_time").filter()


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
