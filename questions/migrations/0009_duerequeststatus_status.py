# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('questions', '0008_duerequeststatus'),
    ]

    operations = [
        migrations.AddField(
            model_name='duerequeststatus',
            name='status',
            field=models.CharField(max_length=256, null=True, blank=True),
            preserve_default=True,
        ),
    ]
