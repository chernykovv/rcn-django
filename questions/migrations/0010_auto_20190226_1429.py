# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('questions', '0009_duerequeststatus_status'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='duerequeststatus',
            name='status',
        ),
        migrations.AddField(
            model_name='duerequeststatus',
            name='is_resolved',
            field=models.CharField(default=b'1', max_length=256, verbose_name=b'Status', choices=[(b'1', b'Unresolved'), (b'2', b'Pending'), (b'3', b'Resolved')]),
            preserve_default=True,
        ),
    ]
