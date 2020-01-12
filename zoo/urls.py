from django.urls import path
from . import views

app_name = "zoo"

urlpatterns = [
    path('', views.AnimalList.as_view(), name='animal_list'),
    path('animal/<int:pk>', views.AnimalDetails.as_view(), name='animal_detail'),
    path('index/', views.index, name='index'),
    path('new/', views.new, name='new'),
    path('verynew/', views.very_new, name='very_new'),
    path('final/', views.final, name='final'),
]
