# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0005_auto_20151113_0746'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tema',
            name='referencias',
            field=models.TextField(blank=True, max_length=2000, null=True),
        ),
        migrations.AlterField(
            model_name='tema',
            name='resumenTeorico',
            field=models.TextField(blank=True, max_length=5000, null=True),
        ),
    ]
