from django.urls import path
from . import views

app_name = "zoo"

urlpatterns = [
    path('', views.AnimalList.as_view(), name='animal_list'),  # task 05-
    path('animal/<int:pk>', views.AnimalDetails.as_view(), name='animal_detail'),  # task 05-
    path('new-animal/', views.NewAnimalForm.as_view(), name='animal_new'),  # task 01, 02, 03
    path('index/', views.index, name='index'),  # task 01, 02, 03
    path('new/', views.new, name='new'),  # task 01, 02, 03
    path('final/', views.final, name='final'),  # task 01, 02, 03
    path('verynew/', views.very_new, name='very_new'),  # task 02, 03
]
