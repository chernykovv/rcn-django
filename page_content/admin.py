from django.contrib import admin
from page_content.models import *


class LogoAdmin(admin.ModelAdmin):
    list_display = ('label',)

    fieldsets = (
        (None, {
            'classes': ('full-width',),
            'fields': ('site', 'label', 'image')
        }),

    )


class PageSectionInline(admin.TabularInline):
    model = PageSection
    sortable_field_name = "display_order"
    extra = 1


class WebPageAdmin(admin.ModelAdmin):
    model = WebPage
    list_display = ('label', 'is_published', 'create_date')
    list_filter = ('modified_date', 'is_published')
    list_editable = ('is_published',)

    prepopulated_fields = {'slug': ('label',)}
    search_fields = ('label',)
    save_as = True

    inlines = [
        PageSectionInline,
    ]

    fieldsets = (

        (None, {
            'classes': ('suit-tab suit-tab-general full-width',),
            'fields': ('template_choice', 'template_addon', 'label', 'image_cover', 'is_published')
        }),

        (None, {
            'classes': ('suit-tab suit-tab-seo full-width',),
            'fields': ('meta_title', 'meta_description', 'meta_tags', 'slug')
        }),

    )

    suit_form_includes = (
        ('admin/suit_includes/edit_page_content.html', 'bottom', 'general'),
    )

    suit_form_tabs = (('general', 'General'), ('seo', 'SEO'))

    class Media:
        js = [
            '/static/admin_js/custom/web_page.js',
        ]


class FAQAdmin(admin.ModelAdmin):
    model = FAQ
    list_display = ('label', 'order', 'is_published')
    list_filter = ('is_published',)
    list_editable = ('order', 'is_published')

    search_fields = ('label',)
    save_as = True

    fieldsets = (

        (None, {
            'classes': ('full-width',),
            'fields': ('label', 'question', 'answer', 'order', 'is_published')
        }),

    )


class SocialLinkInline(admin.TabularInline):
    model = FooterSocialLink
    sortable_field_name = 'order'
    extra = 1


class FooterAdmin(admin.ModelAdmin):
    list_display = ('label',)

    fieldsets = (
        (None, {
            'classes': ('full-width',),
            'fields': ('site', 'label')
        }),

    )

    inlines = [
        SocialLinkInline,
    ]

    suit_form_includes = (
        ('admin/suit_includes/edit_footer_content.html', 'bottom', 'general'),
    )


admin.site.register(Logo, LogoAdmin)
admin.site.register(WebPage, WebPageAdmin)
admin.site.register(FAQ, FAQAdmin)
admin.site.register(Footer, FooterAdmin)