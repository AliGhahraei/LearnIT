# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0004_auto_20151113_0740'),
    ]

    operations = [
        migrations.AlterField(
            model_name='materia',
            name='materia',
            field=models.CharField(max_length=60),
        ),
    ]
