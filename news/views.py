import logging
from django.http import Http404
from django.shortcuts import render_to_response
from django.template import RequestContext
from news.models import Tag, Article
from page_content.models import WebPage
from utility import set_detail_context


def view_article_list(request, p_slug):
    all_articles = True
    page = get_page(p_slug)

    try:
        articles = Article.get_published_objects()

    except Exception, e:
        logging.error(e)
        raise Http404

    current_tag = 'all'

    template = 'news/list_view.html'

    context = {'all_articles': all_articles, 'page': page, 'articles': articles, 'current_tag': current_tag}
    set_detail_context(request, context)

    return render_to_response(template, context, context_instance=RequestContext(request))


def view_article(request, p_slug, a_slug):
    page = get_page(p_slug)

    try:
        article = Article.objects.get(slug=a_slug, is_published=True)

    except Exception, e:
        logging.error(e)
        raise Http404

    try:
        next_article = article.get_next_by_publish_date(is_published=True)
        next_url = next_article.slug

    except Exception, e:
        print e
        next_url = None

    try:
        prev_article = article.get_previous_by_publish_date(is_published=True)
        prev_url = prev_article.slug

    except:
        prev_url = None

    template = 'news/detail_view.html'

    context = {'page': page, 'article': article, 'next_url': next_url, 'prev_url': prev_url}
    set_detail_context(request, context)

    return render_to_response(template, context, context_instance=RequestContext(request))


def view_tag(request, p_slug, t_slug):
    page = get_page(p_slug)
    current_tag, articles = get_tag_and_articles(t_slug)

    template = 'news/list_view.html'

    context = {'page': page, 'current_tag': current_tag, 'articles': articles}
    set_detail_context(request, context)

    return render_to_response(template, context, context_instance=RequestContext(request))


def view_tag_article(request, p_slug, t_slug, a_slug):
    page = get_page(p_slug)
    current_tag, articles = get_tag_and_articles(t_slug)

    try:
        article = Article.objects.get(slug=a_slug, is_published=True)

    except Exception, e:
        logging.error(e)
        raise Http404

    try:
        next_article = article.get_next_by_publish_date(is_published=True, tags=current_tag)
        next_url = next_article.slug

    except Exception, e:
        print e
        next_url = None

    try:
        prev_article = article.get_previous_by_publish_date(is_published=True, tags=current_tag)
        prev_url = prev_article.slug

    except:
        prev_url = None

    template = 'news/detail_view.html'

    context = {'page': page, 'current_tag': current_tag, 'articles': articles, 'article': article, 'next_url': next_url, 'prev_url': prev_url}
    set_detail_context(request, context)

    return render_to_response(template, context, context_instance=RequestContext(request))


def get_page(p_slug):
    try:
        page = WebPage.objects.get(slug=p_slug, is_published=True)

    except:
        raise Http404

    return page


def get_tag_and_articles(t_slug):
    try:
        current_tag = Tag.objects.get(slug=t_slug, is_published=True)
        articles = current_tag.articles

    except Exception, e:
        logging.error(e)
        raise Http404

    return current_tag, articles