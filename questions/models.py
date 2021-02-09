from django.db import models
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.conf import settings
from ckeditor.fields import RichTextField
from django.template.defaultfilters import slugify


class Community(models.Model):
    title = models.CharField(max_length=256, blank=True, null=True)
    variable_title = models.CharField(max_length=256, blank=True, null=True)
    variable_section = RichTextField(blank=True, null=True, config_name='custom_2')
    slug = models.SlugField(blank=True, null=True)

    class Meta:
        verbose_name_plural = 'Communities'
        ordering = ['title']

    def __unicode__(self):
        return unicode(self.title) or u''

    def save(self, *args, **kwargs):
        if self.slug == '':
            self.slug = slugify(self.title)
        super(Community, self).save(*args, **kwargs)


class QuestionPart(models.Model):
    question = models.CharField(max_length=512, blank=True, null=True)
    answer = models.TextField(blank=True, null=True)


status = (('1', 'Unresolved'), ('2', 'Pending'), ('3', 'Resolved'))


class File(models.Model):
    image = models.ImageField(null=True, blank=True)

    def __unicode__(self):
        return unicode(self.image.name[2:]) or u''


class Question(models.Model):
    assigned_admin = models.ForeignKey(User, null=True, blank=True, verbose_name="Assigned Admin")
    neighborhood = models.ForeignKey(Community, null=True, blank=True)
    type = models.CharField(max_length=256, blank=True, null=True)
    name = models.CharField(max_length=256, blank=True, null=True)
    address = models.CharField(max_length=256, blank=True, null=True)
    phone = models.CharField(max_length=256, blank=True, null=True)
    email = models.CharField(max_length=256, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name="Submitted On")
    is_resolved = models.CharField(max_length=256, choices=status, verbose_name="Status", default='1')
    questions = models.ManyToManyField(QuestionPart, related_name='parts')
    note = models.CharField(max_length=500, blank=True, null=True)
    file = models.ManyToManyField(File)

    class Meta:
        verbose_name_plural = 'Questions'
        verbose_name = 'Question'

    def __unicode__(self):
        return unicode(self.name) or u''

    def save(self, *args, **kwargs):
        old = type(self).objects.get(pk=self.pk) if self.pk else None
        super(Question, self).save(*args, **kwargs)
        if old and old.assigned_admin != self.assigned_admin and self.assigned_admin != None: # Field has changed
            message = "You have new request."


class DueRequestStatus(models.Model):
    assigned_admin = models.ForeignKey(User, null=True, blank=True, verbose_name="Assigned Admin")
    firstname = models.CharField(max_length=256, blank=True, null=True)
    lastname = models.CharField(max_length=256, blank=True, null=True)
    is_resolved = models.CharField(max_length=256, choices=status, verbose_name="Status", default='1')
    compnay = models.CharField(max_length=256, blank=True, null=True)
    phone = models.CharField(max_length=256, blank=True, null=True)
    email = models.CharField(max_length=256, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name="Submitted On")
    neighborhood = models.ForeignKey(Community, null=True, blank=True)
    lot = models.CharField(max_length=256, blank=True, null=True)
    address = models.CharField(max_length=256, blank=True, null=True)
    city = models.CharField(max_length=256, blank=True, null=True)
    state = models.CharField(max_length=256, blank=True, null=True)
    zip = models.CharField(max_length=256, blank=True, null=True)
    owner_seller = models.CharField(max_length=256, blank=True, null=True)
    buyer = models.CharField(max_length=256, blank=True, null=True)
    closing_date = models.DateField(blank=True, null=True, verbose_name="Closing Date")
    needed_by = models.DateField(blank=True, null=True, verbose_name="Needed Date")
    comment = models.TextField(max_length=256, blank=True, null=True)

    class Meta:
        verbose_name_plural = 'Due Requests'
        verbose_name = 'Due Request'

    def __unicode__(self):
        return unicode(self.firstname) or u''
