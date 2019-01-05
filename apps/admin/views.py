#encoding:utf-8
from flask import Blueprint,render_template,jsonify,redirect,views,request,session,g
from .decorators import login_required
from utils import restful
from apps.album.models import ImagesModel,AlbumModel,Album_CommentModel
from apps.front.models import FrontUserModel
from .models import CMSUserModel
from apps.common.models import PostsModel,CommentModel,BannerModel,HighlightModel,StarModel,AdvertisementModel,ErrorModel
from exct import db
from datetime import datetime
from .forms import LoginForm,ResetpwdForm,BannerForm,Abanner
import config
from utils.upload import bucket
from apps.front.views import get_paginat
from utils.upload import bucket,change_filename
from sqlalchemy.sql import func
from werkzeug.utils import secure_filename
from bson import ObjectId

from utils import my_bar
REMOTE_HOST = "https://pyecharts.github.io/assets/js"
bp = Blueprint('cms',__name__,url_prefix='/cms')




@bp.route('/index/')
@login_required
def index():
    now = datetime.now()
    posts = PostsModel.query.all()
    comments = CommentModel.query.all()
    user_count = FrontUserModel.query.count()
    img_count = ImagesModel.query.count()
    my_bar.change_day()
    for comment in comments:
        create_time = comment.create_time
        create_time = comment.create_time
        timestamp = (now - create_time).total_seconds()
        my_bar.create_time(timestamp)

    pie = my_bar.create_pie_bar()
    c_day1 = my_bar.day1
    my_bar.change_day()
    for post in posts:
        create_time = post.create_time
        timestamp = (now-create_time).total_seconds()
        my_bar.create_time(timestamp)

    bar = my_bar.create_post_bar()
    day1 = my_bar.day1
    context = {
        'day1':day1,
        'user_count':user_count,
        'c_day1':c_day1,
        'mypie':pie.render_embed(),
        'host':REMOTE_HOST,
        'myechart': bar.render_embed(),
        'jsfile_name':bar.get_js_dependencies()[0],
        'script_list_pie':pie.get_js_dependencies()[0],
        'img_count':img_count
    }
    return render_template('admin/cms_index.html',**context)


class LoginView(views.MethodView):
    def get(self):
        return render_template('login.html')
    def post(self):
        form = LoginForm(request.form)
        if form.validate():
            email = form.email.data
            password = form.password.data
            user = CMSUserModel.query.filter_by(email=email).first()
            if user and user.check_pwd(password):
                session[config.CMS_USER_ID] = user.id
                return restful.success()
            else:
                return restful.params_error('邮箱或密码错误')
        else:
            message = form.errors.popitem()[1][0]
            return restful.params_error(message)
bp.add_url_rule('/login/',view_func=LoginView.as_view('login'))

class LogoutView(views.MethodView):
    def get(self):
        del session[config.CMS_USER_ID]
        return render_template('login.html')
bp.add_url_rule('/logout/',view_func=LogoutView.as_view('logout'))


@bp.route('/profile/')
@login_required
def profile():
    return render_template('admin/cms_profile.html')

@bp.route('/resetpwd/',methods=['GET','POST'])
@login_required
def resetpwd():
    if request.method == 'GET':
        return render_template('admin/cms_resetpwd.html')
    else:
        form = ResetpwdForm(request.form)
        if form.validate():
            oldpwd = form.oldpwd.data
            newpwd = form.newpwd.data
            newpwd2 = form.newpwd2.data
            user = g.cms_user
            if not user.check_pwd(oldpwd):
                return restful.params_error('旧密码错误！')
            else:
                user.password = newpwd
                db.session.commit()
                return restful.success()
        else:
            message = form.errors.popitem()[1][0]

            return restful.params_error(message)

@bp.route('/abanner/',methods=['POST'])
@login_required
def abanner():
    form = Abanner(request.form)
    if form.validate():
        type = request.form.get('type')
        banner_id = request.form.get('banner_id')
        img_url = request.form.get('filename')
        banner_content = request.form.get('banner_content')
        link_url = request.form.get('link_url')
        priority = request.form.get('priority')

        if type=='abanner-save':
            banner = BannerModel(weight=priority,img_url=img_url,link_url=link_url,content=banner_content,username=g.cms_user.username)
            db.session.add(banner)
            db.session.commit()
        else:
            banner = BannerModel.query.get(banner_id)
            banner.weight = priority
            banner.img_url = img_url
            banner.link_url = link_url
            banner.content = banner_content
            banner.username = g.cms_user.username
            db.session.commit()
        return restful.success()
    else:
        message = form.errors.popitem()[1][0]
        return restful.params_error(message)



@bp.route('/banners/',methods=['GET','POST'])
@login_required
def banners():
    if request.method == 'GET':
        igs = BannerModel.query.order_by(BannerModel.weight.desc()).all()
        return render_template('admin/cms_banner.html',igs=igs)
    else:
        form = BannerForm(request.form)
        if form.validate():
            banners_id = request.form.get('banner_id')
            banner = BannerModel.query.get(banners_id)
            url = banner.img_url.split('https://donghaocms.oss-cn-beijing.aliyuncs.com/')
            if len(url) > 1:
                bucket.delete_object(url[1])
            db.session.delete(banner)
            db.session.commit()
            return restful.success()
        else:
            message = form.errors.popitem()[1][0]
            return restful.params_error(message)



@bp.route('/upload/',methods=['POST'])
@login_required
def upload():
    file = request.files['file']
    file_name = secure_filename(change_filename(file.filename))
    bucket.put_object(file_name,file)
    alibase = 'https://donghaocms.oss-cn-beijing.aliyuncs.com/'
    return restful.success(data=alibase+file_name)


import re
from flask_paginate import get_page_parameter,Pagination
@bp.route('/posts/',methods=['GET','POST'])
@login_required
def posts():
    if request.method == 'GET':
        page = request.args.get(get_page_parameter(), type=int, default=1)
        start = (page - 1) * config.PERPAGE
        end = start + config.PERPAGE
        pagination = get_paginat(page)
        posts_obj = None
        elit = request.args.get('elit',default=1,type=int)
        if elit ==1:
            posts_obj = PostsModel.query.order_by(PostsModel.read_count.desc())
        elif elit == 2:
            posts_obj = db.session.query(PostsModel).outerjoin(CommentModel).group_by(PostsModel.id).\
                order_by(func.count(CommentModel.id).desc())
        elif elit == 3:
            posts_obj = db.session.query(PostsModel).outerjoin(StarModel).group_by(PostsModel.id). \
                order_by(func.count(StarModel.id).desc())
        elif elit ==4:
            posts_obj = PostsModel.query.order_by(PostsModel.create_time.desc())
        posts = posts_obj.slice(start,end)
        pagination = pagination
        return render_template('admin/cms_posts.html',posts=posts,pagination=pagination)
    else:
        post_id = request.form.get('post_id')
        post = PostsModel.query.get(post_id)
        imgs = re.findall(r'<img src="https://donghaocms.oss-cn-beijing.aliyuncs.com/(.*?)"',post.content,re.S)
        if len(imgs)>0:
            [bucket.delete_object(img) for img in imgs]
        db.session.delete(post)
        db.session.commit()
        return restful.success()

from sqlalchemy import or_
#批量删除帖子
@bp.route('/post_large_del/',methods=['POST'])
@login_required
def post_large_del():
    post_ids = request.form.get('comment_ids')
    if post_ids:
        posts_ids = post_ids.split(',')
        for po in posts_ids:
            post = PostsModel.query.get(po)
            imgs = re.findall(r'<img src="https://donghaocms.oss-cn-beijing.aliyuncs.com/(.*?)"', post.content, re.S)
            if len(imgs) > 0:
                [bucket.delete_object(img) for img in imgs]
            db.session.delete(post)
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message='帖子不存在')



@bp.route('/hight_light/',methods=['POST'])
@login_required
def hight_light():
    post_id = request.form.get('post_id')
    type = request.form.get('type')
    if post_id:
        if type == 'hilight':
            high = HighlightModel(post_id=post_id)
            have = HighlightModel.query.filter(HighlightModel.post_id==post_id).first()
            if have:
                db.session.delete(have)
            db.session.add(high)
            db.session.commit()
        else:
            high = HighlightModel.query.filter_by(post_id=post_id).first()
            db.session.delete(high)
            db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message='网络错误')


@bp.route('/comments/',methods=['GET','POST'])
@login_required
def comments():
    if request.method == 'GET':
        inputs = request.args.get("comment_search")
        if inputs:
            # search_comments = CommentModel.query.filter(or_(CommentModel.content.contains(inputs),PostsModel.content.contains(inputs)
            #                               ,PostsModel.title.contains(inputs))).all()
            search_comments = db.session.query(CommentModel).outerjoin(PostsModel).filter(
                or_(CommentModel.content.contains(inputs), PostsModel.content.contains(inputs)
                ,PostsModel.title.contains(inputs))
            ).all()
            return render_template('admin/cms_comments.html', comments=search_comments, pagination='')

        elit = request.args.get('elit', default=1, type=int)
        page = request.args.get(get_page_parameter(), type=int, default=1)
        start = (page - 1) * config.PERPAGE
        end = start + config.PERPAGE
        pagination = get_paginat(page)
        if elit ==1:
            comments = CommentModel.query.order_by(CommentModel.create_time.desc()).slice(start,end)
        return render_template('admin/cms_comments.html',comments=comments,pagination=pagination)
    else:
        comment_id = request.form.get('comment_id')
        comment = CommentModel.query.get(comment_id)
        db.session.delete(comment)
        db.session.commit()
        return restful.success()

@bp.route('/users/')
@login_required
def users():
    input_user = request.args.get('input')
    if input_user:
        users = FrontUserModel.query.filter(or_(FrontUserModel.nickname.contains(input_user),
                                                FrontUserModel.email.contains(input_user),FrontUserModel.signature.contains(input_user),
                                                FrontUserModel.realname.contains(input_user))).all()
        return render_template('admin/cms_front_users.html', users=users)
    users = FrontUserModel.query.all()
    return render_template('admin/cms_front_users.html',users=users)


@bp.route('/freeze/',methods=['POST'])
@login_required
def freeze():
    user_id = request.form.get('user_id')
    user = FrontUserModel.query.get(user_id)
    my_type = request.form.get('type')
    if my_type =='freeze':
       user.is_active = 0
    else:
        user.is_active = 1
    db.session.commit()
    return restful.success()


@bp.route('/img_large_del/',methods=["POST"])
@login_required
def img_large_del():
    imgs_ids = request.form.get('imgs_ids')
    if imgs_ids:
        img_ids = imgs_ids.split(',')
        for id in img_ids:
            album = AlbumModel.query.get(id)
            for img in album.images:
                url = img.url.split('https://donghaocms.oss-cn-beijing.aliyuncs.com/')[1]
                bucket.delete_object(url)
                db.session.delete(img)
            db.session.delete(album)
        db.session.commit()
        return restful.success()
    else:
        return restful.server_error()


@bp.route('/images/')
@login_required
def images():
    inputs = request.args.get('img_search')
    if inputs:
        albums = AlbumModel.query.filter(or_(AlbumModel.desc.contains(inputs),AlbumModel.name.contains(inputs))).all()
        return render_template('admin/cms_imgs.html', albums=albums,pagination='')
    elit = request.args.get('elit', default=1, type=int)
    page = request.args.get(get_page_parameter(), type=int, default=1)
    perpage = 18
    start = (page - 1) * perpage
    end = start + perpage
    pagination = get_paginat(page)
    if elit == 1:
        posts_obj = AlbumModel.query.order_by(AlbumModel.create_time.desc())
    elif elit == 3:
        posts_obj = db.session.query(AlbumModel).outerjoin(Album_CommentModel).group_by(AlbumModel.id). \
            order_by(func.count(Album_CommentModel.id).desc())
    elif elit == 2:
        posts_obj = AlbumModel.query.order_by(AlbumModel.see_count.desc())
    albums = posts_obj.slice(start,end)
    return render_template('admin/cms_imgs.html',albums=albums,pagination=pagination)

@bp.route('/advertisement/',methods=['GET','POST'])
@login_required
def advertisement():
    if request.method == 'GET':
        ads = AdvertisementModel.query.all()
        return render_template('admin/cms_advertisement.html',ads=ads)
    else:
        img_url = request.form.get('img_url')
        link_url = request.form.get('link_url')
        ad = AdvertisementModel(img_url=img_url,link_url=link_url,author_id=g.cms_user.id,is_using=1)
        db.session.add(ad)
        db.session.commit()
        return restful.success()


@bp.route('/ad_type/',methods=['POST'])
@login_required
def ad_type():
    ad_id = request.form.get('ad_id')
    album = AdvertisementModel.query.get(ad_id)
    if album.is_using == 0:
        album.is_using = 1
    else:
        album.is_using = 0
    db.session.commit()
    return restful.success()

@bp.route('/del_ad/',methods=['POST'])
@login_required
def del_ad():
    ad_id = request.form.get('ad_id')
    if ad_id:
        ad = AdvertisementModel.query.get(ad_id)
        url = ad.img_url.split('https://donghaocms.oss-cn-beijing.aliyuncs.com/')
        if len(url)>1:
            bucket.delete_object(url[1])
        db.session.delete(ad)
        db.session.commit()
        return restful.success()
    else:
        return restful.server_error()
# 异常处理
@bp.route('/handle/',methods=['GET','POST'])
@login_required
def handle():
    if request.method == 'GET':
        errors = ErrorModel.query.all()
        return render_template('admin/cms_handle_error.html',errors=errors)
    else:
        error_id = request.form.get('error_id')
        error = ErrorModel.query.get(error_id)
        if error:
            db.session.delete(error)
            db.session.commit()
            return restful.success()
        else:
            return restful.params_error(message='错误不存在')

@bp.route('/error_type/',methods=['POST'])
@login_required
def error_type():
    error_id = request.form.get('error_id')
    error = ErrorModel.query.get(error_id)
    if error:
        if error.status == 0:
            error.status = 1
        else:
            error.status = 0
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message='错误不存在')

@bp.app_template_filter('guser')
def guser(user_id):
    user = FrontUserModel.query.get(user_id)
    return user

@bp.app_template_filter('imgs_len')
def imgs_len(albums):
    print(albums)
    count = 0
    for albun in albums:
        count += len(albun.images)
    return count