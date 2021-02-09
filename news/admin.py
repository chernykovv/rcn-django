from django.contrib import admin
from news.models import Tag, Article


class TagAdmin(admin.ModelAdmin):
    model = Tag
    list_display = ('label', 'order', 'is_published')
    list_editable = ('order', 'is_published')
    search_fields = ('label',)
    list_filter = ('is_published',)

    prepopulated_fields = {'slug': ('label',)}

    actions_on_top = False
    actions_on_bottom = True

    fieldsets = (

        (None, {
            'classes': ('suit-tab suit-tab-general full-width',),
            'fields': ('label', 'order', 'is_published')
        }),

        (None, {
            'classes': ('suit-tab suit-tab-seo full-width',),
            'fields': ('meta_title', 'meta_description', 'meta_tags', 'slug')
        }),

    )

    suit_form_tabs = (('general', 'General'), ('seo', 'SEO'))


class ArticleAdmin(admin.ModelAdmin):
    model = Article
    list_display = ('label', 'author', 'publish_date', 'is_published')
    list_editable = ('is_published',)
    search_fields = ('label', 'author', 'content')
    list_filter = ('is_published',)

    prepopulated_fields = {'slug': ('label',)}

    actions_on_top = False
    actions_on_bottom = True

    fieldsets = (

        (None, {
            'classes': ('suit-tab suit-tab-general full-width',),
            'fields': ('label', 'author', 'tags', 'image', 'teaser', 'content', 'publish_date', 'is_published')
        }),

        (None, {
            'classes': ('suit-tab suit-tab-seo full-width',),
            'fields': ('meta_title', 'meta_description', 'meta_tags', 'slug')
        }),

    )

    suit_form_tabs = (('general', 'General'), ('seo', 'SEO'))

    class Media:
        js = [
            '/static/admin_js/tinymce/tinymce.min.js',
            '/static/admin_js/tinymce_init.js'
        ]


admin.site.register(Tag, TagAdmin)
admin.site.register(Article, ArticleAdmin)