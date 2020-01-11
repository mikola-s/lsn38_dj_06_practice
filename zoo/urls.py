from django.urls import path
from . import views

app_name = "zoo"

urlpatterns = [
    path('/', views.animal_list, name='index'),
    path('animal/<int:id>', views.animal_details, name='index'),
    path('index/', views.index, name='index'),
    path('new/', views.new, name='new'),
    path('verynew/', views.very_new, name='new'),
    path('final/', views.final, name='final'),
]
