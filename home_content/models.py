import datetime
from django.db import models
from django.db.models import Q
from filebrowser.fields import FileBrowseField


TEMPLATES = (
    ('billboard', 'Billboards'),
    ('mini_billboard', 'Mini Billboards'),
    ('slide', 'Slide Show'),
    ('2_col', '2 Column Free Form'),
    ('benefit_group', 'Benefit Groups')
)


SLIDE_SHOW_POSITION = (
    ('l', 'Left'),
    ('r', 'Right')
)


BACKGROUND_SIZE = (
    ('n', 'Natural'),
    ('c', 'Cover')
)


class HomeSection(models.Model):
    label = models.CharField(max_length=200)

    template = models.CharField(max_length=50, choices=TEMPLATES, default='slide')
    image_background = FileBrowseField(max_length=200, blank=True, null=True, help_text='Leave blank for white.', verbose_name='Background image')
    background_size = models.CharField(max_length=50, choices=BACKGROUND_SIZE, default='c')

    slide_position = models.CharField(max_length=50, choices=SLIDE_SHOW_POSITION, default='r', verbose_name='Slide show position')

    is_published = models.BooleanField(default=True)
    order = models.IntegerField(default=1)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Section'
        verbose_name_plural = 'Sections'
        ordering = ('order',)

    def images(self):
        return self.sectionslideshowimage_set.order_by('order')

    @staticmethod
    def get_published_objects():
        sections = HomeSection.objects.filter(is_published=True).order_by('order')
        return sections


class SectionSlideShowImage(models.Model):
    parent = models.ForeignKey(HomeSection)
    label = models.CharField(max_length=200)

    image = FileBrowseField(max_length=400)

    order = models.IntegerField(default=1)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Slide Show Image'
        verbose_name_plural = 'Slide Show Images'
        ordering = ('order', 'label')


class Billboard(models.Model):
    label = models.CharField(max_length=200)

    image = FileBrowseField(max_length=200, help_text='Approximately 1000 px wide by 650 px tall. (Keep subject towards the middle of image for best viewing on mobile.)')
    header = models.CharField(max_length=35, blank=True, null=True)
    sub_header = models.CharField(max_length=100, blank=True, null=True)
    link = models.CharField(max_length=200, blank=True, null=True)

    is_published = models.BooleanField(default=True)
    publish_date = models.DateField(db_index=True)
    expire_date = models.DateField(null=True, blank=True)

    order = models.IntegerField(default=1)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Billboard'
        verbose_name_plural = 'Billboards'
        ordering = ('order', '-publish_date')

    @staticmethod
    def get_published_objects():
        billboards = Billboard.objects.filter(Q(publish_date__lte=datetime.datetime.now) & Q(is_published=True) &
                                              (Q(expire_date=None) | Q(expire_date__gte=datetime.datetime.now))).order_by('order', '-publish_date')
        return billboards


class MiniBillboard(models.Model):
    label = models.CharField(max_length=200)

    image = FileBrowseField(max_length=200, blank=True, null=True)
    link = models.CharField(max_length=200, blank=True, null=True)

    is_published = models.BooleanField(default=True)
    publish_date = models.DateField(db_index=True)
    expire_date = models.DateField(null=True, blank=True)

    order = models.IntegerField(default=1)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Mini Billboard'
        verbose_name_plural = 'Mini Billboards'
        ordering = ('order', '-publish_date')

    @staticmethod
    def get_published_objects():
        mini_billboards = MiniBillboard.objects.filter(Q(publish_date__lte=datetime.datetime.now) & Q(is_published=True) &
                                                       (Q(expire_date=None) | Q(expire_date__gte=datetime.datetime.now))).order_by('order', '-publish_date')
        return mini_billboards


class BenefitGroup(models.Model):
    label = models.CharField(max_length=200)

    image = FileBrowseField(max_length=200, blank=True, null=True, help_text='270w by 350h @ 72ppi')

    is_published = models.BooleanField(default=True)
    order = models.IntegerField(default=1)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Benefit Group'
        verbose_name_plural = 'Benefit Groups'
        ordering = ('order', 'label')

    @staticmethod
    def get_published_objects():
        groups = BenefitGroup.objects.filter(is_published=True).order_by('order', 'label')
        return groups