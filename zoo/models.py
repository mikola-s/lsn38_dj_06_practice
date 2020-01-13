from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver


# for task 04-

class AnimalType(models.Model):
    animal_type = models.CharField(max_length=50)

    def __str__(self):
        return self.animal_type


class Gender(models.Model):
    gender = models.CharField(max_length=20)

    def __str__(self):
        return self.gender


class Animal(models.Model):
    animal_type = models.ForeignKey(to=AnimalType, on_delete=models.DO_NOTHING, blank=True, null=True)
    gender = models.ForeignKey(to=Gender, on_delete=models.SET_NULL, blank=True, null=True)
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
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='visitor')
    age = models.PositiveSmallIntegerField(null=True, blank=True)
    gender = models.ForeignKey(to=Gender, on_delete=models.SET_NULL, null=True, blank=True)

    @receiver(post_save, sender=User)
    def create_user_profile(sender, instance, created, **kwargs):
        if created:
            Visitor.objects.create(user=instance)

    @receiver(post_save, sender=User)
    def save_user_profile(sender, instance, **kwargs):
        instance.visitor.save()

    def __str__(self):
        return self.user.username


class Ticket(models.Model):
    valid_until = models.DateTimeField(default=timezone.now() + timezone.timedelta(hours=24))
    age_range = models.ForeignKey(to=AgeRange, on_delete=models.SET_DEFAULT, default='all_age')
    visitor = models.ForeignKey(to=Visitor, on_delete=models.CASCADE)

    def __str__(self):
        return f"Ticket {self.pk} {self.visitor.user.username} {self.valid_until}"


class VisitingAnimals(models.Model):
    visitor = models.ForeignKey(to=Visitor, on_delete=models.SET_DEFAULT, default='some_user')
    animal = models.ForeignKey(to=Animal, on_delete=models.DO_NOTHING)
    visit_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        visit_time = self.visit_time.strftime("%Y-%m-%d %H:%M:%S")
        return f"VISIT {self.pk} TO {self.animal} WHO {self.visitor} WHEN {visit_time}"
