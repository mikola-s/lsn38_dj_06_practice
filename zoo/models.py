from django.db import models
from django.utils import timezone


class AnimalType(models.Model):
    animal_type = models.CharField(max_length=50)

    def __str__(self):
        return self.animal_type


class AnimalGender(models.Model):
    gender = models.CharField(max_length=20)

    def __str__(self):
        return self.gender


class Animal(models.Model):
    animal_type = models.ForeignKey(to=AnimalType, on_delete=models.SET_DEFAULT, default='this')
    gender = models.ForeignKey(to=AnimalGender, on_delete=models.SET_DEFAULT, default='it')
    age = models.PositiveSmallIntegerField(blank=True, null=True)
    name = models.CharField(max_length=256, default='organism')
    incoming_time = models.DateTimeField(blank=True, null=True, default=timezone.now)

    def __str__(self):
        return f"{self.name} ({self.animal_type})"
