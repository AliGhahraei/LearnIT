# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Carrera',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('carrera', models.CharField(max_length=40)),
            ],
        ),
        migrations.CreateModel(
            name='Ejercicio',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('problema', models.TextField(max_length=5000)),
                ('solucion', models.TextField(max_length=5000)),
            ],
        ),
        migrations.CreateModel(
            name='Ejercicios_Tema',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('ejercicio', models.ForeignKey(to='principal.Ejercicio')),
            ],
        ),
        migrations.CreateModel(
            name='Formula',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('formula', models.TextField(max_length=500)),
            ],
        ),
        migrations.CreateModel(
            name='Formulas_Temaa',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('formula', models.ForeignKey(to='principal.Formula')),
            ],
        ),
        migrations.CreateModel(
            name='Materia',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('materia', models.CharField(max_length=40)),
            ],
        ),
        migrations.CreateModel(
            name='Materias_Carrera',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('carrera', models.ForeignKey(to='principal.Carrera')),
                ('materia', models.ForeignKey(to='principal.Materia')),
            ],
        ),
        migrations.CreateModel(
            name='Tema',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('tema', models.CharField(max_length=50)),
                ('resumenTeorico', models.TextField(max_length=5000)),
                ('referencias', models.TextField(max_length=2000)),
            ],
        ),
        migrations.CreateModel(
            name='Temas_Materia',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('materia', models.ForeignKey(to='principal.Materia')),
                ('tema', models.ForeignKey(to='principal.Tema')),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.AutoField(auto_created=True, verbose_name='ID', primary_key=True, serialize=False)),
                ('carrera', models.ForeignKey(to='principal.Carrera')),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='formulas_temaa',
            name='tema',
            field=models.ForeignKey(to='principal.Tema'),
        ),
        migrations.AddField(
            model_name='ejercicios_tema',
            name='tema',
            field=models.ForeignKey(to='principal.Tema'),
        ),
    ]
