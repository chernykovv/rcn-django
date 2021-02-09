from .base import *

logging.log(logging.INFO, 'loading settings for ' + __name__)

DEBUG = True
TEMPLATE_DEBUG = True
DEVELOPMENT = True


# Database
#DATABASES = {
#    'default': {
#        'ENGINE': 'django.db.backends.sqlite3',
#        'NAME': os.path.join(BASE_DIR, 'sqlite/local.db'),
#    }
#}

DATABASES = {
     'default': {
          'ENGINE': 'django.db.backends.postgresql_psycopg2',
          'NAME': 'rcn_latest',
          'USER': 'postgres',
          'PASSWORD': '1123',
          'HOST': '127.0.0.1',
          'PORT': '5432',
      }
}

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
    },
}

SESSION_COOKIE_AGE = 7200
SESSION_EXPIRE_AT_BROWSER_CLOSE = False
