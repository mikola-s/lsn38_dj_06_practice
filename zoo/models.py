from django.db import models


class AnimalType(models.Model):
    animal_type = models.CharField(max_length=50)

    def __str__(self):
        return self.animal_type


class AnimalGender(models.Model):
    gender = models.CharField(max_length=20)

    def __str__(self):
        return self.gender
