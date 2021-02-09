import logging
import datetime
from django.conf import settings
from django.contrib.sites.models import Site
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from forms.models import ContactLead, ProposalRequest
from navigation.models import PrimaryNavigation
from page_content.models import Logo, Footer


def set_detail_context(request, a_context):
    # CHECK FOR ADMIN USER
    active_user = None
    try:
        if request.user.is_authenticated():
            active_user = request.user

    except Exception, e:
        print e

    a_context['active_user'] = active_user

    # NAV LINKS
    desktop_links = PrimaryNavigation.get_published_objects()[0:5]
    a_context['desktop_links'] = desktop_links

    nav_links = PrimaryNavigation.get_published_objects()
    a_context['nav_links'] = nav_links

    try:
        # GET CURRENT SITE
        current_site = Site.objects.get_current()

    except Exception, e:
        logging.error(e)
        current_site = None

    if current_site:
        try:
            # GET LOGO FOR CURRENT SITE
            logo = Logo.objects.get(site=current_site)

        except Exception, e:
            logging.error(e)
            logo = None

        try:
            # GET FOOTER FOR CURRENT SITE
            footer = Footer.objects.get(site=current_site)

        except Exception, e:
            logging.error(e)
            footer = None

    else:
        logo = None
        footer = None

    a_context['logo'] = logo
    a_context['footer'] = footer


def create_new_contact(cleaned_data):
    contact = ContactLead()
    contact.first_name = cleaned_data['first_name']
    contact.last_name = cleaned_data['last_name']
    contact.phone = cleaned_data['phone']
    contact.email = cleaned_data['email']
    contact.preferred_method = cleaned_data['preferred_method']
    contact.message = cleaned_data['message']
    contact.date = datetime.datetime.now()
    contact.save()

    return contact


def create_new_proposal(request, cleaned_data):
    # GET SELECTED ASSOCIATIONS & PROPERTIES
    selected_associations = request.POST.getlist('proposal_form-association_types')
    selected_properties = request.POST.getlist('proposal_form-common_properties')

    proposal = ProposalRequest()
    proposal.first_name = cleaned_data['first_name']
    proposal.last_name = cleaned_data['last_name']
    proposal.phone = cleaned_data['phone']
    proposal.email = cleaned_data['email']
    proposal.preferred_method = cleaned_data['preferred_method']
    proposal.subdivision = cleaned_data['subdivision']
    proposal.association_name = cleaned_data['association_name']
    proposal.city = cleaned_data['city']
    proposal.state = cleaned_data['state']
    proposal.zip = cleaned_data['zip']
    proposal.number_of_homes = cleaned_data['number_of_homes']
    proposal.meeting_frequency = cleaned_data['meeting_frequency']
    proposal.fee_collection = cleaned_data['fee_collection']
    proposal.same_assessment = cleaned_data['same_assessment']
    proposal.board_member = cleaned_data['board_member']
    proposal.board_requested = cleaned_data['board_requested']
    proposal.reserve_study = cleaned_data['reserve_study']
    proposal.transition_date = cleaned_data['transition_date']
    proposal.proposal_due_date = cleaned_data['proposal_due_date']
    proposal.date = datetime.datetime.now()
    proposal.save()

    for item in selected_associations:
        proposal.association_types.add(item)
        proposal.save()

    for item in selected_properties:
        proposal.common_properties.add(item)
        proposal.save()

    return proposal


def send_email(lead):
    email_context = {'contact': lead}

    subject, from_email, to_email = 'New Contact Lead', settings.DEFAULT_FROM_EMAIL, [settings.ONLINE_CONTACT_EMAIL]
    text_content = render_to_string("emails/contact_string.html", email_context)
    html_content = render_to_string("emails/contact.html", email_context)
    msg = EmailMultiAlternatives(subject, text_content, from_email, to_email)
    msg.attach_alternative(html_content, "text/html")
    msg.send()