from django import forms
from django.contrib import admin
from django.utils.safestring import mark_safe

from .models import Question, QuestionPart, File, Community, DueRequestStatus
from communities.models import Document, Banner, ComSliders, DocCategory



class CommunityForm(forms.ModelForm):

    class Meta:
        model = Community
        fields = ['title', 'variable_section', 'slug', 'variable_title']

class BannerInline(admin.TabularInline):
    model = Banner

class CommunityAdmin(admin.ModelAdmin):
    change_form_template = 'communities/admin_form.html'
    change_list_template = 'admin/list2.html'
    form = CommunityForm
    inlines = [
        BannerInline
    ]

    def change_view(self, request, object_id, form_url='', extra_context=None):
        extra_context = extra_context or {}
        c = Community.objects.get(pk=object_id)
        q = Document.objects.filter(community=c)
        s = ComSliders.objects.filter(community=c)
        ct = DocCategory.objects.all()


        extra_context['documents'] = q.all()
        extra_context['comsliders'] = s.all()
        extra_context['category'] = ct
        extra_context['com_pk'] = object_id

        if request.POST:
            print('banner');
            print(request.POST['banner-0-end_date_0'])
            print(request.POST['banner-0-end_date_1'])

        return super(CommunityAdmin, self).change_view(
            request, object_id, form_url, extra_context=extra_context,
        )


admin.site.register(Community, CommunityAdmin)
admin.site.register(Document)
admin.site.register(Banner)



class QuestionAdminForm(forms.ModelForm):
    note = forms.CharField(widget=forms.Textarea, required=False)
    class Meta:
        model = Question
        fields = '__all__'


class QuestionAdmin(admin.ModelAdmin):
    model = Question
    change_form_template = 'admin/form.html'
    change_list_template = 'admin/list.html'
    list_display = ('name', 'community', 'created_at', 'is_resolved', 'assigned_admin')
    readonly_fields = ['name', 'neighborhood', 'address', 'phone', 'email', 'type', 'created_at']
    save_as = True
    exclude = ['questions', 'file']
    list_display_links = []
    form = QuestionAdminForm

    def change_view(self, request, object_id, form_url='', extra_context=None):
        extra_context = extra_context or {}
        q = Question.objects.get(pk=object_id)
        files = q.file.all()
        for file in files:
            file.image = mark_safe('<a href="{0}">{1}</a>'.format(file.image.url, file.image.name[2:]))

        extra_context['file_links'] = files
        extra_context['questions'] = q.questions.all()

        if q.assigned_admin != None:
            extra_context['email'] = q.assigned_admin.email
        else:
            extra_context['email'] = 'Admin not selected'

        return super(QuestionAdmin, self).change_view(
            request, object_id, form_url, extra_context=extra_context,
        )

    def community(self, obj):
        return obj.neighborhood
    community.admin_order_field = 'neighborhood'

admin.site.register(Question, QuestionAdmin)
admin.site.register(File)

class DueRequestStatusAdmin(admin.ModelAdmin):
    model = DueRequestStatus
    change_form_template = 'admin/form.html'
    change_list_template = 'admin/list.html'
    list_display = ('firstname', 'lastname', 'neighborhood', 'is_resolved',  'email', 'created_at')

admin.site.register(DueRequestStatus, DueRequestStatusAdmin)
