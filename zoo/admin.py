from django.contrib import admin
from . import models

admin.site.register(models.AnimalType)
admin.site.register(models.Gender)
admin.site.register(models.Animal)
admin.site.register(models.Ticket)
admin.site.register(models.AgeRange)
admin.site.register(models.Visitor)
admin.site.register(models.VisitingAnimals)
