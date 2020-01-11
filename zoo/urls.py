from django.urls import path
from . import views

app_name = "zoo"

urlpatterns = [
    path('', views.animal_list, name='animal_list'),
    path('animal/<int:id>', views.animal_details, name='animal_detail'),
    path('index/', views.index, name='index'),
    path('new/', views.new, name='new'),
    path('verynew/', views.very_new, name='very_new'),
    path('final/', views.final, name='final'),
]
