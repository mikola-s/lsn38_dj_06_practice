from django.shortcuts import render


def index(request):
    return render(request, "zoo/index.html")


def new(request):
    return render(request, "zoo/new.html")


def final(request):
    return render(request, "zoo/final.html")


def very_new(request):
    return render(request, "zoo/very_new.html")