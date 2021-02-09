import logging
from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import RequestContext
from home_content.models import HomeSection, Billboard, MiniBillboard, BenefitGroup
from utility import set_detail_context
from django.views.generic import TemplateView


def view_home(request):
    try:
        sections = HomeSection.get_published_objects()
    except Exception, e:
        logging.error(e)
        sections = None

    try:
        billboards = Billboard.get_published_objects()
    except Exception, e:
        logging.error(e)
        billboards = None

    try:
        mini_billboards = MiniBillboard.get_published_objects()
    except Exception, e:
        logging.error(e)
        mini_billboards = None

    try:
        benefit_groups = BenefitGroup.get_published_objects()
    except Exception, e:
        logging.error(e)
        benefit_groups = None

    context = {'sections': sections, 'billboards': billboards, 'mini_billboards': mini_billboards, 'benefit_groups': benefit_groups}
    set_detail_context(request, context)

    template = 'home.html'

    return render_to_response(template, context, context_instance=RequestContext(request))


def redirect_community(request):
    return HttpResponseRedirect('http://community.realclearneighborhoods.com/login/')


class PaymentView(TemplateView):
    template_name = 'payment.html'

payment_view = PaymentView.as_view()
