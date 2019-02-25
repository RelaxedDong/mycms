#encoding:utf-8
from flask import Blueprint,jsonify,request,make_response
import os,re
from werkzeug.utils import secure_filename
from apps.front.decorators import login_required
from utils.upload import change_filename,bucket_post,base_posts_url
import uuid
from exct import mail
from flask_mail import Message
from utils import restful,mychache
from utils.captcha import Captcha
from datetime import datetime
import string
from apps.front.tools import cache
import random
from io import BytesIO
bp = Blueprint('common',__name__,url_prefix='/c')


@bp.app_template_filter('handle_time')
def handle_time(time):
    if isinstance(time,datetime):
        now = datetime.now()
        timestamp = (now-time).total_seconds()
        #一分钟以内
        if timestamp<60:
            return '刚刚'
        #大于一分钟小于一小时
        elif timestamp>=60 and timestamp<60*60:
            minutes = timestamp/60
            return '%s分钟前' %int(minutes)
        #大于一小时小于24小时
        elif timestamp>=60*60 and timestamp<60*60*24:
            hour = timestamp/60/60
            return '%s小时前' %int(hour)
        #大于24小时小于一个月
        elif timestamp>=60*60*24 and timestamp <60*60*24*30:
            day = timestamp/60/60/24
            return '%s天前'%int(day)
        else:
            return time.strftime('%Y/%m/%d %H:%M')
    else:
        return time

@bp.app_template_filter('post_cover')
def post_cover(text):
    ret = re.findall(r'<img.*?src="(.*?)"', text, re.S)[0]
    if ret and ret.startswith('http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/'):
        return ''
    else:
        return ret

@bp.route('/')
def index():
    return '我是共有的'

@bp.route('/upload/',methods=['POST'])
def upload():
    file= request.files['file']
    file_name = secure_filename(change_filename(file.filename))
    bucket_post.put_object('posts/'+file_name,file)
    url = base_posts_url+file_name
    return restful.success(data=url)

from tasks import send_mail

@bp.route('/send_captcha/')
def send_email():
    email = request.args.get('email')
    ret = re.match(r'^.+@([^.@][^@]+)$', email)
    print(ret)
    if ret:
        E = list(string.ascii_letters)
        E.extend(map(lambda x: str(x), range(0, 10)))
        cap = ''.join(random.sample(E,4))
        try:
            send_mail.delay('Dohoom验证码', recipients=[email], body='您的验证码是：%s,打死不要告诉别人哦~' % cap)
        except:
            return restful.server_error()
        cache.set(email, cap, ex=240)

        return restful.success()
    else:
        return restful.params_error('邮箱不存在！')



@bp.route('/captcha/')
def graph_captcha():
    text,image = Captcha.gene_graph_captcha()
    cache.set(text.lower(),text.lower(),ex=30)

    out = BytesIO()
    image.save(out,'png')
    out.seek(0)
    resp = make_response(out.read())
    resp.content_type = 'image/png'
    return resp

