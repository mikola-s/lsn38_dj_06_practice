from django.urls import path
from . import views

app_name = "zoo"

urlpatterns = [
    path('', views.index, name='index'),
    path('new/', views.new, name='new'),
    path('final/', views.final, name='final'),
]