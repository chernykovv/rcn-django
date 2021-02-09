import datetime
from django.db import models
from django.db.models import Q
from filebrowser.fields import FileBrowseField


class Tag(models.Model):
    label = models.CharField(max_length=100)

    meta_title = models.CharField(max_length=100, blank=True, null=True, help_text='This shows at the top of the browser, usually in the tab.')
    meta_description = models.CharField(max_length=500, blank=True, null=True)
    meta_tags = models.CharField(max_length=500, blank=True, null=True)
    slug = models.SlugField(unique=True)

    order = models.IntegerField(default=1)
    is_published = models.BooleanField(default=True)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Tag'
        verbose_name_plural = 'Tags'
        ordering = ('order',)

    def articles(self):
        articles = self.tags.filter(is_published=True)

        return articles

    @staticmethod
    def get_published_objects():
        tags = Tag.objects.filter(is_published=True).order_by('order', 'label')

        return tags


class Article(models.Model):
    label = models.CharField(max_length=200)
    author = models.CharField(max_length=200)

    tags = models.ManyToManyField(Tag, blank=True, null=True, related_name='tags')

    meta_title = models.CharField(max_length=100, blank=True, null=True, help_text='This shows at the top of the browser, usually in the tab.')
    meta_description = models.CharField(max_length=500, blank=True, null=True)
    meta_tags = models.CharField(max_length=500, blank=True, null=True)
    slug = models.SlugField(unique=True)

    image = FileBrowseField(max_length=200)

    teaser = models.CharField(max_length=400)
    content = models.TextField(max_length=8000)

    publish_date = models.DateField(db_index=True)
    is_published = models.BooleanField(default=True)

    def __unicode__(self):
        return '%s by %s' % (self.label, self.author)

    class Meta:
        verbose_name = 'Article'
        verbose_name_plural = 'Articles'
        ordering = ('-publish_date', 'label')

    @staticmethod
    def get_published_objects():
        articles = Article.objects.filter(Q(publish_date__lte=datetime.datetime.now) & Q(is_published=True)).order_by('-publish_date', 'label')

        return articles