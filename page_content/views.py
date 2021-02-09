import logging
from django.http import Http404, HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import RequestContext
from forms.forms import ContactForm, ProposalForm
from forms.models import AssociationType, CommonProperty, MeetingFrequency, CollectionProcess
from navigation.models import SubPrimaryNavigation
from news.views import view_article_list
from page_content.models import WebPage
from staff.models import Member
from utility import set_detail_context


TEMPLATE_CONTROLLER_MAP = {'news': '/news/'}


def edit_web_page(request, a_slug):
    edit = True
    return view_web_page(request, a_slug, edit)


def view_web_page(request, a_slug, edit=None):
    try:
        # IF WE ARE IN EDIT MODE, WE NEED TO LOOK FOR ALL PAGES
        # REGARDLESS OF IT'S PUBLISHED STATE
        if edit:
            page = WebPage.objects.get(id=a_slug)

        else:
            page = WebPage.objects.get(slug=a_slug, is_published=True)

    except:
        raise Http404

    # GET MATCHING LINK
    page_link, sub_link = get_matching_links(a_slug)

    # SOME PAGES NEED TO BE RENDERED FROM A SEPARATE VIEW
    if page.template_choice and len(page.template_choice) > 1:

        if TEMPLATE_CONTROLLER_MAP.has_key(page.template_choice):
            url = TEMPLATE_CONTROLLER_MAP[page.template_choice]
            return HttpResponseRedirect(url + page.slug)

    # OTHERS CAN BE HANDLED BY SIMPLY LOADING A NEW TEMPLATE
    template_choice = page.template_choice
    template = get_current_template(template_choice)

    if not template:
        raise Http404

    # CHECK FOR ADD-ON
    template_add_on = page.template_addon

    # DO WE NEED TO ATTACH THE CONTACT FORM?
    if template_choice == '1_col_contact' or template_choice == '2_col_contact':
        contact_form = ContactForm(prefix='contact_form')

    else:
        contact_form = None

    # DO WE NEED TO ATTACH THE PROPOSAL FORM?
    if template_add_on == 'proposal':
        meeting_list = MeetingFrequency.get_published_objects()
        collection_list = CollectionProcess.get_published_objects()
        association_types = AssociationType.get_published_objects()
        common_properties = CommonProperty.get_published_objects()
        proposal_form = ProposalForm(prefix='proposal_form', meeting_list=meeting_list, collection_list=collection_list,
                                     association_list=association_types, property_list=common_properties)

    else:
        proposal_form = None

    context = {'page': page, 'page_link': page_link, 'sub_link': sub_link, 'template_add_on': template_add_on,
               'contact_form': contact_form, 'proposal_form': proposal_form}
    set_detail_context(request, context)

    return render_to_response(template, context, context_instance=RequestContext(request))


def view_staff_member(request, a_slug, staff_slug):
    try:
        page = WebPage.objects.get(slug=a_slug, is_published=True)

    except:
        raise Http404

    # GET MATCHING LINK
    page_link, sub_link = get_matching_links(a_slug)

    try:
        staff_member = Member.objects.get(slug=staff_slug)

    except Exception, e:
        logging.error(e)
        raise Http404

    template = 'detail_pages/staff_member.html'

    context = {'member': staff_member, 'page': page, 'page_link': page_link, 'sub_link': sub_link}
    set_detail_context(request, context)

    return render_to_response(template, context, context_instance=RequestContext(request))


def get_matching_links(a_slug):
    # TRY TO FIND MATCHING SUB LINK
    try:
        sub_links = SubPrimaryNavigation.objects.filter(page__slug=a_slug)
        if len(sub_links) > 0:
            sub_link = sub_links[0]

        else:
            sub_link = None

    except Exception, e:
        print e
        sub_link = None

    # IF SUB LINK, GET SUB LINKS PARENT
    if sub_link:
        page_link = sub_link.parent

    else:
        page_link = None

    return page_link, sub_link


def get_current_template(template_choice):
    if template_choice == '1_col':
        template = 'detail_pages/1_col.html'

    elif template_choice == '1_col_contact':
        template = 'detail_pages/1_col_contact.html'

    elif template_choice == '2_col':
        template = 'detail_pages/2_col.html'

    elif template_choice == '2_col_contact':
        template = 'detail_pages/2_col_contact.html'

    elif template_choice == 'landing':
        template = 'detail_pages/landing_page.html'

    else:
        template = None

    return template