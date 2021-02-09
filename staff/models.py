from django.db import models
from filebrowser.fields import FileBrowseField


class Member(models.Model):
    name = models.CharField(max_length=100)
    position = models.CharField(max_length=100)
    slug = models.SlugField(unique=True)

    meta_title = models.CharField(max_length=100, blank=True, null=True, help_text='This shows at the top of the browser, usually in the tab.')
    meta_description = models.CharField(max_length=500, blank=True, null=True)
    meta_tags = models.CharField(max_length=500, blank=True, null=True)

    image = FileBrowseField(max_length=1000)

    teaser = models.CharField(max_length=100)
    bio = models.TextField(max_length=2000)

    is_published = models.BooleanField(default=True)
    order = models.IntegerField()

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = 'Staff Member'
        verbose_name_plural = 'Staff Members'
        ordering = ('order', 'name')

    def url(self):
        return '/staff-member/%s' % self.slug

    def get_absolute_url(self):
        return self.url()

    def social_links(self):
        return self.membersociallink_set.order_by('order')

    @staticmethod
    def get_published_objects():
        staff = Member.objects.filter(is_published=True).order_by('order')

        return staff


class MemberSocialLink(models.Model):
    parent = models.ForeignKey(Member)
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