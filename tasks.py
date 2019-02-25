#encoding:utf-8
# __author__ = 'donghao'
# __time__ = 2019/2/25 18:27

from celery import Celery
from flask import Flask
from flask_mail import Message
import config

from exct import mail
app = Flask(__name__)
app.config.from_object(config)
mail.init_app(app)

def make_celery(app):
    celery = Celery(app.import_name, broker=app.config['CELERY_BROKER_URL'])
    celery.conf.update(app.config)
    TaskBase = celery.Task
    class ContextTask(TaskBase):
        abstract = True
        def __call__(self, *args, **kwargs):
            with app.app_context():
                return TaskBase.__call__(self, *args, **kwargs)
    celery.Task = ContextTask
    return celery

celery = make_celery(app)

@celery.task
def send_mail(subject,recipients,body):
    message = Message(subject=subject,recipients=recipients,body=body)
    mail.send(message)
