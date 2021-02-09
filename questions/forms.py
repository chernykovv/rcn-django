from django import forms

from .models import Question, Community, DueRequestStatus



class QuestionForm(forms.ModelForm):
	class Meta:
		model = Question
		fields = ('neighborhood', 'name', 'address', 'phone', 'email')

	neighborhood = forms.ModelChoiceField(queryset=Community.objects.all(),
                        widget=forms.Select(
                                attrs={
                                    'onblur': 'validCho(this)'
                                }
                            ))

	# info = forms.CharField(
    #     label='Homeowner Information',
    #     widget=forms.TextInput(
    #         attrs={
    #         	'class': 'form-control need_valid',
    #             'onblur': 'validField(this)'
    #         }
    #     ),
    #     required=False,
    # )
	name = forms.CharField(
		max_length=255,
		label='Full Name',
        required=True,
        widget=forms.TextInput(
            attrs={
            	'class': 'form-control need_valid',
                'onblur': 'validField(this)'
            }
        )
    )
	address = forms.CharField(
        label='Address',
        widget=forms.TextInput(
            attrs={
            	'class': 'form-control need_valid',
                'onblur': 'validField(this)'
            }
        ),
        required=False,
    )
	phone = forms.CharField(
        label='Phone',
        widget=forms.TextInput(
            attrs={
            'class': 'form-control need_valid',
            'onblur': 'validPhone(this)'
            }
        ),
        required=False,
    )
	email = forms.CharField(
        label='Email',
        widget=forms.TextInput(
            attrs={
            'class': 'form-control need_valid',
            'onblur': 'validEmail(this)'
            }
        ),
        required=False,
    )

class DueRequestStatusForm(forms.ModelForm):
	class Meta:
		model = DueRequestStatus
		fields = ('neighborhood', 'firstname', 'lastname', 'phone', 'email')

	neighborhood = forms.ModelChoiceField(queryset=Community.objects.all(),
                        widget=forms.Select(
                                attrs={
                                    'onblur': 'validCho(this)'
                                }
                            ))

	# info = forms.CharField(
    #     label='Homeowner Information',
    #     widget=forms.TextInput(
    #         attrs={
    #         	'class': 'form-control need_valid',
    #             'onblur': 'validField(this)'
    #         }
    #     ),
    #     required=False,
    # )
	firstname = forms.CharField(
		max_length=255,
		label='Full Name',
        required=True,
        widget=forms.TextInput(
            attrs={
            	'class': 'form-control need_valid',
                'onblur': 'validField(this)'
            }
        )
    )
	lastname = forms.CharField(
        label='Address',
        widget=forms.TextInput(
            attrs={
            	'class': 'form-control need_valid',
                'onblur': 'validField(this)'
            }
        ),
        required=False,
    )
	phone = forms.CharField(
        label='Phone',
        widget=forms.TextInput(
            attrs={
            'class': 'form-control need_valid',
            'onblur': 'validPhone(this)'
            }
        ),
        required=False,
    )
	email = forms.CharField(
        label='Email',
        widget=forms.TextInput(
            attrs={
            'class': 'form-control need_valid',
            'onblur': 'validEmail(this)'
            }
        ),
        required=False,
    )
