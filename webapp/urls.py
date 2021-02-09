from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin

from questions.views import ViolationView, MaintenanceView, NewOwnerView, ReviewView, DueRequetView, GetBadgesAjax
from communities.views import CommunityView, DocumentEditView, DocumentCreateView, DocumentDeleteView, DocumentComCreateView, WebPageGetDetailAjax, ComSlidersCreateView, ComSlidersDeleteView, ComSlidersEditView,  DocCategoryCreateView, DocCategoryDeleteView, DocCategoryEditView
from webapp.views import payment_view

admin.autodiscover()

urlpatterns = patterns(
    'webapp.views',
    url(r'^$', 'view_home'),
)

urlpatterns += patterns('webapp.views',
    url(r'^login/$', 'redirect_community'),
    url(r'^payment/$', payment_view, name='paylease_payment')
)

urlpatterns += patterns('',
    url(r'^homeowners-report-violation/$', ViolationView.as_view() , name='violation_view'),
    url(r'^homeowners-maintenance-request/$', MaintenanceView.as_view() , name='maintenance_view'),
    url(r'^homeowners-new-owner/$', NewOwnerView.as_view() , name='new_owner_view'),
    url(r'^homeowners-architectural-review/$', ReviewView.as_view() , name='review_view'),
    url(r'^dues-status-request', DueRequetView.as_view() , name='duerequest_view')
)


urlpatterns += patterns(
    'forms.ajax_views',
    url(r'^api/contact-form', 'view_contact_form'),
    url(r'^api/proposal-form', 'view_proposal_form'),
)

urlpatterns += patterns(
    '',
    url(r'^front-edit/', include('front.urls')),
)

urlpatterns += patterns(
    '',
    url(r'^admin/filebrowser/', include('filebrowser.urls')),
    url(r'^admin/', include(admin.site.urls)),
)

if settings.DEBUG:
    urlpatterns += patterns(
        '',
        url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
    )

urlpatterns += patterns(
    'news.views',
    url(r'^news/(?P<p_slug>.*)/tag=(?P<t_slug>.*)/article=(?P<a_slug>.*)$', 'view_tag_article'),
    url(r'^news/(?P<p_slug>.*)/tag=(?P<t_slug>.*)$', 'view_tag'),
    url(r'^news/(?P<p_slug>.*)/article=(?P<a_slug>.*)$', 'view_article'),
    url(r'^news/(?P<p_slug>.*)$', 'view_article_list'),
)


urlpatterns += patterns('',
    url(r'^document/create/(?P<com_pk>\d+)/$', DocumentCreateView.as_view() , name='document_create_view'),
    url(r'^document/delete/(?P<pk>\d+)/$', DocumentDeleteView.as_view() , name='community_delete_view'),
    url(r'^document/update/(?P<pk>\d+)/(?P<com_pk>\d+)/$', DocumentEditView.as_view() , name='community_edit_view'),
    url(r'^document/create_com/$', DocumentComCreateView.as_view() , name='community_com'),
    url(r'^webpage/getdetails/$', WebPageGetDetailAjax.as_view() , name='webpage_ajax_com'),
    url(r'^(?P<slug>[-\w]+)/$', CommunityView.as_view() , name='community_view'),
    url(r'^comsliders/create/(?P<com_pk>\d+)/$', ComSlidersCreateView.as_view() , name='comsliders_create_view'),
    url(r'^comsliders/delete/(?P<pk>\d+)/$', ComSlidersDeleteView.as_view() , name='comsliders_delete_view'),
    url(r'^comsliders/update/(?P<pk>\d+)/(?P<com_pk>\d+)/$', ComSlidersEditView.as_view() , name='comsliders_edit_view'),
    url(r'^doccategory/create/$', DocCategoryCreateView.as_view() , name='doccategory_create_view'),
    url(r'^doccategory/delete/(?P<pk>\d+)/$', DocCategoryDeleteView.as_view() , name='doccategory_delete_view'),
    url(r'^doccategory/update/(?P<pk>\d+)/(?P<com_pk>\d+)/$', DocCategoryEditView.as_view() , name='docategory_edit_view'),
    url(r'^webpage/getbadeg/$', GetBadgesAjax.as_view() , name='getbadges'),

)

urlpatterns += patterns(
    'page_content.views',
    url(r'^edit/(?P<a_slug>.*)$', 'edit_web_page'),
    url(r'^(?P<a_slug>.*)/staff-member/(?P<staff_slug>.*)$', 'view_staff_member'),
    url(r'^(?P<a_slug>.*)$', 'view_web_page'),
)
