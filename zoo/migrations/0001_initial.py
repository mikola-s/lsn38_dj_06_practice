# Generated by Django 2.2 on 2020-01-10 14:14

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
from django.utils.timezone import utc


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='AgeRange',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='all_age', max_length=20)),
                ('age_from', models.PositiveSmallIntegerField(default=0)),
                ('age_to', models.PositiveSmallIntegerField(default=122)),
            ],
        ),
        migrations.CreateModel(
            name='Animal',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('age', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('name', models.CharField(default='organism', max_length=256)),
                ('incoming_time', models.DateTimeField(blank=True, default=django.utils.timezone.now, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='AnimalGender',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gender', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='AnimalType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('animal_type', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Visitor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('age', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='visitor', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='VisitingAnimals',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('visit_time', models.DateTimeField(auto_now_add=True)),
                ('animal', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='zoo.Animal')),
                ('visitor', models.ForeignKey(default='some_user', on_delete=django.db.models.deletion.SET_DEFAULT, to='zoo.Visitor')),
            ],
        ),
        migrations.CreateModel(
            name='Ticket',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('valid_until', models.DateTimeField(default=datetime.datetime(2020, 1, 11, 14, 14, 3, 812309, tzinfo=utc))),
                ('age_range', models.ForeignKey(default='all_age', on_delete=django.db.models.deletion.SET_DEFAULT, to='zoo.AgeRange')),
                ('visitor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='zoo.Visitor')),
            ],
        ),
        migrations.AddField(
            model_name='animal',
            name='animal_type',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='zoo.AnimalType'),
        ),
        migrations.AddField(
            model_name='animal',
            name='gender',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='zoo.AnimalGender'),
        ),
    ]
