#encoding:utf-8

import redis
from datetime import datetime
import re
from jinja2.filters import do_striptags
pool = redis.ConnectionPool(host='47.107.66.196', port=6379,password='donghao',encoding='utf-8',decode_responses=True)
cache = redis.Redis(connection_pool=pool)

def DropMessage(*args,**kwargs):
    recever = kwargs.get('reciver')
    type = kwargs.get('type')
    title = kwargs.get('title')
    post_id = kwargs.get('post_id')
    content = kwargs.get('content')
    sender = kwargs.get('sender')
    username = kwargs.get('username')
    create_time = kwargs.get('create_time')
    text = {'type':type,'title':title,'post_id':post_id,'content':content,'sender':sender,'username':username,'create_time':create_time}
    cache.lrem(recever,text,0)


#外部过滤器
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

def post_cover(text):
    ret = re.findall(r'<img.*?src="(.*?)"', text, re.S)
    if len(ret)==0:
        return ''
    elif ret[0] and ret[0].startswith('http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/'):
        return ''
    else:
        end = re.sub('&amp;', '&', ret[0])
        return end

from utils.translate import get_result

def JsonPosts(posts_obj,en):
    posts = []
    for post in posts_obj:
        time = handle_time(post.create_time)
        cover = post_cover(post.content)
        if len(post.content) > 200:
            content = do_striptags(post.content)[0:200] + '...'
        else:
            content = do_striptags(post.content)
        if len(post.hightlight) == 1:
            hight = 'ok'
        else:
            hight = ''
        if en =='en':
            time = get_result(time)
            posts.append({'title': get_result(post.title), 'content': get_result(content),
                          'username': get_result(post.author.nickname), 'create_time':
                time, 'cover': cover, 'id': post.id, 'avatar': post.author.avatar, 'hight_light': hight,
                          'user_id': post.author.id})
        else:
            posts.append({'title': post.title, 'content': content, 'username': post.author.nickname, 'create_time':
                time, 'cover': cover, 'id': post.id, 'avatar': post.author.avatar, 'hight_light': hight,
                          'user_id': post.author.id,'nickname':post.author.nickname,'email':post.author.email,'read_count':
                              post.read_count,'comment_count':len(post.comments)})
    return posts



