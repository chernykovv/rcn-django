# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('questions', '0005_auto_20190218_1015'),
    ]

    operations = [
        migrations.AddField(
            model_name='community',
            name='active',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
