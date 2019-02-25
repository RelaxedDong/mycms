#encoding:utf-8



DB_USERNAME = 'root'
DB_PASSWORD = 'root'
DB_HOST = '127.0.0.1'
DB_PORT = '3306'
DB_NAME = 'mycms'


# PERMANENT_SESSION_LIFETIME =

DB_URI = 'mysql+pymysql://%s:%s@%s:%s/%s?charset=utf8' % (DB_USERNAME,DB_PASSWORD,DB_HOST,DB_PORT,DB_NAME)

CMS_USER_ID = '1231'
FRONT_USER_ID = 'xxxxasfasfacxhgf'



# 邮箱
MAIL_SERVER = "smtp.qq.com"
MAIL_PORT = "587"
MAIL_USE_TLS = True
MAIL_USERNAME = "pepper.hot@qq.com"
MAIL_PASSWORD = "your_password"
MAIL_DEFAULT_SENDER = "pepper.hot@qq.com"


SECRET_KEY = '123'

SQLALCHEMY_DATABASE_URI = DB_URI
SQLALCHEMY_TRACK_MODIFICATIONS = False


START = 0
PERPAGE = 10

Album_PERPAGE = 10


CELERY_BROKER_URL = 'redis://127.0.0.1:6379/0'
