from django.urls import path
from . import views


# Задача 1
# Создать 3 HTML файла и 3 урла. Урлы: ‘/’, ‘/new’, ‘/final’.
# на каждой HTML странице по одной ссылке, на ‘/’ ссылка на ‘/new’,
# на ‘/new’ ссылка на ‘/final’, на ‘/final’ ссылка на ‘/’


app_name = "zoo"

urlpatterns = [
    path('animal_search/', views.animal_list_with_search, name='animal_list_search'),  # for task 07 in def
    path('', views.AnimalListWithSearch.as_view(), name='animal_list_with_search'),  # for task 06
    path('animal_list/', views.AnimalList.as_view(), name='animal_list'),  # task 05-
    path('animal/<int:pk>', views.AnimalDetails.as_view(), name='animal_detail'),  # task 05-
    path('new-animal/', views.NewAnimalForm.as_view(), name='animal_new'),  # task 01, 02, 03
    path('index/', views.index, name='index'),  # task 01, 02, 03
    path('new/', views.new, name='new'),  # task 01, 02, 03
    path('final/', views.final, name='final'),  # task 01, 02, 03
    path('verynew/', views.very_new, name='very_new'),  # task 02, 03
]
