from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from . import models


def index(request):
    return render(request, "zoo/index.html")


def new(request):
    return render(request, "zoo/new.html")


def final(request):
    return render(request, "zoo/final.html")


def very_new(request):
    return render(request, "zoo/very_new.html")


class AnimalList(ListView):
    model = models.Animal
    context_object_name = "animals"

    def get_queryset(self):
        super().get_queryset()
        return models.Animal.objects.order_by("incoming_time").filter()


class AnimalDetails(DetailView):
    model = models.Animal
