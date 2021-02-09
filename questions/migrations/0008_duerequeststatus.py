# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('questions', '0007_remove_community_active'),
    ]

    operations = [
        migrations.CreateModel(
            name='DueRequestStatus',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('firstname', models.CharField(max_length=256, null=True, blank=True)),
                ('lastname', models.CharField(max_length=256, null=True, blank=True)),
                ('compnay', models.CharField(max_length=256, null=True, blank=True)),
                ('phone', models.CharField(max_length=256, null=True, blank=True)),
                ('email', models.CharField(max_length=256, null=True, blank=True)),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name=b'Submitted On', null=True)),
                ('lot', models.CharField(max_length=256, null=True, blank=True)),
                ('address', models.CharField(max_length=256, null=True, blank=True)),
                ('city', models.CharField(max_length=256, null=True, blank=True)),
                ('state', models.CharField(max_length=256, null=True, blank=True)),
                ('zip', models.CharField(max_length=256, null=True, blank=True)),
                ('owner_seller', models.CharField(max_length=256, null=True, blank=True)),
                ('buyer', models.CharField(max_length=256, null=True, blank=True)),
                ('closing_date', models.DateField(null=True, verbose_name=b'Closing Date', blank=True)),
                ('needed_by', models.DateField(null=True, verbose_name=b'Needed Date', blank=True)),
                ('comment', models.TextField(max_length=256, null=True, blank=True)),
                ('neighborhood', models.ForeignKey(blank=True, to='questions.Community', null=True)),
            ],
            options={
                'verbose_name': 'Duerequest',
                'verbose_name_plural': 'Duerequests',
            },
            bases=(models.Model,),
        ),
    ]
