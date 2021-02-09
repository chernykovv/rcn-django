from django.db import models


class Faq(models.Model):
    question = models.CharField(max_length=512)
    answer = models.CharField(max_length=512)

    def __unicode__(self):
        return unicode(self.question) or u''