#encoding:utf-8

from flask import Blueprint,render_template,redirect,request,session,g,url_for,Flask
from .models import FrontUserModel
from exct import db
from apps.album.models import AlbumModel
from werkzeug.utils import secure_filename
from utils.upload import bucket,change_filename,base_avater_url
from .decorators import login_required
from .forms import LoginForm,ApostForm,Setting_profile_Form,PostIdForm,CommentForm,\
    FocusForm,ForgetpwdForm,SignUpForm,AcommentForm,ResetPwdForm,SendMsgModel,MyErrorForm,BindWeiboForm
from apps.common.models import PostsModel,CollectModel,StarModel,CommentModel,FocusModel,HighlightModel,BannerModel,TagsModel,post_tag,AdvertisementModel,ErrorModel
from datetime import datetime
from utils import restful,safeurls,upload,weibo
import config
import re
import operator
from sqlalchemy import or_
import random
from jinja2.filters import do_striptags,do_truncate
from sqlalchemy.sql import func
from flask_paginate import Pagination,get_page_parameter
import time
from utils import mychache
from .tools import cache,DropMessage,JsonPosts,post_cover,handle_time
bp = Blueprint('front',__name__)

def get_paginat(page):
    count = PostsModel.query.count()
    pagination = Pagination(bs_version=3, total=count, page=page)
    return pagination

def get_error(form):
    message = form.errors.popitem()[1][0]
    return message


@bp.route('/get_post_detail/<post_id>/')
def get_post_detail(post_id):
    post_pbj = PostsModel.query.get(post_id)
    post = {}
    post['title'] = post_pbj.title
    post['nickname'] = post_pbj.author.nickname
    post['time'] = post_pbj.create_time
    post['content'] = post_pbj.content
    post['avatar'] = post_pbj.author.avatar
    return restful.success(data=post)



@bp.app_template_filter('filter_posts')
def filter_posts(user_id):
    posts = PostsModel.query.filter_by(author_id = user_id).order_by(PostsModel.read_count.desc())[0:4]
    return posts

@bp.app_template_filter('fl_address')
def fl_address(address):
    if address:
        if address == '秘密':
            return address
        newp = ''
        sp = address.split('-')
        if len(sp)==1:
            return sp[0]
        if sp[0] == '重庆' or sp[0] == '天津' or sp[0] == '北京' or sp[0] == '上海':
            newp = sp[0] + '   ' + sp[2]
        elif sp[0] == '澳门' or sp[0] == '香港' or sp[0] == '台湾':
            newp = sp[0]
        else:
            newp = sp[0] + '   ' + sp[1]
        return newp
    else:
        return '未填写地址'



def len_charactors(count):
    count = str(count / 1000.0).split('.')
    qian = count[0]
    dian = count[1]
    end = qian + '.' + dian[0] + 'k'
    return end


@bp.app_template_filter('avatar_img')
def subImg(text):
    text = str(text)
    ret = re.findall(r'<img.*?src="(.*?)"', text, re.S)
    if len(ret)==0:
        return ''
    elif ret[0] and ret[0].startswith('http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/'):
        return ''
    else:
        end = re.sub('&amp;', '&', ret[0])
        return end


@bp.route('/change_color/',methods=['POST'])
@login_required
def change_color():
    color = request.form.get('color')
    user = g.front_user
    if color and user:
        user.color = color
        db.session.commit()
        return restful.success()
    else:
        return restful.server_error()
@bp.route('/wx_get_posts/')
def wx_get_posts():
    posts_obj = PostsModel.query.order_by(PostsModel.create_time.desc()).all()
    posts = JsonPosts(posts_obj)
    return restful.success(data=posts)


@bp.route('/',methods=['GET','POST'])
def index():
    if request.method == 'GET':
        ads = AdvertisementModel.query.all()
        banners = BannerModel.query.order_by(BannerModel.weight.desc()).all()
        users = FrontUserModel.query.order_by(FrontUserModel.charactors.desc()).all()
        user = g.front_user
        if user and user.is_active==0:
            return redirect(url_for('front.login'))

        return render_template('front/index.html',banners=banners,users=users,ads=ads)
    else:
        index = int(request.form.get('count'))
        language = request.form.get('language')
        posts_obj = PostsModel.query.order_by(PostsModel.create_time.desc()).slice(index, index + 10)
        en = ''
        if language == '英文':
            en = 'en'
        else:
            en = 'ch'
        posts = JsonPosts(posts_obj,en)
        return restful.success(data=posts)


from utils.translate import get_result
@bp.route('/tags/<tagname>',methods=['GET','POST'])
def tags(tagname):
    if request.method == 'GET':
        tag = TagsModel.query.filter_by(tagname=tagname).first()
        posts = tag.posts
        text= {
            'posts':posts,
            'tagname':tagname,
        }
        return render_template('front/tags_detail.html',**text)
    else:
        tags_model = TagsModel.query.all()
        tags = []
        list2=[]
        for tag in tags_model:
            tags.append({'tag_name':tag.tagname})
        for tag in tags:
            if tag not in list2:
                list2.append(tag)
        return restful.success(data=list2)

@bp.route('/authors/',methods=['GET','POST'])
def authors():
    if request.method == 'GET':
        users = FrontUserModel.query.order_by(FrontUserModel.points.desc()).all()
        is_focus_id = None
        if g.front_user:
            my_focus = FocusModel.query.filter_by(author_id = g.front_user.id).all()
            is_focus_id = [focus_users.own_user_id for focus_users in my_focus]
        return render_template('front/all_authors.html',users=users,is_focus_id=is_focus_id)
    else:
        users = []
        users_obj =  FrontUserModel.query.order_by(func.rand()).limit(5)
        for user in users_obj:
            users_focus= FocusModel.query.filter_by(own_user_id=user.id).all()
            is_focus_id = [focus_users.author_id for focus_users in users_focus]

            users.append({'user_id':user.id,'nickname':user.nickname,'charactors':len_charactors(user.charactors)
                          ,'avatar':user.avatar,'is_focus_id':is_focus_id})
        random.shuffle(users)
        return restful.success(data=users)



@bp.route('/signup/',methods=['GET','POST'])
def signup():
    if request.method == 'GET':
        return render_template('front/signup.html')
    else:
        form = SignUpForm(request.form)
        if form.validate():
            password = form.password1.data
            email = form.email.data
            user = FrontUserModel.query.filter_by(email=email).first()
            if user:
                return restful.params_error('对不起，此账号已经注册！')
            else:
                user_obj = FrontUserModel(email=email,password=password)
                db.session.add(user_obj)
                db.session.commit()
            return restful.success()
        else:
            return restful.params_error(message=get_error(form))


@bp.route('/search/',methods=['GET','POST'])
def search():
    if request.method == 'GET':
        page = request.args.get(get_page_parameter(), type=int, default=1)
        start = (page - 1) * config.PERPAGE
        end = start + config.PERPAGE
        pagination = get_paginat(page)
        posts = PostsModel.query.order_by(PostsModel.read_count.desc()).slice(start,end)
        return render_template('front/search.html',posts=posts,pagination=pagination)
    else:
        input_name = request.form.get('title')
        posts_obj = PostsModel.query.filter(or_(PostsModel.title.contains(input_name),PostsModel.content.contains(input_name))).order_by(PostsModel.read_count.desc()).all()
        posts = JsonPosts(posts_obj,'ch')
        return restful.success(data=posts)


@bp.route('/login/',methods=['GET','POST'])
def login():
    if request.method == 'GET':
        return_to = request.referrer
        if return_to and return_to!=request.url and safeurls.is_safe_url(return_to):
            return render_template('front/login.html',return_to=return_to)
        else:
            return render_template('front/login.html')
    else:
        form = LoginForm(request.form)
        if form.validate():
            email = form.email.data
            password = form.password.data
            user = FrontUserModel.query.filter_by(email=email).first()
            if not user:
                return restful.params_error(message='用户不存在')
            if user.is_active == 0:
                return restful.params_error('账户违规冻结，请联系管理员！')
            if user and user.check_pwd(password):
                session[config.FRONT_USER_ID] = user.id
                return restful.success()
            else:
                return restful.params_error('密码错误')
        else:
            return restful.params_error(message=get_error(form))

@bp.route('/logout/')
def logout():
    if g.front_user:
        del session[config.FRONT_USER_ID]
        access_token = session.get('access_token')
        uid = session.get('uid')
        if access_token and uid:
            del session['access_token']
            del session['uid']
        return redirect(url_for('front.login'))
    else:
        return redirect(url_for('front.index'))



@bp.route('/information/')
@login_required
def information():
    messages = []
    if g.front_user != '':
        messages = cache.lrange(g.front_user.id, 0, -1)
        messages = [eval(msg) for msg in messages]
    return render_template('front/informations.html',messages=messages)


@bp.route('/drop_msg/',methods=['POST'])
@login_required
def drop_msg():
    type = request.form.get('type')
    sender = request.form.get('sender')
    create_time = request.form.get('create_time')
    title = request.form.get('title')
    nickname = request.form.get('username')
    content = request.form.get('content')
    post_id = request.form.get('post_id')
    DropMessage(reciver = g.front_user.id,type=type,title=title,post_id=post_id,content=content,sender=sender,username=nickname,create_time=create_time)
    return restful.success()


@bp.route('/post_detail/<post_id>/')
def post_detail(post_id):
    language = request.args.get('lang')
    post = PostsModel.query.get(post_id)
    post.read_count +=1
    db.session.commit()
    comment = CommentModel.query.filter_by(post_id=post_id).order_by(CommentModel.create_time.desc()).all()
    users = FocusModel.query.filter_by(own_user_id=post.author.id).all()
    is_focus_id = [focus_users.author_id for focus_users in users]
    if language == 'en':
        title = get_result(post.title)
        content = get_result(do_striptags(post.content))
    else:
        title = post.title
        content=post.content
    hot_posts = PostsModel.query.filter_by(author_id=post.author.id).order_by(PostsModel.read_count.desc()).all()
    ads = AdvertisementModel.query.all()
    text = {
        'title':title,
        'content':content,
        'post':post,
        'comments':comment,
        'is_focus_id':is_focus_id,
        'hot_posts':hot_posts,
        'ads':ads,
    }
    return render_template('front/post_detail.html',**text)


import json
from werkzeug.datastructures import MultiDict
@bp.route('/apost/',methods=['GET','POST'])
@login_required
def apost():
    if request.method == 'GET':
        return render_template('front/apost.html')
    else:
        tags = request.form.get('tags')
        form = ApostForm(request.form)
        if form.validate():
            title = form.title.data
            content = form.content.data
            tags = tags.split(',')
            all_tags = TagsModel.query.all()
            all_tagnames = [tag.tagname for tag in all_tags]
            post = PostsModel(title=title,content=content)
            post.author = g.front_user
            for tag in tags:
                if tag in all_tagnames:
                    ta = TagsModel.query.filter_by(tagname=tag).first()
                else:
                    ta = TagsModel(tagname=tag)
                post.tags.append(ta)

            charactors_len = len(do_striptags(content))
            post.author.points+=2
            post.author.charactors += charactors_len
            db.session.add(post)
            db.session.commit()
            return restful.success()
        else:
            return restful.params_error(message=get_error(form))

@bp.route('/dpost/',methods=['POST'])
@login_required
def dpost():
    post_id = request.form.get('post_id')
    post = PostsModel.query.get(post_id)
    if post:
        [db.session.delete(c) for c in CommentModel.query.filter_by(post_id = post_id).all()]
        [db.session.delete(c) for c in CollectModel.query.filter_by(post_id = post_id).all()]
        imgs = re.findall(r'<img src="https://donghaocms.oss-cn-beijing.aliyuncs.com/(.*?)"', post.content, re.S)
        if len(imgs) > 0:
            [bucket.delete_object(img) for img in imgs]
        db.session.delete(post)
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message='帖子不存在')




@bp.route('/change_avater/',methods=['POST'])
@login_required
def change_avater():
    file = request.files['file']
    user = g.front_user
    file_name = secure_filename(change_filename(file.filename[:2]))
    bucket.put_object('avater/' + file_name+'.jpg', file)
    user.avatar = base_avater_url + file_name+'.jpg'
    db.session.commit()
    return restful.success()


@bp.route('/setting_base/',methods=['GET','POST'])
@login_required
def setting_base():
    if request.method == 'GET':
        return render_template('front/setting_base.html')
    else:
        nickname = request.form.get('nickname')
        province = request.form.get('province')
        area = request.form.get('area')
        city = request.form.get('city')
        address = province+'-'+city+'-'+area
        g.front_user.nickname = nickname
        g.front_user.address = address
        db.session.commit()
        return restful.success()

@bp.route('/setting_profile/',methods=['GET','POST'])
@login_required
def setting_profile():
    if request.method == 'GET':
        return render_template('front/setting_profile.html')
    else:
        form = Setting_profile_Form(request.form)
        if form.validate():
            qq = form.qq.data
            gender = form.gender.data
            desc = form.desc.data
            my_web = form.my_web.data
            real_name = form.real_name.data
            user = g.front_user
            user.qq = qq
            user.gender = gender
            user.my_web = my_web
            user.signature = desc
            user.realname = real_name
            db.session.commit()
            return restful.success(data=gender)
        else:
            return restful.params_error(message=get_error(form))

@bp.route('/setting_count/',methods=["POST",'GET'])
@login_required
def setting_count():
    if request.method == 'GET':
        return render_template('front/setting_count.html')
    else:
        form = ResetPwdForm(request.form)
        if form.validate():
            captcha = form.captcha.data
            oldpwd = form.oldpwd.data
            newpwd = form.newpwd.data
            user = g.front_user
            if user and user.check_pwd(oldpwd):
                if oldpwd==newpwd:
                    return restful.params_error('新旧密码不能一致~')
                user.password = newpwd
                db.session.commit()
                mychache.delete(captcha)
                return restful.success()
            else:
                return restful.params_error('旧密码错误')
        else:
            return restful.params_error(message=get_error(form))




@bp.route('/u/<user_id>')
@login_required
def u(user_id):
    user = FrontUserModel.query.get(user_id)
    users = None
    access_token = session.get('access_token')
    uid = session.get('uid')
    url = None
    if access_token and uid and user.weibo_id and user.weibo_id == uid:
        data = {'uid': uid, 'access_token': access_token}
        resp = requests.get(weibo.friendships_url, data)
        info = json.loads(resp.text)
        users = info['users']
        url = 'https://weibo.com/' + str(uid) + '/follow?from=page_100505&wvr=6&mod=headfollow#place'
    
    albums = AlbumModel.query.filter_by(author_id=user_id).all()
    focus = FocusModel.query.filter_by(own_user_id=user_id).all()
    count = 0
    wodefensi = [user.author.id for user in focus]
    guanzu_ids = [user.own_user_id for user in user.focuses]
    peoples = []
    for id in guanzu_ids:
        user1 = FrontUserModel.query.get(id)
        peoples.append(user1)
    my_posts = PostsModel.query.filter_by(author_id=user_id).all()
    my_collects = CollectModel.query.filter_by(author_id=user.id).order_by(CollectModel.collect_time.desc()).all()
    for post in my_posts:
        if(len(post.stars)>0):
            count +=len(post.stars)
    posts = PostsModel.query.filter_by(author_id=user_id).order_by(PostsModel.create_time.desc()).all()
    post_comments = db.session.query(PostsModel).filter(PostsModel.author_id==user_id).outerjoin(CommentModel). \
        group_by(PostsModel.id).order_by(PostsModel.create_time.desc()).all()
    my_co_posts = []
    for post in post_comments:
        if post.comments:
            if (len(post.comments)>1):
                mytime = []
                for pc in post.comments:
                    mytime.append(pc.create_time)
                time = max(mytime)
                my_co_posts.append({'title': post.title,'create_time':time,'content':post.content,'poster':post_cover(post.content),
                                    'read_count':post.read_count,'post_id':post.id})
            else:
                my_co_posts.append({'title': post.title, 'create_time': post.comments[0].create_time,'content':post.content,'poster':post_cover(post.content),
                                    'read_count':post.read_count,'post_id':post.id})
    my_co_posts = sorted(my_co_posts,key=operator.itemgetter('create_time'),reverse=True)
    context = {
        'my_collects':my_collects,
        'user':user,
        'posts':posts,
	'url':url,
        'focus':focus,
        'count':count,
        'comments':my_co_posts,
        'peoples':peoples,
        'myfrnsi_ids':wodefensi,
        'albums':albums,
	'users':users
    }
    return render_template('front/u.html',**context)


@bp.route('/post_star/',methods=['POST'])
@login_required
def post_star():
    form = PostIdForm(request.form)
    if form.validate():
        post_id = request.form.get('post_id')
        post = PostsModel.query.get(post_id)
        star_model = StarModel.query.filter_by(post_id=post_id,author_id=g.front_user.id).first()
        if star_model:
            db.session.delete(star_model)
            db.session.commit()
            return restful.success(data='cancel')
        else:
            if post.author.id!=g.front_user.id:
                cache.lpush('%s'%post.author.id,
                            {'type': '用户消息', 'title': '赞了你的帖子','post_id':post.id,'content':post.title, 'sender':g.front_user.id, 'username':g.front_user.nickname,
                             'create_time': time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())})
            star = StarModel(post_id=post_id,author_id=g.front_user.id)
            db.session.add(star)
            db.session.commit()
            return restful.success(data='ok')
    else:
        return restful.params_error(message=get_error(form))


@bp.route('/post_collect/',methods=['POST'])
@login_required
def post_collect():
    form = PostIdForm(request.form)

    if form.validate():
        post_id = request.form.get('post_id')
        post = PostsModel.query.get(post_id)
        collect_model = CollectModel.query.filter_by(post_id=post_id,author_id=g.front_user.id).first()
        if collect_model:
            db.session.delete(collect_model)
            db.session.commit()
            return restful.success(data='delete')
        else:
            if post.author.id!=g.front_user.id:
                cache.lpush('%s'%post.author.id,
                            {'type': '用户消息', 'title': '收藏了你的帖子','post_id':post.id,'content':post.title, 'sender':g.front_user.id, 'username':g.front_user.nickname,
                             'create_time': time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())})
            collect = CollectModel(post_id=post_id,author_id=g.front_user.id)
            db.session.add(collect)
            db.session.commit()
            return restful.success(data='ok')
    else:
        return restful.params_error(message=get_error(form))

@bp.route('/comment/',methods=['POST'])
@login_required
def comment():
    form = CommentForm(request.form)
    if form.validate():
        content = form.content.data
        post_id = form.post_id.data
        post = PostsModel.query.get(post_id)

        if post.author.id != g.front_user.id:
            cache.lpush('%s' % post.author.id,
                        {'type': '用户消息', 'title': '评论了你的帖子','post_id':post.id,'content': post.title, 'sender': g.front_user.id,
                         'username': g.front_user.nickname,
                         'create_time': time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())})

        comment = CommentModel(content=content)
        comment.post_id = post_id
        comment.author = g.front_user
        comment.author.points+=1
        db.session.add(comment)
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message=get_error(form))

@bp.route('/acomment/',methods=['POST'])
@login_required
def acomment():
    form = AcommentForm(request.form)
    if form.validate():
        post_id = form.post_id.data
        comment_id = form.comment_id.data
        content = form.content.data
        post = PostsModel.query.get(post_id)

        if post.author.id != g.front_user.id:
            cache.lpush('%s' % post.author.id,
                        {'type': '用户消息', 'title': '给你评论了消息~', 'post_id': post.id,'content': post.title,
                         'sender': g.front_user.id,
                         'username': g.front_user.nickname,
                         'create_time': time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())})

        comment = CommentModel(content=content,origin_comment_id=comment_id)
        comment.post_id = post_id
        comment.author = g.front_user
        comment.author.points += 1
        db.session.add(comment)
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message=get_error(form))


@bp.route('/delcomment/',methods=['POST'])
@login_required
def delcomment():
    comment_id = request.form.get('comment_id')
    if comment_id:
        comment = CommentModel.query.get(comment_id)
        if comment.author == g.front_user:
            comment = CommentModel.query.get(comment_id)
            db.session.delete(comment)
            db.session.commit()
            return restful.success()
        else:
            return restful.server_error()
    else:
        return restful.server_error()



@bp.route('/focus/',methods=['POST'])
@login_required
def focus():
    form = FocusForm(request.form)
    if form.validate():
        own_user_id = form.own_user_id.data
        user = g.front_user
        # 关注自己
        if own_user_id == user.id:
            return restful.params_error(message='不能关注自己')
        # 判断是否已经关注
        is_model = FocusModel.query.filter_by(own_user_id=own_user_id,author_id=user.id).first()
        if is_model:
            db.session.delete(is_model)
            db.session.commit()
            return restful.success(message='取消关注成功~')
        if own_user_id != g.front_user.id:
            cache.lpush('%s' % own_user_id,
                        {'type': '用户消息', 'title': '关注了你','post_id':'','content':"", 'sender': g.front_user.id,
                         'username': g.front_user.nickname,
                         'create_time': time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())})

        focus = FocusModel(own_user_id=own_user_id,author_id=user.id)
        db.session.add(focus)
        db.session.commit()
        return restful.success(message='关注成功~')
    else:
        return restful.params_error(message=get_error(form))



@bp.route('/most_star/')
def most_star():
    page = request.args.get(get_page_parameter(),type=int,default=1)
    start = (page - 1) * config.PERPAGE
    end = start + config.PERPAGE
    pagination = get_paginat(page)
    posts = db.session.query(PostsModel).outerjoin(StarModel).\
        group_by(PostsModel.id).order_by(func.count(StarModel.id).desc(),PostsModel.create_time.desc()).slice(start,end)
    context = {
        'posts':posts,
        'pagination':pagination
    }
    return render_template('front/most_star.html',**context)

@bp.route('/hot/')
def hot():
    hilights = HighlightModel.query.all()
    return render_template('front/hot.html',hilights=hilights)

@bp.route('/most_see/')
def most_see():
    posts = PostsModel.query.order_by(PostsModel.read_count.desc())
    return render_template('front/most_see.html',posts=posts)

@bp.route('/most_comment/')
def most_comment():
    page = request.args.get(get_page_parameter(),type=int,default=1)
    start = (page - 1) * config.PERPAGE
    end = start + config.PERPAGE
    pagination = get_paginat(page)

    posts = db.session.query(PostsModel).outerjoin(CommentModel).\
        group_by(PostsModel.id).order_by(func.count(CommentModel.id).desc(),PostsModel.create_time.desc()).slice(start,end)

    context = {
        'posts':posts,
        'pagination':pagination
    }
    return render_template('front/most_comment.html',**context)

@bp.route('/most_collect/')
def most_collect():
    posts = db.session.query(PostsModel).outerjoin(CollectModel).\
        group_by(PostsModel.id).order_by(func.count(CollectModel.id).desc(),PostsModel.create_time.desc()).all()
    return render_template('front/most_collect.html',posts=posts)

#关注
@bp.route('/my_focus/<user_id>')
def my_focus(user_id):
    fensi = FocusModel.query.filter_by(own_user_id=user_id).all()
    user = FrontUserModel.query.get(user_id)
    guanzu_ids = [user.own_user_id for user in user.focuses]
    wodefensi = [user.author.id for user in fensi]
    peoples = []
    for id in guanzu_ids:
        user1 = FrontUserModel.query.get(id)
        peoples.append(user1)
    return render_template('front/my_focus.html',user=user,fensi=fensi,peoples=peoples,wodefensi=wodefensi)


def getMsg(messages,type):
    recivers = []
    ends = []
    messages = [eval(msg) for msg in messages]
    messages = sorted(messages, key=operator.itemgetter('create_time'),reverse=True)
    if type == 'sender_id':
        for msg in messages:
            if(msg['sender_id'] not in recivers):
                recivers.append(msg['sender_id'])
                ends.append(msg)
    else:
        for msg in messages:
            if(msg['reciver_id'] not in recivers):
                recivers.append(msg['reciver_id'])
                ends.append(msg)
    return ends

@bp.route('/chat/<user_id>')
@login_required
def chat(user_id):
    wode_messages = cache.lrange(g.front_user.id + '_chat', 0, -1)
    new_msgs = cache.lrange(g.front_user.id+'new_msg',0,-1)
    mmm = getMsg(new_msgs,type='sender_id')
    messages = []
    for str in wode_messages:
        spli = str.split(':', 1)
        msgse = spli[1]
        messages.append(msgse)
    ends = getMsg(messages,type='reciver_id')
    return render_template('front/chat.html',messages=ends,newmsgs = mmm)

from sqlalchemy import or_,and_

@bp.route('/chat_box/<user_id>')
@login_required
def chat_box(user_id):
    user_reciver = FrontUserModel.query.get(user_id)
    wode_messages = cache.lrange(g.front_user.id + '_chat', 0, -1)
    messages = []
    recivers = []
    ends = []
    for str in wode_messages:
        spli = str.split(':', 1)
        msgse = spli[1]
        messages.append(msgse)
    messages = [eval(msg) for msg in messages]
    messages = sorted(messages, key=operator.itemgetter('create_time'))

    for msg in messages:
        if(msg['reciver_id'] not in recivers):
            recivers.append(msg['reciver_id'])
            ends.append(msg)
    return render_template('front/chat_box.html',user=user_reciver,messages=ends)


@bp.route('/chat_send/',methods=['POST'])
@login_required
def chat_send():
    form = SendMsgModel(request.form)
    if form.validate():
        reciver_id = form.reciver_id.data
        content = form.content.data
        msg = str({'msg':content,'create_time':str(datetime.now()),'reciver_id':reciver_id})
        cache.lpush(g.front_user.id+'_chat',reciver_id+':'+msg)
        cache.lpush(reciver_id+'new_msg',str({'msg':content,'create_time':str(datetime.now()),'sender_id':g.front_user.id}))
        return restful.success()
    else:
        return restful.params_error(message=get_error(form))


import operator
@bp.route('/messagelist/')
@login_required
def messagelist():
    reciver_id = request.args.get('reciver_id')
    if reciver_id:
        wode_messages = cache.lrange(g.front_user.id+'_chat',0,-1)
        reciver_messages = cache.lrange(reciver_id+'_chat',0,-1)
        messages = []
        for str in wode_messages:
            if(str.startswith(reciver_id)):
                msgse = str.split(':', 1)[1]
                messages.append(msgse)
        for str in reciver_messages:
            if (str.startswith(g.front_user.id)):
                msgse = str.split(':', 1)[1]
                messages.append(msgse)
        messages = [eval(msg) for msg in messages]
        messages = sorted(messages, key=operator.itemgetter('create_time'))
        return restful.success(data=messages)
    else:
        return restful.server_error()


@bp.app_template_filter('user_name')
def get_username(user_id):
    user = FrontUserModel.query.get(user_id)
    return user


@bp.app_template_filter('first_msg')
@login_required
def get_username(user_id):
    wode_messages = cache.lrange(g.front_user.id + '_chat', 0, -1)
    reciver_messages = cache.lrange(user_id + '_chat', 0, -1)
    messages = []
    for str in wode_messages:
        if (str.startswith(user_id)):
            msgse = str.split(':', 1)[1]
            messages.append(msgse)
    for str in reciver_messages:
        if (str.startswith(g.front_user.id)):
            msgse = str.split(':', 1)[1]
            messages.append(msgse)
    messages = [eval(msg) for msg in messages]
    messages = sorted(messages, key=operator.itemgetter('create_time'),reverse=True)
    if len(messages)>0:
        return messages[0]['msg']
    else:
        return ''


@bp.route('/drop_all_new/',methods=['POST'])
@login_required
def drop_all_new():
    user = g.front_user
    #
    # cache.ltrim(user.id+'new_msg',1,0)
    news = cache.lrange(user.id+'new_msg',0,-1)
    for ne in news:
        print(ne)
    return restful.success()


@bp.route('/clear_msg/',methods=['POST'])
@login_required
def clear_msg():
    reciver_id = request.form.get('reciver_id')
    if reciver_id:
        wode_messages = cache.lrange(g.front_user.id+'_chat',0,-1)
        tade_messages = cache.lrange(reciver_id+'_chat',0,-1)
        wo_news = cache.lrange(g.front_user.id+'new_msg',0,-1)
        ta_news = cache.lrange(reciver_id+'new_msg',0,-1)
        wo_news = [eval(msg) for msg in wo_news]
        ta_news = [eval(msg) for msg in ta_news]
        for ne in wo_news:
            if(ne['sender_id']==reciver_id):
                cache.lrem(g.front_user.id+'new_msg',num=0,value=ne)

        for ne in ta_news:
            if(ne['sender_id']==g.front_user.id):
                cache.lrem(reciver_id+'new_msg',num=0,value=ne)

        for index,msg in enumerate(wode_messages):
            if msg.startswith(reciver_id):
                cache.lrem(g.front_user.id+'_chat',num=0,value=msg)

        for index,msg in enumerate(tade_messages):
            if msg.startswith(g.front_user.id):
                cache.lrem(reciver_id+'_chat',num=0,value=msg)
        return restful.success()
    else:
        return restful.server_error()
#单条最新信息删除
@bp.route('/del_one_new/',methods=['POST'])
@login_required
def del_one_new():
    sender_id = request.form.get('sender_id')
    if sender_id:
        messages = cache.lrange(g.front_user.id+'new_msg',0,-1)
        messages = [eval(msg) for msg in messages]
        for msg in messages:
            if(msg['sender_id']==sender_id):
                cache.lrem(g.front_user.id+'new_msg',msg,0)
        return restful.success()
    else:
        return restful.server_error()






#判断是否回复
@bp.app_template_filter('are_reply')
@login_required
def are_reply(user_id):
    wode_messages = cache.lrange(g.front_user.id + '_chat', 0, -1)
    reciver_messages = cache.lrange(user_id + '_chat', 0, -1)
    messages = []
    for str in wode_messages:
        if (str.startswith(user_id)):
            msgse = str.split(':', 1)[1]
            messages.append(msgse)
    for str in reciver_messages:
        if (str.startswith(g.front_user.id)):
            msgse = str.split(':', 1)[1]
            messages.append(msgse)
    messages = [eval(msg) for msg in messages]
    messages = sorted(messages, key=operator.itemgetter('create_time'),reverse=True)
    if len(messages)>0:
        return messages[0]['reciver_id']
    else:
        return ''


#举报
@bp.route('/report/',methods=['POST'])
@login_required
def report():
    form = MyErrorForm(request.form)
    if form.validate:
        desc = form.desc.data
        user_id =form.user_id.data
        bereport_id = form.bereport_id.data
        url = form.url.data
        type = form.type.data
        error = ErrorModel(type=type,content=desc,reporter=user_id,bereporter=bereport_id,place=url)
        db.session.add(error)
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message=get_error(form))

# 忘记密码
@bp.route('/forgetpwd/',methods=['GET','POST'])
def forgetpwd():
    if request.method == 'GET':
        return render_template('front/forgetpwd.html')
    else:
        form = ForgetpwdForm(request.form)
        if form.validate():
            email = form.email.data
            password = form.newpwd.data
            user = FrontUserModel.query.filter(FrontUserModel.email==email).first()
            if user:
                user.password = password
                db.session.commit()
            else:
                return restful.params_error(message='用户不存在')
            cache.delete(email)
            return restful.success()
        else:
            return restful.params_error(message=get_error(form))

import requests
@bp.route('/bindemail/',methods=['GET','POST'])
def bindemail():
    if request.method == 'GET':
        ads = AdvertisementModel.query.all()
        code = request.args.get('code')
        if code:
            url = weibo.access_token_url + '?client_id={client_id}&client_secret={client_secret}&code={code}&redirect_uri' \
                                     '={redirect_uri}'.format(client_id=weibo.client_id, client_secret=weibo.client_secret,
                                                              redirect_uri=weibo.redirect_uri, code=code)
            page = requests.post(url)
            if page.status_code == 400:
                return render_template('front/index.html')
            data = page.text
            access_token = eval(data)['access_token']
            uid = eval(data)['uid']
            have_u = FrontUserModel.query.filter_by(weibo_id=uid).first()
            session['access_token']=access_token
            session['uid']=uid
            if have_u:
                session[config.FRONT_USER_ID] = have_u.id
                return redirect(url_for('front.index'))
            if access_token and uid:
                info_data = requests.get(weibo.info_url + '?access_token={access_token}&uid={u_id}'.format(
                    u_id=uid, access_token=access_token))
                infodats = info_data.text
                info = json.loads(infodats)
                return render_template('front/bind_email.html', ads=ads,info=info,uid=uid)
        return render_template('front/index.html')
    else:
        form = BindWeiboForm(request.form)
        if form.validate():
            email = form.email.data
            gender = request.form.get('gender')
            uid = request.form.get('uid')
            weibo_desc = request.form.get('weibo_desc')
            avatar = request.form.get('avatar')
            nickname = request.form.get('nickname')
            user = FrontUserModel.query.filter_by(email=email).first()
            if user:
                return restful.params_error(message='此邮箱已经被绑定，请换个邮箱再试~')
            u = FrontUserModel(email=email,avatar=avatar,password=' ',nickname=nickname,gender=gender,signature=weibo_desc,weibo_id=uid)
            db.session.add(u)
            db.session.commit()
            session[config.FRONT_USER_ID] = u.id
            return restful.success(data=u.id)
        else:
            return restful.params_error(get_error(form))


@bp.route('/weibo_login/')
def weibo_login():
    url = weibo.authorize_url+'?client_id={client_id}&redirect_uri={redirect_uri}'.format(client_id=weibo.client_id,redirect_uri=weibo.redirect_uri)
    return redirect(url)


from urllib import parse
@bp.route('/share/')
def share():
    access_token = session.get('access_token')
    if access_token:
        status = '我是分享的内容啊我是分享的内容啊http://www.donghao.club/post_detail/i64LjvbB5qq2Fji5MENp7o/?lang=ch'
        resp = requests.post(weibo.share_url+'?access_token={access_token}&status={status}'
                                       ''.format(access_token=access_token,status=parse.quote(status)))
        print(resp.text)
        return '分享成功'
    else:
        return '你不是微博用户'


@bp.route('/test/')
def test():
    return render_template('test.html')


import shortuuid
from hashlib import md5

@bp.route('/sopprt/',methods=['POST','GET'])
def sopprt():
    if request.method == 'GET':
        uid = '2bebf6aa88b05029032d3d93'
        notify_url = 'http://47.107.66.196/reutrn_alipay/'
        return_url = 'http://47.107.66.196/sopprt/'
        orderid = str(shortuuid.uuid())
        orderuid = '1417766861'
        goodsname = '支持我'
        context = {
            'uid':uid,'notify_url':notify_url,'return_url':return_url,'orderid':orderid,'orderuid':orderuid,'goodsname':goodsname,
        }
        return render_template('front/sopprt.html',**context)
    else:
        token = '6c0c5502dc1f9c75bd52f651a8d6c500'
        uid = '2bebf6aa88b05029032d3d93'
        goodsname = request.form.get('goodsname')
        istype = request.form.get('istype')
        notify_url = request.form.get('notify_url')
        return_url = request.form.get('return_url')
        orderuid = request.form.get('orderuid')
        orderid = request.form.get('orderid')
        price = request.form.get('price')
        key = md5((goodsname + istype + notify_url + orderid + orderuid + price + return_url + token + uid).encode(
        "utf-8")).hexdigest()
        return restful.success(data=key)






