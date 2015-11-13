# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0003_auto_20151105_2259'),
    ]

    operations = [
        migrations.AlterField(
            model_name='carrera',
            name='carrera',
            field=models.CharField(max_length=60, verbose_name='Major'),
        ),
    ]
