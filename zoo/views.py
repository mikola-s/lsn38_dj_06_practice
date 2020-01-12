from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.utils import timezone
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
    context_object_name = "animal"

    def get_queryset(self):
        qs = super().get_queryset()
        return qs.order_by('visitinganimals__visit_time')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        time_delta = timezone.now() - timezone.timedelta(minutes=5)
        animal = self.model.objects.filter(pk=self.kwargs['pk'])
        visit_in_five_min = animal.filter(visitinganimals__visit_time__gte=time_delta).count()
        context['visit_in_five_min'] = visit_in_five_min
        return context
