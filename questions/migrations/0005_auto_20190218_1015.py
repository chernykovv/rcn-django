# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('questions', '0004_merge'),
    ]

    operations = [
        migrations.RenameField(
            model_name='community',
            old_name='name',
            new_name='title',
        ),
        migrations.AddField(
            model_name='community',
            name='slug',
            field=models.SlugField(null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='community',
            name='variable_section',
            field=ckeditor.fields.RichTextField(null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='community',
            name='variable_title',
            field=models.CharField(max_length=256, null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='question',
            name='is_resolved',
            field=models.CharField(default=b'1', max_length=256, verbose_name=b'Status', choices=[(b'1', b'Unresolved'), (b'2', b'Pending'), (b'3', b'Resolved')]),
            preserve_default=True,
        ),
    ]
