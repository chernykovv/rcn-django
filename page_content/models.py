from django.contrib.sites.models import Site
from django.db import models
from filebrowser.fields import FileBrowseField
from news.models import Article, Tag
from staff.models import Member


class Logo(models.Model):
    site = models.OneToOneField(Site)
    label = models.CharField(max_length=100, help_text='This is only used in the admin.')
    image = FileBrowseField(max_length=400, blank=True, null=True, help_text='Transparent .png')

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Logo'
        verbose_name_plural = 'Logo'


class FAQ(models.Model):
    label = models.CharField(max_length=200, help_text='This is only used in the admin. Usually short for the question.')

    question = models.CharField(max_length=400)
    answer = models.CharField(max_length=400)

    order = models.IntegerField(default=1)
    is_published = models.BooleanField(default=True)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'FAQ'
        verbose_name_plural = 'FAQs'
        ordering = ('order', 'question')

    @staticmethod
    def get_published_objects():
        objects = FAQ.objects.filter(is_published=True).order_by('order', 'label')

        return objects


TEMPLATE_CHOICES = (
    ('landing', 'Landing Page'),
    ('1_col', '1 Column'),
    ('1_col_contact', '1 Column w/ Contact Form'),
    ('2_col', '2 Column'),
    ('2_col_contact', '2 Column w/ Contact Form'),
    ('news', 'News'),
)


TEMPLATE_ADD_ONS = (
    ('none', 'None'),
    ('staff', 'Staff'),
    ('faq', 'FAQs'),
    ('proposal', 'Proposal Request'),
)


class WebPage(models.Model):
    template_choice = models.CharField(max_length=50, blank=True, null=True, choices=TEMPLATE_CHOICES, default='1_col')
    template_addon = models.CharField(max_length=50, blank=True, null=True, choices=TEMPLATE_ADD_ONS, default='none')

    label = models.CharField(max_length=100)
    slug = models.SlugField(unique=True)

    meta_title = models.CharField(max_length=100, blank=True, null=True, help_text='This shows at the top of the browser, usually in the tab.')
    meta_description = models.CharField(max_length=500, blank=True, null=True)
    meta_tags = models.CharField(max_length=500, blank=True, null=True)

    image_cover = FileBrowseField(max_length=400, blank=True, null=True, help_text='Roughly 1400px by 400px', verbose_name='Cover image')

    is_published = models.BooleanField(default=True)
    create_date = models.DateTimeField(auto_now_add=True)
    modified_date = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return self.label

    def url(self):
        return '/%s' % self.slug

    def get_absolute_url(self):
        return self.url()

    class Meta:
        verbose_name = 'Page'
        verbose_name_plural = 'Pages'
        ordering = ('label',)

    def sections(self):
        return self.pagesection_set.filter(is_published=True)

    @staticmethod
    def get_published_objects():
        return WebPage.objects.filter(is_published=True)

    @staticmethod
    def staff_add_on():
        staff = Member.get_published_objects()
        return staff

    @staticmethod
    def faq_add_on():
        faqs = FAQ.get_published_objects()
        return faqs

    @staticmethod
    def get_news_page():
        pages = WebPage.get_published_objects()
        news_pages = pages.filter(template_choice='news')

        if len(news_pages) > 0:
            news_page = news_pages[0]
        else:
            news_page = None

        return news_page

    @staticmethod
    def article_tag_list():
        tags = Tag.get_published_objects()
        return tags


class PageSection(models.Model):
    page = models.ForeignKey(WebPage)
    label = models.CharField(max_length=400)

    image = FileBrowseField(max_length=400, blank=True, null=True, verbose_name='Section image', help_text='At least 1140px wide')

    display_order = models.IntegerField(default=1, verbose_name='Order')
    is_published = models.BooleanField(default=True)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Section'
        verbose_name_plural = 'Sections'
        ordering = ('display_order', 'label')

    @staticmethod
    def get_published_objects():
        objects = PageSection.objects.filter(is_published=True).order_by('display_order', 'label')

        return objects


class Footer(models.Model):
    site = models.OneToOneField(Site)
    label = models.CharField(max_length=100, help_text='This is only used in the admin.')

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Footer'
        verbose_name_plural = 'Footer'

    def social_links(self):
        return self.footersociallink_set.order_by('order')


class FooterSocialLink(models.Model):
    parent = models.ForeignKey(Footer)
    label = models.CharField(max_length=200)

    image = FileBrowseField(max_length=400)
    link = models.URLField()

    order = models.IntegerField(default=1)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Social Link'
        verbose_name_plural = 'Social Links'
        ordering = ('order', 'label')