from django.contrib import admin
from models import *


class ContactAdmin(admin.ModelAdmin):
    model = ContactLead
    list_display = ('first_name', 'last_name', 'date')
    list_filter = ('date',)
    search_fields = ('first_name', 'last_name', 'subdivision')

    readonly_fields = ('first_name', 'last_name', 'phone', 'email', 'preferred_method', 'message')

    fieldsets = (

        (None, {
            'classes': ('full-width',),
            'fields': ('first_name', 'last_name', 'phone', 'email', 'preferred_method', 'message')
        }),

    )


class MeetingFrequencyAdmin(admin.ModelAdmin):
    model = MeetingFrequency
    list_display = ('label', 'order', 'is_published')
    list_editable = ('order', 'is_published')
    list_filter = ('is_published',)

    fieldsets = (

        (None, {
            'classes': ('full-width',),
            'fields': ('label', 'order', 'is_published')
        }),

    )


class CollectionProcessAdmin(admin.ModelAdmin):
    model = CollectionProcess
    list_display = ('label', 'order', 'is_published')
    list_editable = ('order', 'is_published')
    list_filter = ('is_published',)

    fieldsets = (

        (None, {
            'classes': ('full-width',),
            'fields': ('label', 'order', 'is_published')
        }),

    )


class AssociationTypeAdmin(admin.ModelAdmin):
    model = AssociationType
    list_display = ('label', 'order', 'is_published')
    list_editable = ('order', 'is_published')
    list_filter = ('is_published',)

    fieldsets = (

        (None, {
            'classes': ('full-width',),
            'fields': ('label', 'asterisk', 'order', 'is_published')
        }),

    )


class CommonPropertyAdmin(admin.ModelAdmin):
    model = CommonProperty
    list_display = ('label', 'order', 'is_published')
    list_editable = ('order', 'is_published')
    list_filter = ('is_published',)

    fieldsets = (

        (None, {
            'classes': ('full-width',),
            'fields': ('label', 'order', 'is_published')
        }),

    )


class ProposalAdmin(admin.ModelAdmin):
    model = ProposalRequest
    list_display = ('first_name', 'last_name', 'subdivision', 'date')
    list_filter = ('date',)
    search_fields = ('first_name', 'last_name', 'subdivision')

    readonly_fields = ('first_name', 'last_name', 'phone', 'email', 'preferred_method', 'subdivision', 'association_name', 'city', 'state', 'zip',
                       'number_of_homes', 'meeting_frequency', 'fee_collection', 'same_assessment', 'association_types', 'common_properties',
                       'board_member', 'board_requested', 'reserve_study', 'transition_date', 'proposal_due_date', 'date')

    fieldsets = (

        (None, {
            'classes': ('full-width',),
            'fields': ('first_name', 'last_name', 'phone', 'email', 'preferred_method', 'subdivision', 'association_name', 'city', 'state', 'zip',
                       'number_of_homes', 'meeting_frequency', 'fee_collection', 'same_assessment', 'association_types', 'common_properties',
                       'board_member', 'board_requested', 'reserve_study', 'transition_date', 'proposal_due_date', 'date')
        }),

    )


admin.site.register(ContactLead, ContactAdmin)
admin.site.register(MeetingFrequency, MeetingFrequencyAdmin)
admin.site.register(CollectionProcess, CollectionProcessAdmin)
admin.site.register(AssociationType, AssociationTypeAdmin)
admin.site.register(CommonProperty, CommonPropertyAdmin)
admin.site.register(ProposalRequest, ProposalAdmin)