from django.utils import timezone
from datetime import datetime
from django.db import models

from ckeditor.fields import RichTextField

from questions.models import Community

class Banner(models.Model):
    message = models.CharField(blank=True, null=True, max_length=256, verbose_name="Banner message")
    description = models.TextField(max_length=256, blank=True, null=True)
    is_active = models.BooleanField(default=True)
    end_date = models.DateTimeField(blank=True, null=True)
    community = models.OneToOneField(Community, blank=True, null=True)

    def __unicode__(self):
        return unicode(self.description) or u''

    class Meta:
        verbose_name_plural = 'Banner'

class DocCategory(models.Model):
    title = models.CharField(max_length=256, blank=True, null=True)
    description = models.CharField(max_length=200, blank=True, null=True)

class Document(models.Model):
    title = models.CharField(max_length=256, blank=True, null=True)
    description = models.CharField(max_length=200, blank=True, null=True)
    community = models.ForeignKey(Community, blank=True, null=True)
    category = models.ForeignKey(DocCategory, blank=True, null=True)
    file = models.FileField()

    def __unicode__(self):
        return unicode(self.title) or u''




class ComSliders(models.Model):
    community = models.ForeignKey(Community, blank=True, null=True)
    file = models.FileField()
    order = models.IntegerField(default=1)

    class Meta:
        ordering = ('order', 'id')
