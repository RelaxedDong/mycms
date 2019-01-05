#encoding:utf-8

from exct import db
from datetime import datetime
import shortuuid


class PostsModel(db.Model):
    __tablename__ = 'posts'
    id = db.Column(db.String(150),primary_key=True,default=shortuuid.uuid)
    title = db.Column(db.String(150),nullable=False)
    content = db.Column(db.Text,nullable=False)
    create_time = db.Column(db.DateTime,default=datetime.now)
    read_count = db.Column(db.Integer,default=0)
    author_id = db.Column(db.String(150),db.ForeignKey("front_user.id"))
    author = db.relationship("FrontUserModel",backref='posts')

post_tag = db.Table(
    'post_tag',
    db.Column('post_id',db.ForeignKey("posts.id"),primary_key=True),
    db.Column('tag_id',db.ForeignKey("tag.id"),primary_key=True)
)
# 标签

class TagsModel(db.Model):
    __tablename__ = 'tag'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    tagname = db.Column(db.String(150))
    posts = db.relationship("PostsModel",backref='tags',secondary=post_tag)


# 点赞
class StarModel(db.Model):
    __tablename__ = 'star'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    post_id = db.Column(db.String(150),db.ForeignKey("posts.id"))
    author_id = db.Column(db.String(100),db.ForeignKey("front_user.id"))
    author = db.relationship("FrontUserModel",backref='stars')
    post = db.relationship("PostsModel",backref='stars')

#收藏

class CollectModel(db.Model):
    __tablename__ = 'collect'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    collect_time = db.Column(db.DateTime,default=datetime.now)
    post_id = db.Column(db.String(150),db.ForeignKey("posts.id"))
    author_id = db.Column(db.String(100),db.ForeignKey("front_user.id"))

    post = db.relationship("PostsModel",backref='collects')
    author = db.relationship("FrontUserModel",backref='collects')
#评论

class CommentModel(db.Model):
    __tablename__ = 'comment'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    content = db.Column(db.Text,nullable=False)
    create_time = db.Column(db.DateTime,default=datetime.now)
    post_id = db.Column(db.String(150),db.ForeignKey("posts.id"))
    author_id = db.Column(db.String(100),db.ForeignKey("front_user.id"))
    origin_comment_id = db.Column(db.Integer,db.ForeignKey("comment.id"))

    post = db.relationship("PostsModel",backref="comments")
    author = db.relationship("FrontUserModel",backref="comments")
    origin_comment = db.relationship("CommentModel",backref="replys",remote_side =[id])


class FocusModel(db.Model):
    __tablename__ = 'focus'
    id=db.Column(db.Integer,primary_key=True,autoincrement=True)
    focus_time = db.Column(db.DateTime,default=datetime.now)
    own_user_id = db.Column(db.String(150),nullable=False)
    author_id = db.Column(db.String(100),db.ForeignKey("front_user.id"),nullable=False)

    author = db.relationship("FrontUserModel",backref='focuses')

class HighlightModel(db.Model):
    __tablename__ = 'hightlight_post'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    post_id = db.Column(db.String(150),db.ForeignKey("posts.id"))
    create_time = db.Column(db.DateTime,default=datetime.now)
    post = db.relationship("PostsModel",backref='hightlight')

class BannerModel(db.Model):
    __tablename__ = 'banner'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    username = db.Column(db.String(100))
    weight = db.Column(db.String(20))
    img_url = db.Column(db.String(400))
    link_url = db.Column(db.String(200))
    content = db.Column(db.Text)
    create_time = db.Column(db.DateTime, default=datetime.now)


class AdvertisementModel(db.Model):
    __tablename__ = 'advertisement'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    author_id = db.Column(db.Integer,nullable=False)
    create_time = db.Column(db.DateTime,default=datetime.now)
    img_url = db.Column(db.String(400))
    link_url = db.Column(db.String(200))
    is_using = db.Column(db.Integer,default=1)



# 举报管理
class ErrorModel(db.Model):
    __tablename__ = 'error'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    type = db.Column(db.String(50),nullable=False)
    reporter = db.Column(db.String(150),nullable=False)
    bereporter = db.Column(db.String(150),nullable=False)
    content = db.Column(db.Text,nullable=False)
    create_time = db.Column(db.DateTime,default=datetime.now)
    place = db.Column(db.String(150))
    status = db.Column(db.Integer,default=0)


















