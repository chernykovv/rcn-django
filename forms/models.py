from django.db import models


class ContactLead(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)

    phone = models.CharField(max_length=100, blank=True, null=True)
    email = models.EmailField(max_length=200)
    preferred_method = models.CharField(max_length=50, verbose_name='Best way to reach contact')

    message = models.TextField(max_length=4000)

    date = models.DateField()

    def __unicode__(self):
        return '%s %s' % (self.first_name, self.last_name)

    class Meta:
        verbose_name = 'Contact Lead'
        verbose_name_plural = 'Contact Leads'
        ordering = ('-date', 'first_name', 'last_name')


class MeetingFrequency(models.Model):
    label = models.CharField(max_length=100)

    order = models.IntegerField(default=1)
    is_published = models.BooleanField(default=True)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Meeting Frequency'
        verbose_name_plural = 'Meeting Frequencies'
        ordering = ('order', 'label')

    @staticmethod
    def get_published_objects():
        return MeetingFrequency.objects.filter(is_published=True).order_by('order')


class CollectionProcess(models.Model):
    label = models.CharField(max_length=100)

    order = models.IntegerField(default=1)
    is_published = models.BooleanField(default=True)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Collection Process'
        verbose_name_plural = 'Collection Processes'
        ordering = ('order', 'label')

    @staticmethod
    def get_published_objects():
        return CollectionProcess.objects.filter(is_published=True).order_by('order')


class AssociationType(models.Model):
    label = models.CharField(max_length=100)
    asterisk = models.CharField(max_length=100, blank=True, null=True)

    order = models.IntegerField(default=1)
    is_published = models.BooleanField(default=True)

    def __unicode__(self):
        if self.asterisk:
            return '%s - %s' % (self.label, self.asterisk)
        else:
            return self.label

    class Meta:
        verbose_name = 'Association Type'
        verbose_name_plural = 'Association Types'
        ordering = ('order', 'label')

    @staticmethod
    def get_published_objects():
        return AssociationType.objects.filter(is_published=True).order_by('order')


class CommonProperty(models.Model):
    label = models.CharField(max_length=100)

    order = models.IntegerField(default=1)
    is_published = models.BooleanField(default=True)

    def __unicode__(self):
        return self.label

    class Meta:
        verbose_name = 'Common Property'
        verbose_name_plural = 'Common Properties'
        ordering = ('order', 'label')

    @staticmethod
    def get_published_objects():
        return CommonProperty.objects.filter(is_published=True).order_by('order')


class ProposalRequest(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)

    phone = models.CharField(max_length=100, blank=True, null=True)
    email = models.EmailField(max_length=200)
    preferred_method = models.CharField(max_length=50, verbose_name='Best way to reach contact')

    subdivision = models.CharField(max_length=100)
    association_name = models.CharField(max_length=100)

    city = models.CharField(max_length=100)
    state = models.CharField(max_length=100)
    zip = models.CharField(max_length=100)

    number_of_homes = models.CharField(max_length=100)
    meeting_frequency = models.CharField(max_length=100)
    fee_collection = models.CharField(max_length=100)

    same_assessment = models.CharField(max_length=100)

    association_types = models.ManyToManyField(AssociationType)
    common_properties = models.ManyToManyField(CommonProperty)

    board_member = models.CharField(max_length=100, verbose_name='Board member?')
    board_requested = models.CharField(max_length=100, verbose_name='Board requested?')
    reserve_study = models.CharField(max_length=100, verbose_name='Reserve study prepared?')

    transition_date = models.CharField(max_length=100)
    proposal_due_date = models.CharField(max_length=100)

    date = models.DateField(verbose_name='Submitted date')

    def __unicode__(self):
        return '%s %s' % (self.first_name, self.last_name)

    class Meta:
        verbose_name = 'Proposal Request'
        verbose_name_plural = 'Proposal Requests'
        ordering = ('-date', 'first_name', 'last_name')