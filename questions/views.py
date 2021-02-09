from django.views.generic import TemplateView, View
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.http import JsonResponse
from .forms import QuestionForm, DueRequestStatusForm
from .models import Question, QuestionPart, Community, File, DueRequestStatus


class ViolationView(TemplateView):
    template_name = 'questions/violation.html'

    def get_context_data(self, *args, **kwargs):

        try:
            slug = self.request.GET.get('community')
            community = Community.objects.filter(slug=slug).first()
            form = QuestionForm(initial={'neighborhood': community.pk})
        except:
            form = QuestionForm()

        context = {
            'form': form
        }

        return context

    def post(self, request, *args, **kwargs):
        data = request.POST
        data._mutable = True
        neighborhood = Community.objects.get(pk=request.POST.get('neighborhood'))
        name = data.get('name')
        address = data.get('address')
        phone = data.get('phone')
        email = data.get('email')
        type = data.get('type')
        q = Question.objects.create(
            neighborhood=neighborhood,
            name=name,
            address=address,
            phone=phone,
            email=email,
            type=type
        )

        remove_list = ['neighborhood', 'name', 'address', 'phone', 'email', 'type']
        for item in remove_list:
            data.pop(item)

        for x in data:
            if data[x] != '':
                part = QuestionPart(question=x, answer=data[x])
                part.save()
                q.questions.add(part)

        q.save()

        return HttpResponseRedirect(reverse('violation_view'))


class MaintenanceView(TemplateView):
    template_name = 'questions/maintenance.html'

    def get_context_data(self, *args, **kwargs):

        try:
            slug = self.request.GET.get('community')
            community = Community.objects.filter(slug=slug).first()
            form = QuestionForm(initial={'neighborhood': community.pk})
        except:
            form = QuestionForm()

        context = {
            'form': form
        }

        return context

    def post(self, request, *args, **kwargs):
        data = request.POST
        data._mutable = True
        neighborhood = Community.objects.get(pk=request.POST.get('neighborhood'))
        name = data.get('name')
        address = data.get('address')
        phone = data.get('phone')
        email = data.get('email')
        type = data.get('type')
        q = Question.objects.create(
            neighborhood=neighborhood,
            name=name,
            address=address,
            phone=phone,
            email=email,
            type=type
        )

        remove_list = ['neighborhood', 'name', 'address', 'phone', 'email', 'type']
        for item in remove_list:
            data.pop(item)

        for x in data:
            if data[x] != '':
                print(data[x])
                part = QuestionPart(question=x, answer=data[x])
                part.save()
                q.questions.add(part)
        q.save()

        return HttpResponseRedirect(reverse('maintenance_view'))


class NewOwnerView(TemplateView):
    template_name = 'questions/new_owner.html'

    def post(self, request, *args, **kwargs):
        neighborhood = Community.objects.get(pk=request.POST.get('neighborhood'))
        name = request.POST.get('first_name') + ' ' + request.POST.get('last_name')
        address = request.POST.get('state') + ', ' + request.POST.get('city') + ', ' + request.POST.get('zip') + ', ' + request.POST.get('address')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        type = request.POST.get('type')
        q = Question(
            neighborhood = neighborhood,
            name = name,
            address = address,
            phone = phone,
            email = email,
            type=type
        )
        q.save()

        return HttpResponseRedirect('/' + neighborhood.slug + '/')


class ReviewView(TemplateView):
    template_name = 'questions/review.html'

    def get_context_data(self, *args, **kwargs):

        try:
            slug = self.request.GET.get('community')
            community = Community.objects.filter(slug=slug).first()
            form = QuestionForm(initial={'neighborhood': community.pk})
        except:
            form = QuestionForm()

        context = {
            'form': form
        }

        return context

    def post(self, request, *args, **kwargs):
        data = request.POST
        data._mutable = True
        neighborhood = Community.objects.get(pk=request.POST.get('neighborhood'))
        name = data.get('name')
        address = data.get('address')
        phone = data.get('phone')
        email = data.get('email')
        type = request.POST.get('type')

        q = Question.objects.create(
            neighborhood=neighborhood,
            name=name,
            address=address,
            phone=phone,
            email=email,
            type=type
        )

        try:
            files = request.FILES.getlist('file')
            for file in files:

                instance = File(image=file)
                instance.save()
                q.file.add(instance)
        except:
            pass

        remove_list = ['neighborhood', 'name', 'address', 'phone', 'email', 'type', 'file']
        for item in remove_list:
            data.pop(item)

        for x in data:
            if data[x] != '':
                part = QuestionPart(question=x, answer=data[x])
                part.save()
                q.questions.add(part)

        q.save()

        return HttpResponseRedirect(reverse('review_view'))


class DueRequetView(TemplateView):
    template_name = 'questions/duerequest.html'

    def get_context_data(self, *args, **kwargs):

        try:
            slug = self.request.GET.get('community')
            community = Community.objects.filter(slug=slug).first()
            form = DueRequestStatusForm(initial={'neighborhood': community.pk})
        except:
            form = DueRequestStatusForm()

        context = {
            'form': form
        }

        return context

    def post(self, request, *args, **kwargs):
        data = request.POST
        data._mutable = True
        neighborhood = Community.objects.get(pk=request.POST.get('neighborhood'))
        firstname = data.get('firstname')
        lastname = data.get('lastname')
        compnay = data.get('compnay')
        created_at = data.get('created_at')
        address = data.get('address')
        phone = data.get('phone')
        email = data.get('email')
        lot = data.get('lot')
        city = data.get('city')
        state = data.get('state')
        zip = data.get('zip')
        owner_seller = data.get('owner_seller')
        buyer = data.get('buyer')
        closing_date = data.get('closing_date')
        needed_by = data.get('needed_by')
        comment = data.get('comment')
        q = DueRequestStatus.objects.create(
            neighborhood=neighborhood,
            firstname=firstname,
            address=address,
            phone=phone,
            email=email,
            lastname=lastname,
            compnay=compnay,
            created_at=created_at,
            lot=lot,
            city=city,
            state=state,
            zip=zip,
            owner_seller=owner_seller,
            buyer=buyer,
            closing_date=closing_date,
            needed_by=needed_by,
            comment=comment
        )
        q.save()

        return HttpResponseRedirect(reverse('duerequest_view'))

class GetBadgesAjax(View):
    def post(self, request, *args, **kwargs):
        new_owner=Question.objects.filter(type='new_owner',is_resolved=1).count()
        maintenance=Question.objects.filter(type='maintenance',is_resolved=1).count()
        review=Question.objects.filter(type='review',is_resolved=1).count()
        violation=Question.objects.filter(type='violation',is_resolved=1).count()
        duerequeststatus = DueRequestStatus.objects.filter(is_resolved=1).count()
        data = {
        'duerequeststatus':duerequeststatus,
        'new_owner':new_owner,
        'maintenance':maintenance,
        'review':review,
        'violation':violation,
        }
        return JsonResponse(data)
