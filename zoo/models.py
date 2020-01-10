from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver


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


class AgeRange(models.Model):
    name = models.CharField(max_length=20, default='all_age')
    age_from = models.PositiveSmallIntegerField(default=0)
    age_to = models.PositiveSmallIntegerField(default=122)

    def __str__(self):
        return f"{self.name} (from {self.age_from} to {self.age_to})"


class Visitor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    age = models.PositiveSmallIntegerField(null=True, blank=True)

    @receiver(post_save, sender=User)
    def create_user_profile(sender, instance, created, **kwargs):
        if created:
            Visitor.objects.create(user=instance)

    @receiver(post_save, sender=User)
    def save_user_profile(sender, instance, **kwargs):
        instance.profile.save()


class Ticket(models.Model):
    valid_until = models.DateTimeField(default=timezone.now() + timezone.timedelta(hours=24))
    age_range = models.ForeignKey(to=AgeRange, on_delete=models.SET_DEFAULT, default='all_age')
