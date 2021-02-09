# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('questions', '0001_initial'),
    ]

    operations = [
        # migrations.CreateModel(
        #     name='File',
        #     fields=[
        #         ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
        #         ('image', models.ImageField(null=True, upload_to=b'', blank=True)),
        #     ],
        #     options={
        #     },
        #     bases=(models.Model,),
        # ),
        migrations.AlterModelOptions(
            name='community',
            options={'verbose_name_plural': 'Communities'},
        ),
        # migrations.RemoveField(
        #     model_name='question',
        #     name='info',
        # ),
        # migrations.AddField(
        #     model_name='question',
        #     name='file',
        #     field=models.ManyToManyField(to='questions.File'),
        #     preserve_default=True,
        # ),
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
            field=models.CharField(default=b'1', max_length=256, verbose_name=b'Status', choices=[(b'1', b'Unresolved'), (b'2', b'Pending'), (b'3', b'Resolved')]),
            preserve_default=True,
        ),
    ]
