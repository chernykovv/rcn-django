from django import forms
from models import ContactLead, ProposalRequest


US_STATE_CHOICES = [
    ('', '-- select --'),
    ('AL', 'Alabama'),
    ('AK', 'Alaska'),
    ('AZ', 'Arizona'),
    ('AR', 'Arkansas'),
    ('CA', 'California'),
    ('CO', 'Colorado'),
    ('CT', 'Connecticut'),
    ('DE', 'Delaware'),
    ('DC', 'District of Columbia'),
    ('FL', 'Florida'),
    ('GA', 'Georgia'),
    ('HI', 'Hawaii'),
    ('ID', 'Idaho'),
    ('IL', 'Illinois'),
    ('IN', 'Indiana'),
    ('IA', 'Iowa'),
    ('KS', 'Kansas'),
    ('KY', 'Kentucky'),
    ('LA', 'Louisiana'),
    ('ME', 'Maine'),
    ('MD', 'Maryland'),
    ('MA', 'Massachusetts'),
    ('MI', 'Michigan'),
    ('MN', 'Minnesota'),
    ('MS', 'Mississippi'),
    ('MO', 'Missouri'),
    ('MT', 'Montana'),
    ('NE', 'Nebraska'),
    ('NV', 'Nevada'),
    ('NH', 'New Hampshire'),
    ('NJ', 'New Jersey'),
    ('NM', 'New Mexico'),
    ('NY', 'New York'),
    ('NC', 'North Carolina'),
    ('ND', 'North Dakota'),
    ('OH', 'Ohio'),
    ('OK', 'Oklahoma'),
    ('OR', 'Oregon'),
    ('PA', 'Pennsylvania'),
    ('PR', 'Puerto Rico'),
    ('RI', 'Rhode Island'),
    ('SC', 'South Carolina'),
    ('SD', 'South Dakota'),
    ('TN', 'Tennessee'),
    ('TX', 'Texas'),
    ('UT', 'Utah'),
    ('VT', 'Vermont'),
    ('VA', 'Virginia'),
    ('WA', 'Washington'),
    ('WV', 'West Virginia'),
    ('WI', 'Wisconsin'),
    ('WY', 'Wyoming'),
]

FORM_US_STATE_CHOICES = list(US_STATE_CHOICES)


WAYS_T0_REACH = (
    ('Phone', 'Phone'),
    ('Email', 'Email'),
)


YES_NO = (
    ('yes', 'Yes'),
    ('no', 'No'),
)


class ContactForm(forms.ModelForm):
    preferred_method = forms.ChoiceField(choices=WAYS_T0_REACH, widget=forms.RadioSelect, required=True)

    class Meta:
        model = ContactLead
        fields = ('first_name', 'last_name', 'phone', 'email', 'preferred_method', 'message')


class ProposalForm(forms.ModelForm):
    preferred_method = forms.ChoiceField(choices=WAYS_T0_REACH, widget=forms.RadioSelect, required=True)
    same_assessment = forms.ChoiceField(choices=YES_NO, widget=forms.RadioSelect, required=True)
    board_member = forms.ChoiceField(choices=YES_NO, widget=forms.RadioSelect, required=True)
    board_requested = forms.ChoiceField(choices=YES_NO, widget=forms.RadioSelect, required=True)
    reserve_study = forms.ChoiceField(choices=YES_NO, widget=forms.RadioSelect, required=True)

    state = forms.CharField(required=True, widget=forms.Select(choices=FORM_US_STATE_CHOICES))

    meeting_frequency = forms.ChoiceField(required=True, widget=forms.Select)
    fee_collection = forms.ChoiceField(required=True, widget=forms.Select)
    association_types = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple, required=False)
    common_properties = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple, required=False)

    class Meta:
        model = ProposalRequest
        fields = ('first_name', 'last_name', 'phone', 'email', 'preferred_method', 'subdivision', 'association_name', 'city', 'state', 'zip',
                  'number_of_homes', 'meeting_frequency', 'fee_collection', 'same_assessment', 'association_types', 'common_properties', 'board_member',
                  'board_requested', 'reserve_study', 'transition_date', 'proposal_due_date')

    def __init__(self, meeting_list, collection_list, association_list, property_list, *args, **kwargs):
        super(ProposalForm, self).__init__(*args, **kwargs)

        default_tuple = ('', '-- select --')

        # BUILD MEETING FREQUENCY
        frequency_choices = [default_tuple]
        for item in meeting_list:
            key_tuple = (item.label, item.label)
            frequency_choices.append(key_tuple)

        self.fields['meeting_frequency'].choices = frequency_choices

        # BUILD FEE COLLECTION
        collection_choices = [default_tuple]
        for item in collection_list:
            key_tuple = (item.label, item.label)
            collection_choices.append(key_tuple)

        self.fields['fee_collection'].choices = collection_choices

        # BUILD ASSOCIATION TYPES
        association_choices = []
        for item in association_list:
            key_tuple = (item.id, item.label)
            association_choices.append(key_tuple)

        self.fields['association_types'].choices = association_choices

        # BUILD COMMON PROPERTIES
        property_choices = []
        for item in property_list:
            key_tuple = (item.id, item.label)
            property_choices.append(key_tuple)

        self.fields['common_properties'].choices = property_choices