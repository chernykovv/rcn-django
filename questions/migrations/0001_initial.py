from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Community',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=256, null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Question',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(max_length=256, null=True, blank=True)),
                ('name', models.CharField(max_length=256, null=True, blank=True)),
                ('address', models.CharField(max_length=256, null=True, blank=True)),
                ('phone', models.CharField(max_length=256, null=True, blank=True)),
                ('email', models.CharField(max_length=256, null=True, blank=True)),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('is_resolved', models.BooleanField(default=False)),
                ('assigned_admin', models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('neighborhood', models.ForeignKey(blank=True, to='questions.Community', null=True)),
            ],
            options={
                'verbose_name': 'Question',
                'verbose_name_plural': 'Questions',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='QuestionPart',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('question', models.CharField(max_length=512, null=True, blank=True)),
                ('answer', models.TextField(null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='question',
            name='questions',
            field=models.ManyToManyField(related_name='parts', to='questions.QuestionPart'),
            preserve_default=True,
        ),
    ]