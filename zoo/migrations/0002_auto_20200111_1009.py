# Generated by Django 2.2 on 2020-01-11 08:09

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('zoo', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel('AnimalGender', 'Gender'),
        migrations.AlterField(
            model_name='ticket',
            name='valid_until',
            field=models.DateTimeField(default=datetime.datetime(2020, 1, 12, 8, 9, 49, 814063, tzinfo=utc)),
        ),
    ]