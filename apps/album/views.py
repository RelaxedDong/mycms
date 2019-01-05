#encoding:utf-8

from flask import Flask,render_template,request,g,Blueprint,redirect,url_for,jsonify,g
from exct import db
from .models import AlbumModel,ImagesModel,Album_CommentModel,Album_StarModel,AlbumTagsModel,album_tag
from apps.front.models import FrontUserModel
from apps.common.models import PostsModel,FocusModel,AdvertisementModel
from .forms import CommentForm,AcommentForm
from apps.front.decorators import login_required
from .forms import CreateAlbumForm
from utils import restful
import uuid
import threading
import config
from flask_paginate import Pagination,get_page_parameter
from werkzeug.utils import secure_filename
from utils.upload import bucket,change_filename,base_images_url
bp = Blueprint('album',__name__,url_prefix='/b')




local = threading.local()

def get_error(form):
    message = form.errors.popitem()[1][0]
    return message


def get_paginat(page,count):
    pagination = Pagination(bs_version=3, total=count, page=page)
    return pagination


@bp.app_template_filter('fengmian')
def fengmian(album_id):
        image = ImagesModel.query.filter_by(album_id=album_id).order_by(-ImagesModel.create_time.desc()).first()
        if album_id and image:
            return image.url
        else:
            return 'https://donghaocms.oss-cn-beijing.aliyuncs.com/u%3D1958156797%2C2527501323%26fm%3D26%26gp%3D0.jpg'

from sqlalchemy import func
@bp.route('/')
def index():
    albums = AlbumModel.query.all()
    tagnames = db.session.query(AlbumTagsModel.tagname, func.count(AlbumTagsModel.id)). \
        join(album_tag).group_by(AlbumTagsModel.tagname).order_by(func.count(AlbumTagsModel.id).desc()).all()

    page = request.args.get(get_page_parameter(), type=int, default=1)
    start = (page - 1) * config.Album_PERPAGE
    end = start + config.Album_PERPAGE
    posts_obj = None
    elit = request.args.get('elit', default=1, type=int)
    tag_name = request.args.get('tag', default='all', type=str)
    if elit ==3:
        posts_obj = AlbumModel.query.order_by(AlbumModel.create_time.desc())
    elif elit == 1:
        posts_obj = db.session.query(AlbumModel).outerjoin(Album_CommentModel).group_by(AlbumModel.id). \
            order_by(func.count(Album_CommentModel.id).desc())
    elif elit == 2:
        posts_obj = AlbumModel.query.order_by(AlbumModel.see_count.desc())

    if tag_name and tag_name!='all':
        tag_obj = AlbumTagsModel.query.filter_by(tagname=tag_name).first()
        albums = tag_obj.album
        count = len(albums)
    else:
        albums = posts_obj.slice(start,end)
        count = posts_obj.count()
    paginate = get_paginat(page,count)
    return  render_template('album/index.html',albums=albums,paginate=paginate,elit=elit,tagnames=tagnames,tag_name=tag_name)


@bp.route('/my_album/<user_id>')
@login_required
def my_album(user_id):
    user = FrontUserModel.query.get(user_id)
    posts = PostsModel.query.filter_by(author_id=user_id).order_by(PostsModel.create_time.desc()).slice(1,5)
    albums = AlbumModel.query.filter_by(author_id=user.id).all()

    focus = FocusModel.query.filter_by(own_user_id=user.id).all()
    wodefensi = [user.author.id for user in focus]

    context = {
        'user':user,
        'albums':albums,
        'posts':posts,
        'wodefensi':wodefensi
    }
    return render_template('album/my_album.html',**context)

@bp.route('/create_album/',methods=["POST"])
@login_required
def create_album():
    form = CreateAlbumForm(request.form)
    if form.validate():
        user = g.front_user
        album_title = form.album_title.data
        desc = form.desc.data
        album =  AlbumModel(name=album_title,desc=desc,author_id=user.id)
        db.session.add(album)
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message=get_error(form))




@bp.route('/img_list/<album_id>')
@login_required
def img_list(album_id):
    thisalbum = AlbumModel.query.get(album_id)
    tags = db.session.query(AlbumTagsModel).all()
    tagnames = [tag.tagname for tag in tags]
    if thisalbum.power == 1:
        if not g.front_user or g.front_user!=thisalbum.author:
            return redirect(url_for('album.my_album',user_id=thisalbum.id))
    images = ImagesModel.query.filter_by(album_id=album_id).all()
    return render_template('album/image_list.html',images=images,thisalbum=thisalbum,tagnames=tagnames)

# # 进度
rate = 0


#上传进度
def percentage(consumed_bytes, total_bytes):
    if total_bytes:
        global rate
        rate = int(100 * (float(consumed_bytes) / float(total_bytes)))


@bp.route('/upload_imges/',methods=["POST"])
@login_required
def upload_imges():
    global rate
    rate = 0
    count = request.form.get('count')
    album_id = request.form.get('album_id')
    album = AlbumModel.query.get(album_id)
    if count and album_id:
        for i in range(0,int(count)):
            file = request.files[str(i)]
            file_name = secure_filename(change_filename(file.filename)+uuid.uuid4().hex[:10]+'')
            bucket.put_object('images/' + file_name + '.jpg', file,progress_callback=percentage)
            image = ImagesModel(url=base_images_url+file_name+'.jpg',album_id=album_id)
            if album.author == g.front_user:
                rate = 0
                db.session.add(image)
        db.session.commit()
        return restful.success()
    else:
        return restful.server_error()

#前端返回进度
@bp.route('/getrate/')
@login_required
def getrate():
    global rate
    return jsonify({'progress':rate})


@bp.route('/album_detail/<album_id>')
def album_detail(album_id):
    ads = AdvertisementModel.query.all()
    album = AlbumModel.query.get(album_id)
    #粉丝数量
    focus = FocusModel.query.filter_by(own_user_id=album.author.id).all()
    wodefensi = [user.author.id for user in focus]
    comments = Album_CommentModel.query.filter_by(album_id=album_id).order_by(Album_CommentModel.create_time.desc()).all()
    album.see_count +=1
    db.session.commit()
    author = album.author
    count = 0
    for albumz in author.albums:
        count += len(albumz.images)
    context = {
        'album':album,
        'count':count,
        'user':author,
        'wodefensi':wodefensi,
        'comments':comments,
        'ads':ads
    }
    return render_template('album/album_detail.html',**context)

@bp.route('/power/',methods=['POST'])
@login_required
def power():
    choose = request.form.get('choose')
    album_id = request.form.get('album_id')
    if choose and album_id:
        album = AlbumModel.query.get(album_id)
        if choose == 'self':
            album.power = 1
        else:
            album.power = 0
        db.session.commit()
        return restful.success()
    else:
        return restful.server_error()
#点赞
@bp.route('/album_star/',methods=['POST'])
@login_required
def album_star():
    album_id = request.form.get('album_id')
    star_model = Album_StarModel.query.filter_by(album_id=album_id, author_id=g.front_user.id).first()
    if star_model:
        return restful.params_error('你已经点赞了')
    star = Album_StarModel(album_id=album_id, author_id=g.front_user.id)
    db.session.add(star)
    db.session.commit()
    return restful.success()

#评论
@bp.route('/comment/',methods=['POST'])
@login_required
def comment():
    form = CommentForm(request.form)
    if form.validate():
        content = form.content.data
        album_id = form.album_id.data
        comment = Album_CommentModel(content=content)
        comment.album_id = album_id
        comment.author = g.front_user
        comment.author.points += 1
        db.session.add(comment)
        db.session.commit()
        return restful.success()
    else:
        return restful.params_error(message=get_error(form))

#多级评论
@bp.route('/acomment/',methods=['POST'])
@login_required
def acomment():
    form = AcommentForm(request.form)
    if form.validate():
        album_id = form.album_id.data
        comment_id = form.comment_id.data
        content = form.content.data

        comment = Album_CommentModel(content=content, origin_comment_id=comment_id)
        comment.album_id = album_id
        comment.author = g.front_user
        comment.author.points += 1
        db.session.add(comment)
        db.session.commit()
        return restful.success()

# 删除评论
@bp.route('/delcomment/',methods=['POST'])
@login_required
def delcomment():
    comment_id = request.form.get('comment_id')
    if comment_id:
        comment = Album_CommentModel.query.get(comment_id)
        db.session.delete(comment)
        db.session.commit()
        return restful.success()
    else:
        return restful.server_error()

#添加标签
@bp.route('/addtags/',methods=['POST'])
@login_required
def addtags():
    album_id = request.form.get('album_id')
    tags = request.form.get('tags').split(',')
    if album_id and len(tags)>0:
        album = AlbumModel.query.get(album_id)
        havetags = [tag.tagname for tag in album.tags]
        if len(album.tags)>3:
            return restful.params_error(message='相册最多三个标签')
        all_tags = AlbumTagsModel.query.all()
        all_tagnames = [tag.tagname for tag in all_tags]

        if album.author!=g.front_user:
            return restful.server_error()
        for tag in tags:
            if tag in havetags:
                return restful.params_error(message=tag+'标签已经存在,请重新添加！')
            if tag in all_tagnames:
                ta = AlbumTagsModel.query.filter_by(tagname=tag.strip()).first()
            else:
                ta = AlbumTagsModel(tagname=tag)
            album.tags.append(ta)
        db.session.add(ta)
        db.session.commit()
        return restful.success()
    else:
        return restful.server_error()

#删除照片
@bp.route('/drop_img/',methods=['POST'])
@login_required
def drop_img():
    img_id = request.form.get('img_id')
    img = ImagesModel.query.get(img_id)
    if img and img.album.author == g.front_user:
        url = img.url.split('https://donghaocms.oss-cn-beijing.aliyuncs.com/')[1]
        db.session.delete(img)
        db.session.commit()
        bucket.delete_object(url)
        return restful.success()
    else:
        return restful.server_error()