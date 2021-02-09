# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('communities', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='banner',
            name='message',
            field=models.CharField(max_length=256, null=True, verbose_name=b'Banner message', blank=True),
            preserve_default=True,
        ),
    ]
