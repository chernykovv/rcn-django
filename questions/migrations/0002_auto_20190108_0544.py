# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('questions', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='community',
            options={'verbose_name_plural': 'Communities'},
        ),
        migrations.AddField(
            model_name='question',
            name='note',
            field=models.CharField(max_length=500, null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='question',
            name='assigned_admin',
            field=models.ForeignKey(verbose_name=b'Assigned Admin', blank=True, to=settings.AUTH_USER_MODEL, null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='question',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, verbose_name=b'Submitted On', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='question',
            name='is_resolved',
            field=models.BooleanField(default=False, verbose_name=b'Resolved'),
            preserve_default=True,
        ),
    ]
