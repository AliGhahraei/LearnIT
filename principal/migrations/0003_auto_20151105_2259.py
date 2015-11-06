# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0002_auto_20151105_1558'),
    ]

    operations = [
        migrations.AlterField(
            model_name='carrera',
            name='carrera',
            field=models.CharField(max_length=40, verbose_name='Major'),
        ),
    ]
