import json
import logging
from django.http import HttpResponse
from django.template import RequestContext
from django.template.loader import render_to_string
from forms import ContactForm, ProposalForm
from models import AssociationType, CommonProperty, MeetingFrequency, CollectionProcess
from utility import create_new_contact, send_email, create_new_proposal


def view_contact_form(request):
    json_data = {}

    # HANDLE CONTACT FORM
    error_message = None
    contact = None

    if request.POST:
        form = ContactForm(prefix='contact_form', data=request.POST)

        if form.is_valid():
            cleaned_data = form.cleaned_data
            contact = create_new_contact(cleaned_data)

            # SEND EMAIL
            try:
                send_email(contact)

            except Exception, e:
                logging.error(e)

            form = ContactForm(prefix='contact_form')

        else:
            error_message = True

    else:
        form = ContactForm(prefix='contact_form')

    context = {'contact': contact, 'contact_form': form}
    form_html = render_to_string('snippets/contact_form.html', context, context_instance=RequestContext(request))
    json_data['form_html'] = form_html
    json_data['error_message'] = error_message

    return HttpResponse(json.dumps(json_data), content_type='application/json')


def view_proposal_form(request):
    json_data = {}
    proposal = None
    error_message = False

    meeting_list = MeetingFrequency.get_published_objects()
    collection_list = CollectionProcess.get_published_objects()
    association_types = AssociationType.get_published_objects()
    common_properties = CommonProperty.get_published_objects()

    # HANDLE PROPOSAL FORM
    if request.POST:
        form = ProposalForm(prefix='proposal_form', data=request.POST, meeting_list=meeting_list, collection_list=collection_list,
                            association_list=association_types, property_list=common_properties)

        if form.is_valid():

            cleaned_data = form.cleaned_data

            proposal = create_new_proposal(request, cleaned_data)

            # SEND EMAIL
            try:
                send_email(proposal)

            except Exception, e:
                logging.error(e)

            form = ProposalForm(prefix='proposal_form', meeting_list=meeting_list, collection_list=collection_list,
                                association_list=association_types, property_list=common_properties)

        else:
            error_message = True

    else:
        form = ProposalForm(prefix='proposal_form', meeting_list=meeting_list, collection_list=collection_list,
                            association_list=association_types, property_list=common_properties)

    context = {'proposal': proposal, 'proposal_form': form, 'association_types': association_types}
    form_html = render_to_string('snippets/proposal_form.html', context, context_instance=RequestContext(request))
    json_data['form_html'] = form_html
    json_data['error_message'] = error_message

    return HttpResponse(json.dumps(json_data), content_type='application/json')