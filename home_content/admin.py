from django.contrib import admin
from home_content.models import *


class ImageInline(admin.TabularInline):
    model = SectionSlideShowImage
    sortable_field_name = 'order'
    extra = 1


class SectionAdmin(admin.ModelAdmin):
    model = HomeSection
    list_display = ('label', 'order', 'is_published')
    list_editable = ('order', 'is_published')
    search_fields = ('label',)
    list_filter = ('is_published',)

    actions_on_top = False
    actions_on_bottom = True

    fieldsets = (
        (None, {
            'classes': ('full-width',),
            'fields': ('template', 'label', 'slide_position', 'order', 'image_background', 'background_size', 'is_published')
        }),

    )

    inlines = [
        ImageInline,
    ]

    class Media:
        js = [
            '/static/admin_js/custom/home_section.js',
        ]


class BillboardAdmin(admin.ModelAdmin):
    model = Billboard
    list_display = ('label', 'order', 'publish_date', 'is_published')
    list_filter = ('publish_date', 'is_published')
    list_editable = ('order', 'is_published',)

    fieldsets = (

        (None, {
            'classes': ('full-width',),
            'fields': ('label', 'order', 'image', 'header', 'sub_header', 'publish_date', 'expire_date', 'is_published')
        }),

    )


class MiniBillboardAdmin(admin.ModelAdmin):
    model = MiniBillboard
    list_display = ('label', 'order', 'publish_date', 'is_published')
    list_filter = ('publish_date', 'is_published')
    list_editable = ('order', 'is_published',)

    fieldsets = (

        (None, {
            'classes': ('full-width',),
            'fields': ('label', 'order', 'image', 'link', 'publish_date', 'expire_date', 'is_published')
        }),

    )


class GroupAdmin(admin.ModelAdmin):
    model = BenefitGroup
    list_display = ('label', 'order', 'is_published')
    list_filter = ('is_published',)
    list_editable = ('order', 'is_published',)

    fieldsets = (

        (None, {
            'classes': ('full-width',),
            'fields': ('label', 'order', 'image', 'is_published')
        }),

    )


admin.site.register(HomeSection, SectionAdmin)
admin.site.register(Billboard, BillboardAdmin)
admin.site.register(MiniBillboard, MiniBillboardAdmin)
admin.site.register(BenefitGroup, GroupAdmin)