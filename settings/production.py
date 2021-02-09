from .base import *

logging.log(logging.INFO, 'loading settings for ' + __name__)

DEBUG = False
TEMPLATE_DEBUG = False

MANAGERS = ('ryan@realclearneighborhoods.com',)

EMAILTO = 'ryan@realclearneighborhoods.com'
EMAIL_HOST = 'mail.realclearneighborhoods.com'
EMAIL_HOST_USER = 'noreply@realclearneighborhoods.com'
EMAIL_HOST_PASSWORD = 'S$atur88e'
EMAIL_PORT = '25'
DEFAULT_FROM_EMAIL = "Real Clear Neighborhoods <noreply@realclearneighborhoods.com>"
SERVER_EMAIL = "ryan@realclearneighborhoods.com"
ONLINE_CONTACT_EMAIL = 'ryan@realclearneighborhoods.com'

# Database
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'corporate_2015',
        'USER': 'real_clear',
        'PASSWORD': 'realclearneighborhoods2015_databasepassword',
        #'HOST': '',
        #'PORT': '',
    }
}



CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.filebased.FileBasedCache',
        'LOCATION': '/var/tmp/webapp_cache',
        'TIMEOUT': 60,  # 60 seconds
    },
}

