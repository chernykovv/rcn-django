from django.contrib import admin
from models import *


class SocialLinkInline(admin.TabularInline):
    model = MemberSocialLink
    sortable_field_name = 'order'
    extra = 1


class MemberAdmin(admin.ModelAdmin):
    list_display = ('name', 'position', 'order')
    list_editable = ('order',)
    prepopulated_fields = {'slug': ['name', 'position']}

    fieldsets = (

        (None, {
            'classes': ('suit-tab suit-tab-general',),
            'fields': ('name', 'position', 'order', 'image', 'is_published')
        }),

        (None, {
            'classes': ('suit-tab suit-tab-general full-width',),
            'fields': ('teaser', 'bio')
        }),

        (None, {
            'classes': ('suit-tab suit-tab-seo',),
            'fields': ('meta_title', 'meta_description', 'meta_tags', 'slug')
        }),

    )

    inlines = [
        SocialLinkInline
    ]

    suit_form_tabs = (('general', 'General'), ('seo', 'SEO'))

    class Media:
        js = [
            '/static/admin_js/tinymce/tinymce.min.js',
            '/static/admin_js/tinymce_init.js'
        ]


admin.site.register(Member, MemberAdmin)