# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('questions', '0006_community_active'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='community',
            name='active',
        ),
    ]
