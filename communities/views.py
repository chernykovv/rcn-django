from django.utils import timezone
from django.http import FileResponse, HttpResponse, HttpResponseRedirect
from django.views.generic import TemplateView, View
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from page_content.views import view_web_page
from .models import Document, Banner, Document, ComSliders, DocCategory
from faqs.models import Faq
from questions.models import Community
from page_content.models import WebPage


class CommunityView(TemplateView):
    template_name = 'communities/community.html'

    def get_context_data(self, slug, *args, **kwargs):
        try:
            community = Community.objects.get(slug=slug)
        except:
            view_web_page(self.request, slug)

        try:
            if community.banner.end_date < timezone.localtime(timezone.now()):
                community.banner.is_active = False
            else:
                community.banner.is_active = True
        except:
            pass

        faqs = Faq.objects.all()
        documents = Document.objects.filter(community=community)
        comsliders = ComSliders.objects.filter(community=community)
        doccat=[]
        for doc in documents:
            if(doc.category):
                if(doc.category not in doccat):
                    doccat.append(doc.category)
        doccat.append(0);

        context = {
            'community': community,
            'documents': documents,
            'doccat':doccat,
            'comsliders': comsliders,
            'faqs': faqs
        }
        return context

    def post(self, request, *args, **kwargs):
        pk = request.GET.get('pk')
        document = Document.objects.get(pk=pk)
        response = HttpResponse(document.file, content_type="application/image")
        response['Content-Disposition'] = 'inline; filename=' + document.file.name
        return response


class DocumentDeleteView(View):
    def post(self, request, pk, *args, **kwargs):
        doc = Document.objects.get(pk=pk)
        doc.delete()
        return HttpResponse(status=200)

class DocumentEditView(View):
    def post(self, request, pk, com_pk, *args, **kwargs):
        title = request.POST.get('title')
        description = request.POST.get('description')
        file = request.FILES.get('file')
        category=request.POST.get('category')
        if(category):
            cat = DocCategory.objects.get(pk=category)
        else:
            cat =None
        doc = Document.objects.get(pk=pk)
        doc.title = title
        doc.description = description
        doc.category=cat
        doc.file = file
        doc.save()

        return HttpResponseRedirect('/admin/questions/community/' + str(com_pk) + '/')


class DocumentCreateView(View):
    def post(self, request, com_pk, *args, **kwargs):
        com = Community.objects.get(pk=com_pk)
        category=request.POST.get('category')
        if(category):
            cat = DocCategory.objects.get(pk=category)
        else:
            cat =None
        title = request.POST.get('title')
        description = request.POST.get('description')
        file = request.FILES.get('file')

        doc = Document(title=title, file=file, description=description, community=com, category=cat)
        doc.save()

        return HttpResponseRedirect('/admin/questions/community/' + str(com_pk) + '/')


class DocCategoryDeleteView(View):
    def post(self, request, pk, *args, **kwargs):
        doc = DocCategory.objects.get(pk=pk)
        doc.delete()
        return HttpResponse(status=200)

class DocCategoryEditView(View):
    def post(self, request, pk, com_pk, *args, **kwargs):
        title =  request.POST.get('title')
        description = request.POST.get('description')
        doc = DocCategory.objects.get(pk=pk)
        doc.description = description
        doc.title = title
        doc.save()

        return HttpResponseRedirect('/admin/questions/community/' + str(com_pk) + '/')


class DocCategoryCreateView(View):
    def post(self, request, *args, **kwargs):
        title =  request.POST.get('title')
        description = request.POST.get('description')
        doc = DocCategory(title=title, description=description)
        doc.save()
        return HttpResponse(status=200)


class ComSlidersDeleteView(View):
    def post(self, request, pk, *args, **kwargs):
        doc = ComSliders.objects.get(pk=pk)
        doc.delete()
        return HttpResponse(status=200)

class ComSlidersEditView(View):
    def post(self, request, pk, com_pk, *args, **kwargs):
        file = request.FILES.get('file')
        order = request.POST.get('order')
        doc = ComSliders.objects.get(pk=pk)
        if request.FILES.get('file'):
            doc.file = file
        doc.order = order
        doc.save()

        return HttpResponseRedirect('/admin/questions/community/' + str(com_pk) + '/')


class ComSlidersCreateView(View):
    def post(self, request, com_pk, *args, **kwargs):
        com = Community.objects.get(pk=com_pk)
        file = request.FILES.get('file')
        order = request.POST.get('order')
        doc = ComSliders(file=file, community=com, order=order)
        doc.save()
        return HttpResponse(status=200)


class DocumentComCreateView(View):
    def post(self, request, *args, **kwargs):
        com = Community()
        com.title = ''
        com.slug = ''
        com.save()
        title = request.POST.get('title')
        description = request.POST.get('description')
        file = request.FILES.get('file')

        doc = Document(title=title, file=file, description=description, community=com)
        doc.save()
        data = {
        'is_taken': str(com.pk)
        }
        return JsonResponse(data)

class WebPageGetDetailAjax(View):
    def post(self, request, *args, **kwargs):
        pk = request.POST.get('pk')
        document = WebPage.objects.get(pk=pk)
        data = {
        'is_taken':document.slug
        }
        return JsonResponse(data)
