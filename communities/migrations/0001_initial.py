# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('questions', '0005_auto_20190218_1015'),
    ]

    operations = [
        migrations.CreateModel(
            name='Banner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('message', ckeditor.fields.RichTextField(null=True, verbose_name=b'Banner message', blank=True)),
                ('description', models.TextField(max_length=256, null=True, blank=True)),
                ('is_active', models.BooleanField(default=True)),
                ('end_date', models.DateTimeField(null=True, blank=True)),
                ('community', models.OneToOneField(null=True, blank=True, to='questions.Community')),
            ],
            options={
                'verbose_name_plural': 'Banner',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Document',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=256, null=True, blank=True)),
                ('description', models.CharField(max_length=200, null=True, blank=True)),
                ('file', models.FileField(upload_to=b'')),
                ('community', models.ForeignKey(blank=True, to='questions.Community', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
